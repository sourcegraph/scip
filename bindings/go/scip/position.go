package scip

// Range represents a range between two offset positions.
// NOTE: the github.com/sourcegraph/sourcegraph/lib/codeintel/lsif/protocol package
// contains similarly shaped structs but this one exists primarily to make it
// easier to work with SCIP encoded positions, which have the type []int32
// in Protobuf payloads.
type Range struct {
	Start Position
	End   Position
}

// Position represents an offset position.
type Position struct {
	Line      int32
	Character int32
}

// NewRange converts an SCIP range into `Range`
func NewRange(scipRange []int32) *Range {
	var endLine int32
	var endCharacter int32
	if len(scipRange) == 3 { // single line
		endLine = scipRange[0]
		endCharacter = scipRange[2]
	} else if len(scipRange) == 4 { // multi-line
		endLine = scipRange[2]
		endCharacter = scipRange[3]
	}
	return &Range{
		Start: Position{
			Line:      scipRange[0],
			Character: scipRange[1],
		},
		End: Position{
			Line:      endLine,
			Character: endCharacter,
		},
	}
}

func (r Range) IsSingleLine() bool {
	return r.Start.Line == r.End.Line
}

func (r Range) SCIPRange() []int32 {
	if r.Start.Line == r.End.Line {
		return []int32{r.Start.Line, r.Start.Character, r.End.Character}
	}
	return []int32{r.Start.Line, r.Start.Character, r.End.Line, r.End.Character}
}
