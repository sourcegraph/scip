package scip

import (
	"io"

	"google.golang.org/protobuf/encoding/protowire"
	"google.golang.org/protobuf/proto"

	"github.com/sourcegraph/sourcegraph/lib/errors"
)

// This is a struct of functions rather than an interface since Go
// doesn't support adding new functions to interfaces with default
// implementations, so adding new functions here for new fields in
// the SCIP schema would break clients.
type ProcessIndex struct {
	ProcessMetadata       func(*Metadata)
	ProcessDocument       func(*Document)
	ProcessExternalSymbol func(*SymbolInformation)
}

// readVarint attempts to read a varint, using scratchBuf for temporary storage
//
// scratchBuf should be able to accommodate any varint size
// based on its capacity, and be cleared before readVarint is called
func readVarint(r io.Reader, scratchBuf []byte) (uint64, error) {
	//buf := make([]byte, 10, 0)
	nextByteBuf := make([]byte, 1, 1)
	for i := 0; i < cap(scratchBuf); i++ {
		numRead, err := r.Read(nextByteBuf)
		if err != nil {
			return 0, errors.Wrapf(err, "failed to read %d-th byte of Varint. soFar: %v", i, scratchBuf)
		}
		if numRead == 0 {
			return 0, errors.Newf("failed to read %d-th byte of Varint. soFar: %v", scratchBuf)
		}
		nextByte := nextByteBuf[0]
		scratchBuf = append(scratchBuf, nextByte)
		if nextByte <= 127 { // https://protobuf.dev/programming-guides/encoding/#varints
			// Continuation bit is not set, so Varint must've ended
			break
		}
	}
	value, errCode := protowire.ConsumeVarint(scratchBuf)
	if errCode < 0 {
		return value, protowire.ParseError(errCode)
	}
	return value, nil
}

func indexFieldName(i protowire.Number) string {
	if i == 0 {
		return "metadata"
	} else if i == 1 {
		return "documents"
	} else if i == 2 {
		return "external_symbols"
	}
	return "<unknown>"
}

// ParseStreaming processes an index by incrementally reading input from the io.Reader.
func ParseStreaming(r io.Reader, pi ProcessIndex) error {
	// (field_number << 3) | wire_type
	// The tag is a varint with field number between 0-2
	// So it will always fit in 1 byte
	tagBuf := make([]byte, 1)
	// Maximum size of varint is 10 bytes
	// https://protobuf.dev/programming-guides/encoding/#varints
	lenBuf := make([]byte, 10, 0)
	dataBuf := make([]byte, 1024, 0)

	for {
		numRead, err := r.Read(tagBuf)
		if err == io.EOF {
			return nil
		}
		if err != nil {
			return errors.Wrapf(err, "failed to read from index reader: %w")
		}
		if numRead == 0 {
			return errors.New("read 0 bytes from index")
		}
		fieldIndex, fieldType, fieldLen := protowire.ConsumeTag(tagBuf)
		if fieldLen < 0 {
			return errors.Wrap(protowire.ParseError(fieldLen), "failed to consume tag")
		}
		// In all these three cases, we need to check that the fieldType is LEN
		// (because of the embedded message), read the length, resize the scratch buffer,
		// read that many bytes, then parser the buffer accordingly and pass that to the
		// underlying thing
		switch fieldIndex {
		// As per scip.proto, all of Metadata, Document and SymbolInformation are submessages
		case 0, 1, 2:
			if fieldType != protowire.BytesType {
				return errors.Newf("expected LEN type tag for %s", indexFieldName(fieldIndex))
			}
			lenBuf = lenBuf[:0]
			dataLen, err := readVarint(r, lenBuf)
			if err != nil {
				return errors.Wrapf(err, "failed to read length for %s", indexFieldName(fieldIndex))
			}
			if dataLen > uint64(cap(dataBuf)) {
				dataBuf = make([]byte, dataLen)
			} else {
				dataBuf = dataBuf[:0]
				for i := uint64(0); i < dataLen; i++ {
					dataBuf = append(dataBuf, 0)
				}
			}
			numRead, err := r.Read(dataBuf)
			if err != nil {
				return errors.Wrapf(err, "failed to read data for %s", indexFieldName(fieldIndex))
			}
			if uint64(numRead) != dataLen {
				return errors.Newf("expected to read %d bytes based on LEN but read %d bytes", dataLen, numRead)
			}
			if fieldIndex == 0 && pi.ProcessMetadata != nil {
				m := Metadata{}
				if err := proto.Unmarshal(dataBuf, &m); err != nil {
					return errors.Wrapf(err, "failed to read %s", indexFieldName(fieldIndex))
				}
				pi.ProcessMetadata(&m)
			} else if fieldIndex == 1 && pi.ProcessDocument != nil {
				d := Document{}
				if err := proto.Unmarshal(dataBuf, &d); err != nil {
					return errors.Wrapf(err, "failed to read %s", indexFieldName(fieldIndex))
				}
				pi.ProcessDocument(&d)
			} else if fieldIndex == 2 && pi.ProcessExternalSymbol != nil {
				s := SymbolInformation{}
				if err := proto.Unmarshal(dataBuf, &s); err != nil {
					return errors.Wrapf(err, "failed to read %s", indexFieldName(fieldIndex))
				}
				pi.ProcessExternalSymbol(&s)
			} else {
				return errors.Newf("added new field in scip.Index but forgot to add unmarshaling code")
			}
		default:
			return errors.Newf("added new field in scip.Index but forgot to update streaming parser")
		}
	}
}