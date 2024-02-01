{- This file was auto-generated from scip.proto by the protoc-gen-haskell program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Scip (
        AnnotatedType(), Annotation(), BooleanConstant(), ByNameType(),
        ByteConstant(), CharConstant(), ClassSignature(), Constant(),
        Constant'SealedValue(..), _Constant'UnitConstant,
        _Constant'BooleanConstant, _Constant'ByteConstant,
        _Constant'ShortConstant, _Constant'CharConstant,
        _Constant'IntConstant, _Constant'LongConstant,
        _Constant'FloatConstant, _Constant'DoubleConstant,
        _Constant'StringConstant, _Constant'NullConstant, ConstantType(),
        Descriptor(), Descriptor'Suffix(..),
        Descriptor'Suffix(Descriptor'Package),
        Descriptor'Suffix'UnrecognizedValue, Diagnostic(),
        DiagnosticTag(..), DiagnosticTag(),
        DiagnosticTag'UnrecognizedValue, Document(), DoubleConstant(),
        ExistentialType(), FloatConstant(), Index(), IntConstant(),
        IntersectionType(), LambdaType(), Language(..), Language(),
        Language'UnrecognizedValue, LongConstant(), MatchType(),
        MatchType'CaseType(), Metadata(), MethodSignature(),
        NullConstant(), Occurrence(), Package(), PositionEncoding(..),
        PositionEncoding(), PositionEncoding'UnrecognizedValue,
        ProtocolVersion(..), ProtocolVersion(),
        ProtocolVersion'UnrecognizedValue, Relationship(), RepeatedType(),
        Scope(), Severity(..), Severity(), Severity'UnrecognizedValue,
        ShortConstant(), Signature(), Signature'SealedValue(..),
        _Signature'ClassSignature, _Signature'MethodSignature,
        _Signature'TypeSignature, _Signature'ValueSignature, SingleType(),
        StringConstant(), StructuralType(), SuperType(), Symbol(),
        SymbolInformation(), SymbolInformation'Kind(..),
        SymbolInformation'Kind(), SymbolInformation'Kind'UnrecognizedValue,
        SymbolRole(..), SymbolRole(), SymbolRole'UnrecognizedValue,
        SyntaxKind(..), SyntaxKind(IdentifierKeyword, IdentifierModule),
        SyntaxKind'UnrecognizedValue, TextEncoding(..), TextEncoding(),
        TextEncoding'UnrecognizedValue, ThisType(), ToolInfo(), Type(),
        Type'SealedValue(..), _Type'TypeRef, _Type'SingleType,
        _Type'ThisType, _Type'SuperType, _Type'ConstantType,
        _Type'IntersectionType, _Type'UnionType, _Type'WithType,
        _Type'StructuralType, _Type'AnnotatedType, _Type'ExistentialType,
        _Type'UniversalType, _Type'ByNameType, _Type'RepeatedType,
        _Type'MatchType, _Type'LambdaType, TypeRef(), TypeSignature(),
        UnionType(), UnitConstant(), UniversalType(), ValueSignature(),
        WithType()
    ) where
import qualified Data.ProtoLens.Runtime.Control.DeepSeq as Control.DeepSeq
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Prism as Data.ProtoLens.Prism
import qualified Data.ProtoLens.Runtime.Prelude as Prelude
import qualified Data.ProtoLens.Runtime.Data.Int as Data.Int
import qualified Data.ProtoLens.Runtime.Data.Monoid as Data.Monoid
import qualified Data.ProtoLens.Runtime.Data.Word as Data.Word
import qualified Data.ProtoLens.Runtime.Data.ProtoLens as Data.ProtoLens
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Bytes as Data.ProtoLens.Encoding.Bytes
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Growing as Data.ProtoLens.Encoding.Growing
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Parser.Unsafe as Data.ProtoLens.Encoding.Parser.Unsafe
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Encoding.Wire as Data.ProtoLens.Encoding.Wire
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Field as Data.ProtoLens.Field
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Message.Enum as Data.ProtoLens.Message.Enum
import qualified Data.ProtoLens.Runtime.Data.ProtoLens.Service.Types as Data.ProtoLens.Service.Types
import qualified Data.ProtoLens.Runtime.Lens.Family2 as Lens.Family2
import qualified Data.ProtoLens.Runtime.Lens.Family2.Unchecked as Lens.Family2.Unchecked
import qualified Data.ProtoLens.Runtime.Data.Text as Data.Text
import qualified Data.ProtoLens.Runtime.Data.Map as Data.Map
import qualified Data.ProtoLens.Runtime.Data.ByteString as Data.ByteString
import qualified Data.ProtoLens.Runtime.Data.ByteString.Char8 as Data.ByteString.Char8
import qualified Data.ProtoLens.Runtime.Data.Text.Encoding as Data.Text.Encoding
import qualified Data.ProtoLens.Runtime.Data.Vector as Data.Vector
import qualified Data.ProtoLens.Runtime.Data.Vector.Generic as Data.Vector.Generic
import qualified Data.ProtoLens.Runtime.Data.Vector.Unboxed as Data.Vector.Unboxed
import qualified Data.ProtoLens.Runtime.Text.Read as Text.Read
{- | Fields :
     
         * 'Proto.Scip_Fields.annotations' @:: Lens' AnnotatedType [Annotation]@
         * 'Proto.Scip_Fields.vec'annotations' @:: Lens' AnnotatedType (Data.Vector.Vector Annotation)@
         * 'Proto.Scip_Fields.tpe' @:: Lens' AnnotatedType Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' AnnotatedType (Prelude.Maybe Type)@ -}
data AnnotatedType
  = AnnotatedType'_constructor {_AnnotatedType'annotations :: !(Data.Vector.Vector Annotation),
                                _AnnotatedType'tpe :: !(Prelude.Maybe Type),
                                _AnnotatedType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show AnnotatedType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField AnnotatedType "annotations" [Annotation] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AnnotatedType'annotations
           (\ x__ y__ -> x__ {_AnnotatedType'annotations = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField AnnotatedType "vec'annotations" (Data.Vector.Vector Annotation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AnnotatedType'annotations
           (\ x__ y__ -> x__ {_AnnotatedType'annotations = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField AnnotatedType "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AnnotatedType'tpe (\ x__ y__ -> x__ {_AnnotatedType'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField AnnotatedType "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _AnnotatedType'tpe (\ x__ y__ -> x__ {_AnnotatedType'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Message AnnotatedType where
  messageName _ = Data.Text.pack "scip.AnnotatedType"
  packedMessageDescriptor _
    = "\n\
      \\rAnnotatedType\DC22\n\
      \\vannotations\CAN\ETX \ETX(\v2\DLE.scip.AnnotationR\vannotations\DC2\FS\n\
      \\ETXtpe\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXtpeJ\EOT\b\STX\DLE\ETX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        annotations__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "annotations"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Annotation)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"annotations")) ::
              Data.ProtoLens.FieldDescriptor AnnotatedType
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor AnnotatedType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 3, annotations__field_descriptor),
           (Data.ProtoLens.Tag 1, tpe__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _AnnotatedType'_unknownFields
        (\ x__ y__ -> x__ {_AnnotatedType'_unknownFields = y__})
  defMessage
    = AnnotatedType'_constructor
        {_AnnotatedType'annotations = Data.Vector.Generic.empty,
         _AnnotatedType'tpe = Prelude.Nothing,
         _AnnotatedType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          AnnotatedType
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Annotation
             -> Data.ProtoLens.Encoding.Bytes.Parser AnnotatedType
        loop x mutable'annotations
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'annotations <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'annotations)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'annotations") frozen'annotations
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "annotations"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'annotations y)
                                loop x v
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                                  mutable'annotations
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'annotations
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'annotations <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'annotations)
          "AnnotatedType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'annotations") _x))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData AnnotatedType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_AnnotatedType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_AnnotatedType'annotations x__)
                (Control.DeepSeq.deepseq (_AnnotatedType'tpe x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.tpe' @:: Lens' Annotation Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' Annotation (Prelude.Maybe Type)@ -}
data Annotation
  = Annotation'_constructor {_Annotation'tpe :: !(Prelude.Maybe Type),
                             _Annotation'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Annotation where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Annotation "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Annotation'tpe (\ x__ y__ -> x__ {_Annotation'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Annotation "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Annotation'tpe (\ x__ y__ -> x__ {_Annotation'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Message Annotation where
  messageName _ = Data.Text.pack "scip.Annotation"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Annotation\DC2\FS\n\
      \\ETXtpe\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXtpe"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor Annotation
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, tpe__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Annotation'_unknownFields
        (\ x__ y__ -> x__ {_Annotation'_unknownFields = y__})
  defMessage
    = Annotation'_constructor
        {_Annotation'tpe = Prelude.Nothing,
         _Annotation'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Annotation -> Data.ProtoLens.Encoding.Bytes.Parser Annotation
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Annotation"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Annotation where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Annotation'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Annotation'tpe x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' BooleanConstant Prelude.Bool@ -}
data BooleanConstant
  = BooleanConstant'_constructor {_BooleanConstant'value :: !Prelude.Bool,
                                  _BooleanConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show BooleanConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField BooleanConstant "value" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _BooleanConstant'value
           (\ x__ y__ -> x__ {_BooleanConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message BooleanConstant where
  messageName _ = Data.Text.pack "scip.BooleanConstant"
  packedMessageDescriptor _
    = "\n\
      \\SIBooleanConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\bR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor BooleanConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _BooleanConstant'_unknownFields
        (\ x__ y__ -> x__ {_BooleanConstant'_unknownFields = y__})
  defMessage
    = BooleanConstant'_constructor
        {_BooleanConstant'value = Data.ProtoLens.fieldDefault,
         _BooleanConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          BooleanConstant
          -> Data.ProtoLens.Encoding.Bytes.Parser BooleanConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "BooleanConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                         _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData BooleanConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_BooleanConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_BooleanConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.tpe' @:: Lens' ByNameType Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' ByNameType (Prelude.Maybe Type)@ -}
data ByNameType
  = ByNameType'_constructor {_ByNameType'tpe :: !(Prelude.Maybe Type),
                             _ByNameType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ByNameType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ByNameType "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ByNameType'tpe (\ x__ y__ -> x__ {_ByNameType'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ByNameType "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ByNameType'tpe (\ x__ y__ -> x__ {_ByNameType'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Message ByNameType where
  messageName _ = Data.Text.pack "scip.ByNameType"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \ByNameType\DC2\FS\n\
      \\ETXtpe\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXtpe"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor ByNameType
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, tpe__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ByNameType'_unknownFields
        (\ x__ y__ -> x__ {_ByNameType'_unknownFields = y__})
  defMessage
    = ByNameType'_constructor
        {_ByNameType'tpe = Prelude.Nothing,
         _ByNameType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ByNameType -> Data.ProtoLens.Encoding.Bytes.Parser ByNameType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ByNameType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ByNameType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ByNameType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ByNameType'tpe x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' ByteConstant Data.Int.Int32@ -}
data ByteConstant
  = ByteConstant'_constructor {_ByteConstant'value :: !Data.Int.Int32,
                               _ByteConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ByteConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ByteConstant "value" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ByteConstant'value (\ x__ y__ -> x__ {_ByteConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message ByteConstant where
  messageName _ = Data.Text.pack "scip.ByteConstant"
  packedMessageDescriptor _
    = "\n\
      \\fByteConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor ByteConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ByteConstant'_unknownFields
        (\ x__ y__ -> x__ {_ByteConstant'_unknownFields = y__})
  defMessage
    = ByteConstant'_constructor
        {_ByteConstant'value = Data.ProtoLens.fieldDefault,
         _ByteConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ByteConstant -> Data.ProtoLens.Encoding.Bytes.Parser ByteConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ByteConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ByteConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ByteConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ByteConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' CharConstant Data.Int.Int32@ -}
data CharConstant
  = CharConstant'_constructor {_CharConstant'value :: !Data.Int.Int32,
                               _CharConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show CharConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField CharConstant "value" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _CharConstant'value (\ x__ y__ -> x__ {_CharConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message CharConstant where
  messageName _ = Data.Text.pack "scip.CharConstant"
  packedMessageDescriptor _
    = "\n\
      \\fCharConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor CharConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _CharConstant'_unknownFields
        (\ x__ y__ -> x__ {_CharConstant'_unknownFields = y__})
  defMessage
    = CharConstant'_constructor
        {_CharConstant'value = Data.ProtoLens.fieldDefault,
         _CharConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          CharConstant -> Data.ProtoLens.Encoding.Bytes.Parser CharConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CharConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData CharConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_CharConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_CharConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.typeParameters' @:: Lens' ClassSignature Scope@
         * 'Proto.Scip_Fields.maybe'typeParameters' @:: Lens' ClassSignature (Prelude.Maybe Scope)@
         * 'Proto.Scip_Fields.parents' @:: Lens' ClassSignature [Type]@
         * 'Proto.Scip_Fields.vec'parents' @:: Lens' ClassSignature (Data.Vector.Vector Type)@
         * 'Proto.Scip_Fields.self' @:: Lens' ClassSignature Type@
         * 'Proto.Scip_Fields.maybe'self' @:: Lens' ClassSignature (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.declarations' @:: Lens' ClassSignature Scope@
         * 'Proto.Scip_Fields.maybe'declarations' @:: Lens' ClassSignature (Prelude.Maybe Scope)@ -}
data ClassSignature
  = ClassSignature'_constructor {_ClassSignature'typeParameters :: !(Prelude.Maybe Scope),
                                 _ClassSignature'parents :: !(Data.Vector.Vector Type),
                                 _ClassSignature'self :: !(Prelude.Maybe Type),
                                 _ClassSignature'declarations :: !(Prelude.Maybe Scope),
                                 _ClassSignature'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ClassSignature where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ClassSignature "typeParameters" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'typeParameters
           (\ x__ y__ -> x__ {_ClassSignature'typeParameters = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ClassSignature "maybe'typeParameters" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'typeParameters
           (\ x__ y__ -> x__ {_ClassSignature'typeParameters = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ClassSignature "parents" [Type] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'parents
           (\ x__ y__ -> x__ {_ClassSignature'parents = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ClassSignature "vec'parents" (Data.Vector.Vector Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'parents
           (\ x__ y__ -> x__ {_ClassSignature'parents = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ClassSignature "self" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'self
           (\ x__ y__ -> x__ {_ClassSignature'self = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ClassSignature "maybe'self" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'self
           (\ x__ y__ -> x__ {_ClassSignature'self = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ClassSignature "declarations" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'declarations
           (\ x__ y__ -> x__ {_ClassSignature'declarations = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ClassSignature "maybe'declarations" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ClassSignature'declarations
           (\ x__ y__ -> x__ {_ClassSignature'declarations = y__}))
        Prelude.id
instance Data.ProtoLens.Message ClassSignature where
  messageName _ = Data.Text.pack "scip.ClassSignature"
  packedMessageDescriptor _
    = "\n\
      \\SOClassSignature\DC24\n\
      \\SItype_parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC2$\n\
      \\aparents\CAN\STX \ETX(\v2\n\
      \.scip.TypeR\aparents\DC2\RS\n\
      \\EOTself\CAN\ETX \SOH(\v2\n\
      \.scip.TypeR\EOTself\DC2/\n\
      \\fdeclarations\CAN\EOT \SOH(\v2\v.scip.ScopeR\fdeclarations"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        typeParameters__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_parameters"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeParameters")) ::
              Data.ProtoLens.FieldDescriptor ClassSignature
        parents__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "parents"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"parents")) ::
              Data.ProtoLens.FieldDescriptor ClassSignature
        self__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "self"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'self")) ::
              Data.ProtoLens.FieldDescriptor ClassSignature
        declarations__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "declarations"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'declarations")) ::
              Data.ProtoLens.FieldDescriptor ClassSignature
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, typeParameters__field_descriptor),
           (Data.ProtoLens.Tag 2, parents__field_descriptor),
           (Data.ProtoLens.Tag 3, self__field_descriptor),
           (Data.ProtoLens.Tag 4, declarations__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ClassSignature'_unknownFields
        (\ x__ y__ -> x__ {_ClassSignature'_unknownFields = y__})
  defMessage
    = ClassSignature'_constructor
        {_ClassSignature'typeParameters = Prelude.Nothing,
         _ClassSignature'parents = Data.Vector.Generic.empty,
         _ClassSignature'self = Prelude.Nothing,
         _ClassSignature'declarations = Prelude.Nothing,
         _ClassSignature'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ClassSignature
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Type
             -> Data.ProtoLens.Encoding.Bytes.Parser ClassSignature
        loop x mutable'parents
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'parents <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'parents)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'parents") frozen'parents x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type_parameters"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"typeParameters") y x)
                                  mutable'parents
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "parents"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'parents y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "self"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"self") y x)
                                  mutable'parents
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "declarations"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"declarations") y x)
                                  mutable'parents
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'parents
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'parents <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'parents)
          "ClassSignature"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'typeParameters") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'parents") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'self") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   ((Data.Monoid.<>)
                      (case
                           Lens.Family2.view
                             (Data.ProtoLens.Field.field @"maybe'declarations") _x
                       of
                         Prelude.Nothing -> Data.Monoid.mempty
                         (Prelude.Just _v)
                           -> (Data.Monoid.<>)
                                (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                ((Prelude..)
                                   (\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                   Data.ProtoLens.encodeMessage _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData ClassSignature where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ClassSignature'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ClassSignature'typeParameters x__)
                (Control.DeepSeq.deepseq
                   (_ClassSignature'parents x__)
                   (Control.DeepSeq.deepseq
                      (_ClassSignature'self x__)
                      (Control.DeepSeq.deepseq (_ClassSignature'declarations x__) ()))))
{- | Fields :
     
         * 'Proto.Scip_Fields.maybe'sealedValue' @:: Lens' Constant (Prelude.Maybe Constant'SealedValue)@
         * 'Proto.Scip_Fields.maybe'unitConstant' @:: Lens' Constant (Prelude.Maybe UnitConstant)@
         * 'Proto.Scip_Fields.unitConstant' @:: Lens' Constant UnitConstant@
         * 'Proto.Scip_Fields.maybe'booleanConstant' @:: Lens' Constant (Prelude.Maybe BooleanConstant)@
         * 'Proto.Scip_Fields.booleanConstant' @:: Lens' Constant BooleanConstant@
         * 'Proto.Scip_Fields.maybe'byteConstant' @:: Lens' Constant (Prelude.Maybe ByteConstant)@
         * 'Proto.Scip_Fields.byteConstant' @:: Lens' Constant ByteConstant@
         * 'Proto.Scip_Fields.maybe'shortConstant' @:: Lens' Constant (Prelude.Maybe ShortConstant)@
         * 'Proto.Scip_Fields.shortConstant' @:: Lens' Constant ShortConstant@
         * 'Proto.Scip_Fields.maybe'charConstant' @:: Lens' Constant (Prelude.Maybe CharConstant)@
         * 'Proto.Scip_Fields.charConstant' @:: Lens' Constant CharConstant@
         * 'Proto.Scip_Fields.maybe'intConstant' @:: Lens' Constant (Prelude.Maybe IntConstant)@
         * 'Proto.Scip_Fields.intConstant' @:: Lens' Constant IntConstant@
         * 'Proto.Scip_Fields.maybe'longConstant' @:: Lens' Constant (Prelude.Maybe LongConstant)@
         * 'Proto.Scip_Fields.longConstant' @:: Lens' Constant LongConstant@
         * 'Proto.Scip_Fields.maybe'floatConstant' @:: Lens' Constant (Prelude.Maybe FloatConstant)@
         * 'Proto.Scip_Fields.floatConstant' @:: Lens' Constant FloatConstant@
         * 'Proto.Scip_Fields.maybe'doubleConstant' @:: Lens' Constant (Prelude.Maybe DoubleConstant)@
         * 'Proto.Scip_Fields.doubleConstant' @:: Lens' Constant DoubleConstant@
         * 'Proto.Scip_Fields.maybe'stringConstant' @:: Lens' Constant (Prelude.Maybe StringConstant)@
         * 'Proto.Scip_Fields.stringConstant' @:: Lens' Constant StringConstant@
         * 'Proto.Scip_Fields.maybe'nullConstant' @:: Lens' Constant (Prelude.Maybe NullConstant)@
         * 'Proto.Scip_Fields.nullConstant' @:: Lens' Constant NullConstant@ -}
data Constant
  = Constant'_constructor {_Constant'sealedValue :: !(Prelude.Maybe Constant'SealedValue),
                           _Constant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Constant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Constant'SealedValue
  = Constant'UnitConstant !UnitConstant |
    Constant'BooleanConstant !BooleanConstant |
    Constant'ByteConstant !ByteConstant |
    Constant'ShortConstant !ShortConstant |
    Constant'CharConstant !CharConstant |
    Constant'IntConstant !IntConstant |
    Constant'LongConstant !LongConstant |
    Constant'FloatConstant !FloatConstant |
    Constant'DoubleConstant !DoubleConstant |
    Constant'StringConstant !StringConstant |
    Constant'NullConstant !NullConstant
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Constant "maybe'sealedValue" (Prelude.Maybe Constant'SealedValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Constant "maybe'unitConstant" (Prelude.Maybe UnitConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'UnitConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'UnitConstant y__))
instance Data.ProtoLens.Field.HasField Constant "unitConstant" UnitConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'UnitConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'UnitConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'booleanConstant" (Prelude.Maybe BooleanConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'BooleanConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'BooleanConstant y__))
instance Data.ProtoLens.Field.HasField Constant "booleanConstant" BooleanConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'BooleanConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'BooleanConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'byteConstant" (Prelude.Maybe ByteConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'ByteConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'ByteConstant y__))
instance Data.ProtoLens.Field.HasField Constant "byteConstant" ByteConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'ByteConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'ByteConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'shortConstant" (Prelude.Maybe ShortConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'ShortConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'ShortConstant y__))
instance Data.ProtoLens.Field.HasField Constant "shortConstant" ShortConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'ShortConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'ShortConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'charConstant" (Prelude.Maybe CharConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'CharConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'CharConstant y__))
instance Data.ProtoLens.Field.HasField Constant "charConstant" CharConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'CharConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'CharConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'intConstant" (Prelude.Maybe IntConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'IntConstant x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'IntConstant y__))
instance Data.ProtoLens.Field.HasField Constant "intConstant" IntConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'IntConstant x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'IntConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'longConstant" (Prelude.Maybe LongConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'LongConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'LongConstant y__))
instance Data.ProtoLens.Field.HasField Constant "longConstant" LongConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'LongConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'LongConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'floatConstant" (Prelude.Maybe FloatConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'FloatConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'FloatConstant y__))
instance Data.ProtoLens.Field.HasField Constant "floatConstant" FloatConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'FloatConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'FloatConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'doubleConstant" (Prelude.Maybe DoubleConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'DoubleConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'DoubleConstant y__))
instance Data.ProtoLens.Field.HasField Constant "doubleConstant" DoubleConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'DoubleConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'DoubleConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'stringConstant" (Prelude.Maybe StringConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'StringConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'StringConstant y__))
instance Data.ProtoLens.Field.HasField Constant "stringConstant" StringConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'StringConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'StringConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Constant "maybe'nullConstant" (Prelude.Maybe NullConstant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Constant'NullConstant x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Constant'NullConstant y__))
instance Data.ProtoLens.Field.HasField Constant "nullConstant" NullConstant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Constant'sealedValue
           (\ x__ y__ -> x__ {_Constant'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Constant'NullConstant x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Constant'NullConstant y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Constant where
  messageName _ = Data.Text.pack "scip.Constant"
  packedMessageDescriptor _
    = "\n\
      \\bConstant\DC29\n\
      \\runit_constant\CAN\SOH \SOH(\v2\DC2.scip.UnitConstantH\NULR\funitConstant\DC2B\n\
      \\DLEboolean_constant\CAN\STX \SOH(\v2\NAK.scip.BooleanConstantH\NULR\SIbooleanConstant\DC29\n\
      \\rbyte_constant\CAN\ETX \SOH(\v2\DC2.scip.ByteConstantH\NULR\fbyteConstant\DC2<\n\
      \\SOshort_constant\CAN\EOT \SOH(\v2\DC3.scip.ShortConstantH\NULR\rshortConstant\DC29\n\
      \\rchar_constant\CAN\ENQ \SOH(\v2\DC2.scip.CharConstantH\NULR\fcharConstant\DC26\n\
      \\fint_constant\CAN\ACK \SOH(\v2\DC1.scip.IntConstantH\NULR\vintConstant\DC29\n\
      \\rlong_constant\CAN\a \SOH(\v2\DC2.scip.LongConstantH\NULR\flongConstant\DC2<\n\
      \\SOfloat_constant\CAN\b \SOH(\v2\DC3.scip.FloatConstantH\NULR\rfloatConstant\DC2?\n\
      \\SIdouble_constant\CAN\t \SOH(\v2\DC4.scip.DoubleConstantH\NULR\SOdoubleConstant\DC2?\n\
      \\SIstring_constant\CAN\n\
      \ \SOH(\v2\DC4.scip.StringConstantH\NULR\SOstringConstant\DC29\n\
      \\rnull_constant\CAN\v \SOH(\v2\DC2.scip.NullConstantH\NULR\fnullConstantB\SO\n\
      \\fsealed_value"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        unitConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "unit_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UnitConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'unitConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        booleanConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "boolean_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor BooleanConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'booleanConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        byteConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "byte_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ByteConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'byteConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        shortConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "short_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ShortConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'shortConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        charConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "char_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor CharConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'charConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        intConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "int_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor IntConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'intConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        longConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "long_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor LongConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'longConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        floatConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "float_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor FloatConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'floatConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        doubleConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "double_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor DoubleConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'doubleConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        stringConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "string_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor StringConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'stringConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
        nullConstant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "null_constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor NullConstant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'nullConstant")) ::
              Data.ProtoLens.FieldDescriptor Constant
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, unitConstant__field_descriptor),
           (Data.ProtoLens.Tag 2, booleanConstant__field_descriptor),
           (Data.ProtoLens.Tag 3, byteConstant__field_descriptor),
           (Data.ProtoLens.Tag 4, shortConstant__field_descriptor),
           (Data.ProtoLens.Tag 5, charConstant__field_descriptor),
           (Data.ProtoLens.Tag 6, intConstant__field_descriptor),
           (Data.ProtoLens.Tag 7, longConstant__field_descriptor),
           (Data.ProtoLens.Tag 8, floatConstant__field_descriptor),
           (Data.ProtoLens.Tag 9, doubleConstant__field_descriptor),
           (Data.ProtoLens.Tag 10, stringConstant__field_descriptor),
           (Data.ProtoLens.Tag 11, nullConstant__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Constant'_unknownFields
        (\ x__ y__ -> x__ {_Constant'_unknownFields = y__})
  defMessage
    = Constant'_constructor
        {_Constant'sealedValue = Prelude.Nothing,
         _Constant'_unknownFields = []}
  parseMessage
    = let
        loop :: Constant -> Data.ProtoLens.Encoding.Bytes.Parser Constant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "unit_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"unitConstant") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "boolean_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"booleanConstant") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "byte_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"byteConstant") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "short_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"shortConstant") y x)
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "char_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"charConstant") y x)
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "int_constant"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"intConstant") y x)
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "long_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"longConstant") y x)
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "float_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"floatConstant") y x)
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "double_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"doubleConstant") y x)
                        82
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "string_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"stringConstant") y x)
                        90
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "null_constant"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"nullConstant") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Constant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'sealedValue") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Constant'UnitConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'BooleanConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'ByteConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'ShortConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'CharConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'IntConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'LongConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'FloatConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'DoubleConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'StringConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Constant'NullConstant v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 90)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Constant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Constant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Constant'sealedValue x__) ())
instance Control.DeepSeq.NFData Constant'SealedValue where
  rnf (Constant'UnitConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'BooleanConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'ByteConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'ShortConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'CharConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'IntConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'LongConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'FloatConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'DoubleConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'StringConstant x__) = Control.DeepSeq.rnf x__
  rnf (Constant'NullConstant x__) = Control.DeepSeq.rnf x__
_Constant'UnitConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue UnitConstant
_Constant'UnitConstant
  = Data.ProtoLens.Prism.prism'
      Constant'UnitConstant
      (\ p__
         -> case p__ of
              (Constant'UnitConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'BooleanConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue BooleanConstant
_Constant'BooleanConstant
  = Data.ProtoLens.Prism.prism'
      Constant'BooleanConstant
      (\ p__
         -> case p__ of
              (Constant'BooleanConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'ByteConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue ByteConstant
_Constant'ByteConstant
  = Data.ProtoLens.Prism.prism'
      Constant'ByteConstant
      (\ p__
         -> case p__ of
              (Constant'ByteConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'ShortConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue ShortConstant
_Constant'ShortConstant
  = Data.ProtoLens.Prism.prism'
      Constant'ShortConstant
      (\ p__
         -> case p__ of
              (Constant'ShortConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'CharConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue CharConstant
_Constant'CharConstant
  = Data.ProtoLens.Prism.prism'
      Constant'CharConstant
      (\ p__
         -> case p__ of
              (Constant'CharConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'IntConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue IntConstant
_Constant'IntConstant
  = Data.ProtoLens.Prism.prism'
      Constant'IntConstant
      (\ p__
         -> case p__ of
              (Constant'IntConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'LongConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue LongConstant
_Constant'LongConstant
  = Data.ProtoLens.Prism.prism'
      Constant'LongConstant
      (\ p__
         -> case p__ of
              (Constant'LongConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'FloatConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue FloatConstant
_Constant'FloatConstant
  = Data.ProtoLens.Prism.prism'
      Constant'FloatConstant
      (\ p__
         -> case p__ of
              (Constant'FloatConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'DoubleConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue DoubleConstant
_Constant'DoubleConstant
  = Data.ProtoLens.Prism.prism'
      Constant'DoubleConstant
      (\ p__
         -> case p__ of
              (Constant'DoubleConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'StringConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue StringConstant
_Constant'StringConstant
  = Data.ProtoLens.Prism.prism'
      Constant'StringConstant
      (\ p__
         -> case p__ of
              (Constant'StringConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Constant'NullConstant ::
  Data.ProtoLens.Prism.Prism' Constant'SealedValue NullConstant
_Constant'NullConstant
  = Data.ProtoLens.Prism.prism'
      Constant'NullConstant
      (\ p__
         -> case p__ of
              (Constant'NullConstant p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Scip_Fields.constant' @:: Lens' ConstantType Constant@
         * 'Proto.Scip_Fields.maybe'constant' @:: Lens' ConstantType (Prelude.Maybe Constant)@ -}
data ConstantType
  = ConstantType'_constructor {_ConstantType'constant :: !(Prelude.Maybe Constant),
                               _ConstantType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ConstantType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ConstantType "constant" Constant where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConstantType'constant
           (\ x__ y__ -> x__ {_ConstantType'constant = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ConstantType "maybe'constant" (Prelude.Maybe Constant) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ConstantType'constant
           (\ x__ y__ -> x__ {_ConstantType'constant = y__}))
        Prelude.id
instance Data.ProtoLens.Message ConstantType where
  messageName _ = Data.Text.pack "scip.ConstantType"
  packedMessageDescriptor _
    = "\n\
      \\fConstantType\DC2*\n\
      \\bconstant\CAN\SOH \SOH(\v2\SO.scip.ConstantR\bconstant"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        constant__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constant"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Constant)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'constant")) ::
              Data.ProtoLens.FieldDescriptor ConstantType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, constant__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ConstantType'_unknownFields
        (\ x__ y__ -> x__ {_ConstantType'_unknownFields = y__})
  defMessage
    = ConstantType'_constructor
        {_ConstantType'constant = Prelude.Nothing,
         _ConstantType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ConstantType -> Data.ProtoLens.Encoding.Bytes.Parser ConstantType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "constant"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"constant") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ConstantType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'constant") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ConstantType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ConstantType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ConstantType'constant x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.name' @:: Lens' Descriptor Data.Text.Text@
         * 'Proto.Scip_Fields.disambiguator' @:: Lens' Descriptor Data.Text.Text@
         * 'Proto.Scip_Fields.suffix' @:: Lens' Descriptor Descriptor'Suffix@ -}
data Descriptor
  = Descriptor'_constructor {_Descriptor'name :: !Data.Text.Text,
                             _Descriptor'disambiguator :: !Data.Text.Text,
                             _Descriptor'suffix :: !Descriptor'Suffix,
                             _Descriptor'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Descriptor where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Descriptor "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Descriptor'name (\ x__ y__ -> x__ {_Descriptor'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Descriptor "disambiguator" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Descriptor'disambiguator
           (\ x__ y__ -> x__ {_Descriptor'disambiguator = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Descriptor "suffix" Descriptor'Suffix where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Descriptor'suffix (\ x__ y__ -> x__ {_Descriptor'suffix = y__}))
        Prelude.id
instance Data.ProtoLens.Message Descriptor where
  messageName _ = Data.Text.pack "scip.Descriptor"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Descriptor\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2$\n\
      \\rdisambiguator\CAN\STX \SOH(\tR\rdisambiguator\DC2/\n\
      \\ACKsuffix\CAN\ETX \SOH(\SO2\ETB.scip.Descriptor.SuffixR\ACKsuffix\"\165\SOH\n\
      \\ACKSuffix\DC2\NAK\n\
      \\DC1UnspecifiedSuffix\DLE\NUL\DC2\r\n\
      \\tNamespace\DLE\SOH\DC2\SI\n\
      \\aPackage\DLE\SOH\SUB\STX\b\SOH\DC2\b\n\
      \\EOTType\DLE\STX\DC2\b\n\
      \\EOTTerm\DLE\ETX\DC2\n\
      \\n\
      \\ACKMethod\DLE\EOT\DC2\DC1\n\
      \\rTypeParameter\DLE\ENQ\DC2\r\n\
      \\tParameter\DLE\ACK\DC2\b\n\
      \\EOTMeta\DLE\a\DC2\t\n\
      \\ENQLocal\DLE\b\DC2\t\n\
      \\ENQMacro\DLE\t\SUB\STX\DLE\SOH"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Descriptor
        disambiguator__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "disambiguator"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"disambiguator")) ::
              Data.ProtoLens.FieldDescriptor Descriptor
        suffix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "suffix"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Descriptor'Suffix)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"suffix")) ::
              Data.ProtoLens.FieldDescriptor Descriptor
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, disambiguator__field_descriptor),
           (Data.ProtoLens.Tag 3, suffix__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Descriptor'_unknownFields
        (\ x__ y__ -> x__ {_Descriptor'_unknownFields = y__})
  defMessage
    = Descriptor'_constructor
        {_Descriptor'name = Data.ProtoLens.fieldDefault,
         _Descriptor'disambiguator = Data.ProtoLens.fieldDefault,
         _Descriptor'suffix = Data.ProtoLens.fieldDefault,
         _Descriptor'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Descriptor -> Data.ProtoLens.Encoding.Bytes.Parser Descriptor
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "disambiguator"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"disambiguator") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "suffix"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"suffix") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Descriptor"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view
                         (Data.ProtoLens.Field.field @"disambiguator") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"suffix") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               Prelude.fromEnum _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Descriptor where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Descriptor'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Descriptor'name x__)
                (Control.DeepSeq.deepseq
                   (_Descriptor'disambiguator x__)
                   (Control.DeepSeq.deepseq (_Descriptor'suffix x__) ())))
newtype Descriptor'Suffix'UnrecognizedValue
  = Descriptor'Suffix'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Descriptor'Suffix
  = Descriptor'UnspecifiedSuffix |
    Descriptor'Namespace |
    Descriptor'Type |
    Descriptor'Term |
    Descriptor'Method |
    Descriptor'TypeParameter |
    Descriptor'Parameter |
    Descriptor'Meta |
    Descriptor'Local |
    Descriptor'Macro |
    Descriptor'Suffix'Unrecognized !Descriptor'Suffix'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Descriptor'Suffix where
  maybeToEnum 0 = Prelude.Just Descriptor'UnspecifiedSuffix
  maybeToEnum 1 = Prelude.Just Descriptor'Namespace
  maybeToEnum 2 = Prelude.Just Descriptor'Type
  maybeToEnum 3 = Prelude.Just Descriptor'Term
  maybeToEnum 4 = Prelude.Just Descriptor'Method
  maybeToEnum 5 = Prelude.Just Descriptor'TypeParameter
  maybeToEnum 6 = Prelude.Just Descriptor'Parameter
  maybeToEnum 7 = Prelude.Just Descriptor'Meta
  maybeToEnum 8 = Prelude.Just Descriptor'Local
  maybeToEnum 9 = Prelude.Just Descriptor'Macro
  maybeToEnum k
    = Prelude.Just
        (Descriptor'Suffix'Unrecognized
           (Descriptor'Suffix'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum Descriptor'UnspecifiedSuffix = "UnspecifiedSuffix"
  showEnum Descriptor'Namespace = "Namespace"
  showEnum Descriptor'Type = "Type"
  showEnum Descriptor'Term = "Term"
  showEnum Descriptor'Method = "Method"
  showEnum Descriptor'TypeParameter = "TypeParameter"
  showEnum Descriptor'Parameter = "Parameter"
  showEnum Descriptor'Meta = "Meta"
  showEnum Descriptor'Local = "Local"
  showEnum Descriptor'Macro = "Macro"
  showEnum
    (Descriptor'Suffix'Unrecognized (Descriptor'Suffix'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedSuffix"
    = Prelude.Just Descriptor'UnspecifiedSuffix
    | (Prelude.==) k "Namespace" = Prelude.Just Descriptor'Namespace
    | (Prelude.==) k "Package" = Prelude.Just Descriptor'Package
    | (Prelude.==) k "Type" = Prelude.Just Descriptor'Type
    | (Prelude.==) k "Term" = Prelude.Just Descriptor'Term
    | (Prelude.==) k "Method" = Prelude.Just Descriptor'Method
    | (Prelude.==) k "TypeParameter"
    = Prelude.Just Descriptor'TypeParameter
    | (Prelude.==) k "Parameter" = Prelude.Just Descriptor'Parameter
    | (Prelude.==) k "Meta" = Prelude.Just Descriptor'Meta
    | (Prelude.==) k "Local" = Prelude.Just Descriptor'Local
    | (Prelude.==) k "Macro" = Prelude.Just Descriptor'Macro
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Descriptor'Suffix where
  minBound = Descriptor'UnspecifiedSuffix
  maxBound = Descriptor'Macro
instance Prelude.Enum Descriptor'Suffix where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Suffix: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum Descriptor'UnspecifiedSuffix = 0
  fromEnum Descriptor'Namespace = 1
  fromEnum Descriptor'Type = 2
  fromEnum Descriptor'Term = 3
  fromEnum Descriptor'Method = 4
  fromEnum Descriptor'TypeParameter = 5
  fromEnum Descriptor'Parameter = 6
  fromEnum Descriptor'Meta = 7
  fromEnum Descriptor'Local = 8
  fromEnum Descriptor'Macro = 9
  fromEnum
    (Descriptor'Suffix'Unrecognized (Descriptor'Suffix'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Descriptor'Macro
    = Prelude.error
        "Descriptor'Suffix.succ: bad argument Descriptor'Macro. This value would be out of bounds."
  succ Descriptor'UnspecifiedSuffix = Descriptor'Namespace
  succ Descriptor'Namespace = Descriptor'Type
  succ Descriptor'Type = Descriptor'Term
  succ Descriptor'Term = Descriptor'Method
  succ Descriptor'Method = Descriptor'TypeParameter
  succ Descriptor'TypeParameter = Descriptor'Parameter
  succ Descriptor'Parameter = Descriptor'Meta
  succ Descriptor'Meta = Descriptor'Local
  succ Descriptor'Local = Descriptor'Macro
  succ (Descriptor'Suffix'Unrecognized _)
    = Prelude.error
        "Descriptor'Suffix.succ: bad argument: unrecognized value"
  pred Descriptor'UnspecifiedSuffix
    = Prelude.error
        "Descriptor'Suffix.pred: bad argument Descriptor'UnspecifiedSuffix. This value would be out of bounds."
  pred Descriptor'Namespace = Descriptor'UnspecifiedSuffix
  pred Descriptor'Type = Descriptor'Namespace
  pred Descriptor'Term = Descriptor'Type
  pred Descriptor'Method = Descriptor'Term
  pred Descriptor'TypeParameter = Descriptor'Method
  pred Descriptor'Parameter = Descriptor'TypeParameter
  pred Descriptor'Meta = Descriptor'Parameter
  pred Descriptor'Local = Descriptor'Meta
  pred Descriptor'Macro = Descriptor'Local
  pred (Descriptor'Suffix'Unrecognized _)
    = Prelude.error
        "Descriptor'Suffix.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Descriptor'Suffix where
  fieldDefault = Descriptor'UnspecifiedSuffix
instance Control.DeepSeq.NFData Descriptor'Suffix where
  rnf x__ = Prelude.seq x__ ()
pattern Descriptor'Package :: Descriptor'Suffix
pattern Descriptor'Package = Descriptor'Namespace
{- | Fields :
     
         * 'Proto.Scip_Fields.severity' @:: Lens' Diagnostic Severity@
         * 'Proto.Scip_Fields.code' @:: Lens' Diagnostic Data.Text.Text@
         * 'Proto.Scip_Fields.message' @:: Lens' Diagnostic Data.Text.Text@
         * 'Proto.Scip_Fields.source' @:: Lens' Diagnostic Data.Text.Text@
         * 'Proto.Scip_Fields.tags' @:: Lens' Diagnostic [DiagnosticTag]@
         * 'Proto.Scip_Fields.vec'tags' @:: Lens' Diagnostic (Data.Vector.Vector DiagnosticTag)@ -}
data Diagnostic
  = Diagnostic'_constructor {_Diagnostic'severity :: !Severity,
                             _Diagnostic'code :: !Data.Text.Text,
                             _Diagnostic'message :: !Data.Text.Text,
                             _Diagnostic'source :: !Data.Text.Text,
                             _Diagnostic'tags :: !(Data.Vector.Vector DiagnosticTag),
                             _Diagnostic'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Diagnostic where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Diagnostic "severity" Severity where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'severity
           (\ x__ y__ -> x__ {_Diagnostic'severity = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Diagnostic "code" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'code (\ x__ y__ -> x__ {_Diagnostic'code = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Diagnostic "message" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'message (\ x__ y__ -> x__ {_Diagnostic'message = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Diagnostic "source" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'source (\ x__ y__ -> x__ {_Diagnostic'source = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Diagnostic "tags" [DiagnosticTag] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'tags (\ x__ y__ -> x__ {_Diagnostic'tags = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Diagnostic "vec'tags" (Data.Vector.Vector DiagnosticTag) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Diagnostic'tags (\ x__ y__ -> x__ {_Diagnostic'tags = y__}))
        Prelude.id
instance Data.ProtoLens.Message Diagnostic where
  messageName _ = Data.Text.pack "scip.Diagnostic"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Diagnostic\DC2*\n\
      \\bseverity\CAN\SOH \SOH(\SO2\SO.scip.SeverityR\bseverity\DC2\DC2\n\
      \\EOTcode\CAN\STX \SOH(\tR\EOTcode\DC2\CAN\n\
      \\amessage\CAN\ETX \SOH(\tR\amessage\DC2\SYN\n\
      \\ACKsource\CAN\EOT \SOH(\tR\ACKsource\DC2'\n\
      \\EOTtags\CAN\ENQ \ETX(\SO2\DC3.scip.DiagnosticTagR\EOTtags"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        severity__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "severity"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor Severity)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"severity")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
        code__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "code"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"code")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
        message__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "message"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"message")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
        source__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "source"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"source")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
        tags__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tags"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor DiagnosticTag)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"tags")) ::
              Data.ProtoLens.FieldDescriptor Diagnostic
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, severity__field_descriptor),
           (Data.ProtoLens.Tag 2, code__field_descriptor),
           (Data.ProtoLens.Tag 3, message__field_descriptor),
           (Data.ProtoLens.Tag 4, source__field_descriptor),
           (Data.ProtoLens.Tag 5, tags__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Diagnostic'_unknownFields
        (\ x__ y__ -> x__ {_Diagnostic'_unknownFields = y__})
  defMessage
    = Diagnostic'_constructor
        {_Diagnostic'severity = Data.ProtoLens.fieldDefault,
         _Diagnostic'code = Data.ProtoLens.fieldDefault,
         _Diagnostic'message = Data.ProtoLens.fieldDefault,
         _Diagnostic'source = Data.ProtoLens.fieldDefault,
         _Diagnostic'tags = Data.Vector.Generic.empty,
         _Diagnostic'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Diagnostic
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld DiagnosticTag
             -> Data.ProtoLens.Encoding.Bytes.Parser Diagnostic
        loop x mutable'tags
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'tags <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'tags)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'tags") frozen'tags x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "severity"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"severity") y x)
                                  mutable'tags
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "code"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"code") y x)
                                  mutable'tags
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "message"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"message") y x)
                                  mutable'tags
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "source"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"source") y x)
                                  mutable'tags
                        40
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.toEnum
                                           (Prelude.fmap
                                              Prelude.fromIntegral
                                              Data.ProtoLens.Encoding.Bytes.getVarInt))
                                        "tags"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'tags y)
                                loop x v
                        42
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.toEnum
                                                                       (Prelude.fmap
                                                                          Prelude.fromIntegral
                                                                          Data.ProtoLens.Encoding.Bytes.getVarInt))
                                                                    "tags"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'tags)
                                loop x y
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'tags
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'tags <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'tags)
          "Diagnostic"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"severity") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"code") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"message") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (let
                         _v = Lens.Family2.view (Data.ProtoLens.Field.field @"source") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                               ((Prelude..)
                                  (\ bs
                                     -> (Data.Monoid.<>)
                                          (Data.ProtoLens.Encoding.Bytes.putVarInt
                                             (Prelude.fromIntegral (Data.ByteString.length bs)))
                                          (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                  Data.Text.Encoding.encodeUtf8 _v))
                      ((Data.Monoid.<>)
                         (let
                            p = Lens.Family2.view (Data.ProtoLens.Field.field @"vec'tags") _x
                          in
                            if Data.Vector.Generic.null p then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                  ((\ bs
                                      -> (Data.Monoid.<>)
                                           (Data.ProtoLens.Encoding.Bytes.putVarInt
                                              (Prelude.fromIntegral (Data.ByteString.length bs)))
                                           (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     (Data.ProtoLens.Encoding.Bytes.runBuilder
                                        (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                           ((Prelude..)
                                              ((Prelude..)
                                                 Data.ProtoLens.Encoding.Bytes.putVarInt
                                                 Prelude.fromIntegral)
                                              Prelude.fromEnum)
                                           p))))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Diagnostic where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Diagnostic'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Diagnostic'severity x__)
                (Control.DeepSeq.deepseq
                   (_Diagnostic'code x__)
                   (Control.DeepSeq.deepseq
                      (_Diagnostic'message x__)
                      (Control.DeepSeq.deepseq
                         (_Diagnostic'source x__)
                         (Control.DeepSeq.deepseq (_Diagnostic'tags x__) ())))))
newtype DiagnosticTag'UnrecognizedValue
  = DiagnosticTag'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data DiagnosticTag
  = UnspecifiedDiagnosticTag |
    Unnecessary |
    Deprecated |
    DiagnosticTag'Unrecognized !DiagnosticTag'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum DiagnosticTag where
  maybeToEnum 0 = Prelude.Just UnspecifiedDiagnosticTag
  maybeToEnum 1 = Prelude.Just Unnecessary
  maybeToEnum 2 = Prelude.Just Deprecated
  maybeToEnum k
    = Prelude.Just
        (DiagnosticTag'Unrecognized
           (DiagnosticTag'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedDiagnosticTag = "UnspecifiedDiagnosticTag"
  showEnum Unnecessary = "Unnecessary"
  showEnum Deprecated = "Deprecated"
  showEnum
    (DiagnosticTag'Unrecognized (DiagnosticTag'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedDiagnosticTag"
    = Prelude.Just UnspecifiedDiagnosticTag
    | (Prelude.==) k "Unnecessary" = Prelude.Just Unnecessary
    | (Prelude.==) k "Deprecated" = Prelude.Just Deprecated
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded DiagnosticTag where
  minBound = UnspecifiedDiagnosticTag
  maxBound = Deprecated
instance Prelude.Enum DiagnosticTag where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum DiagnosticTag: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedDiagnosticTag = 0
  fromEnum Unnecessary = 1
  fromEnum Deprecated = 2
  fromEnum
    (DiagnosticTag'Unrecognized (DiagnosticTag'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Deprecated
    = Prelude.error
        "DiagnosticTag.succ: bad argument Deprecated. This value would be out of bounds."
  succ UnspecifiedDiagnosticTag = Unnecessary
  succ Unnecessary = Deprecated
  succ (DiagnosticTag'Unrecognized _)
    = Prelude.error
        "DiagnosticTag.succ: bad argument: unrecognized value"
  pred UnspecifiedDiagnosticTag
    = Prelude.error
        "DiagnosticTag.pred: bad argument UnspecifiedDiagnosticTag. This value would be out of bounds."
  pred Unnecessary = UnspecifiedDiagnosticTag
  pred Deprecated = Unnecessary
  pred (DiagnosticTag'Unrecognized _)
    = Prelude.error
        "DiagnosticTag.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault DiagnosticTag where
  fieldDefault = UnspecifiedDiagnosticTag
instance Control.DeepSeq.NFData DiagnosticTag where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Scip_Fields.language' @:: Lens' Document Data.Text.Text@
         * 'Proto.Scip_Fields.relativePath' @:: Lens' Document Data.Text.Text@
         * 'Proto.Scip_Fields.occurrences' @:: Lens' Document [Occurrence]@
         * 'Proto.Scip_Fields.vec'occurrences' @:: Lens' Document (Data.Vector.Vector Occurrence)@
         * 'Proto.Scip_Fields.symbols' @:: Lens' Document [SymbolInformation]@
         * 'Proto.Scip_Fields.vec'symbols' @:: Lens' Document (Data.Vector.Vector SymbolInformation)@
         * 'Proto.Scip_Fields.text' @:: Lens' Document Data.Text.Text@
         * 'Proto.Scip_Fields.positionEncoding' @:: Lens' Document PositionEncoding@ -}
data Document
  = Document'_constructor {_Document'language :: !Data.Text.Text,
                           _Document'relativePath :: !Data.Text.Text,
                           _Document'occurrences :: !(Data.Vector.Vector Occurrence),
                           _Document'symbols :: !(Data.Vector.Vector SymbolInformation),
                           _Document'text :: !Data.Text.Text,
                           _Document'positionEncoding :: !PositionEncoding,
                           _Document'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Document where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Document "language" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'language (\ x__ y__ -> x__ {_Document'language = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Document "relativePath" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'relativePath
           (\ x__ y__ -> x__ {_Document'relativePath = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Document "occurrences" [Occurrence] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'occurrences
           (\ x__ y__ -> x__ {_Document'occurrences = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Document "vec'occurrences" (Data.Vector.Vector Occurrence) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'occurrences
           (\ x__ y__ -> x__ {_Document'occurrences = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Document "symbols" [SymbolInformation] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'symbols (\ x__ y__ -> x__ {_Document'symbols = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Document "vec'symbols" (Data.Vector.Vector SymbolInformation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'symbols (\ x__ y__ -> x__ {_Document'symbols = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Document "text" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'text (\ x__ y__ -> x__ {_Document'text = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Document "positionEncoding" PositionEncoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Document'positionEncoding
           (\ x__ y__ -> x__ {_Document'positionEncoding = y__}))
        Prelude.id
instance Data.ProtoLens.Message Document where
  messageName _ = Data.Text.pack "scip.Document"
  packedMessageDescriptor _
    = "\n\
      \\bDocument\DC2\SUB\n\
      \\blanguage\CAN\EOT \SOH(\tR\blanguage\DC2#\n\
      \\rrelative_path\CAN\SOH \SOH(\tR\frelativePath\DC22\n\
      \\voccurrences\CAN\STX \ETX(\v2\DLE.scip.OccurrenceR\voccurrences\DC21\n\
      \\asymbols\CAN\ETX \ETX(\v2\ETB.scip.SymbolInformationR\asymbols\DC2\DC2\n\
      \\EOTtext\CAN\ENQ \SOH(\tR\EOTtext\DC2C\n\
      \\DC1position_encoding\CAN\ACK \SOH(\SO2\SYN.scip.PositionEncodingR\DLEpositionEncoding"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        language__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "language"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"language")) ::
              Data.ProtoLens.FieldDescriptor Document
        relativePath__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "relative_path"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"relativePath")) ::
              Data.ProtoLens.FieldDescriptor Document
        occurrences__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "occurrences"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Occurrence)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"occurrences")) ::
              Data.ProtoLens.FieldDescriptor Document
        symbols__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbols"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SymbolInformation)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"symbols")) ::
              Data.ProtoLens.FieldDescriptor Document
        text__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "text"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"text")) ::
              Data.ProtoLens.FieldDescriptor Document
        positionEncoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "position_encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor PositionEncoding)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"positionEncoding")) ::
              Data.ProtoLens.FieldDescriptor Document
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 4, language__field_descriptor),
           (Data.ProtoLens.Tag 1, relativePath__field_descriptor),
           (Data.ProtoLens.Tag 2, occurrences__field_descriptor),
           (Data.ProtoLens.Tag 3, symbols__field_descriptor),
           (Data.ProtoLens.Tag 5, text__field_descriptor),
           (Data.ProtoLens.Tag 6, positionEncoding__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Document'_unknownFields
        (\ x__ y__ -> x__ {_Document'_unknownFields = y__})
  defMessage
    = Document'_constructor
        {_Document'language = Data.ProtoLens.fieldDefault,
         _Document'relativePath = Data.ProtoLens.fieldDefault,
         _Document'occurrences = Data.Vector.Generic.empty,
         _Document'symbols = Data.Vector.Generic.empty,
         _Document'text = Data.ProtoLens.fieldDefault,
         _Document'positionEncoding = Data.ProtoLens.fieldDefault,
         _Document'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Document
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Occurrence
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld SymbolInformation
                -> Data.ProtoLens.Encoding.Bytes.Parser Document
        loop x mutable'occurrences mutable'symbols
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'occurrences <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'occurrences)
                      frozen'symbols <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                             mutable'symbols)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'occurrences") frozen'occurrences
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'symbols") frozen'symbols x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "language"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"language") y x)
                                  mutable'occurrences mutable'symbols
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "relative_path"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"relativePath") y x)
                                  mutable'occurrences mutable'symbols
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "occurrences"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'occurrences y)
                                loop x v mutable'symbols
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "symbols"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'symbols y)
                                loop x mutable'occurrences v
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "text"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"text") y x)
                                  mutable'occurrences mutable'symbols
                        48
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "position_encoding"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"positionEncoding") y x)
                                  mutable'occurrences mutable'symbols
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'occurrences mutable'symbols
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'occurrences <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'symbols <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                   Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'occurrences mutable'symbols)
          "Document"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"language") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"relativePath") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'occurrences") _x))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.ProtoLens.encodeMessage _v))
                         (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'symbols") _x))
                      ((Data.Monoid.<>)
                         (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"text") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                                  ((Prelude..)
                                     (\ bs
                                        -> (Data.Monoid.<>)
                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                (Prelude.fromIntegral (Data.ByteString.length bs)))
                                             (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     Data.Text.Encoding.encodeUtf8 _v))
                         ((Data.Monoid.<>)
                            (let
                               _v
                                 = Lens.Family2.view
                                     (Data.ProtoLens.Field.field @"positionEncoding") _x
                             in
                               if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                   Data.Monoid.mempty
                               else
                                   (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt 48)
                                     ((Prelude..)
                                        ((Prelude..)
                                           Data.ProtoLens.Encoding.Bytes.putVarInt
                                           Prelude.fromIntegral)
                                        Prelude.fromEnum _v))
                            (Data.ProtoLens.Encoding.Wire.buildFieldSet
                               (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))
instance Control.DeepSeq.NFData Document where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Document'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Document'language x__)
                (Control.DeepSeq.deepseq
                   (_Document'relativePath x__)
                   (Control.DeepSeq.deepseq
                      (_Document'occurrences x__)
                      (Control.DeepSeq.deepseq
                         (_Document'symbols x__)
                         (Control.DeepSeq.deepseq
                            (_Document'text x__)
                            (Control.DeepSeq.deepseq (_Document'positionEncoding x__) ()))))))
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' DoubleConstant Prelude.Double@ -}
data DoubleConstant
  = DoubleConstant'_constructor {_DoubleConstant'value :: !Prelude.Double,
                                 _DoubleConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show DoubleConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField DoubleConstant "value" Prelude.Double where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _DoubleConstant'value
           (\ x__ y__ -> x__ {_DoubleConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message DoubleConstant where
  messageName _ = Data.Text.pack "scip.DoubleConstant"
  packedMessageDescriptor _
    = "\n\
      \\SODoubleConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\SOHR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.DoubleField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Double)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor DoubleConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _DoubleConstant'_unknownFields
        (\ x__ y__ -> x__ {_DoubleConstant'_unknownFields = y__})
  defMessage
    = DoubleConstant'_constructor
        {_DoubleConstant'value = Data.ProtoLens.fieldDefault,
         _DoubleConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          DoubleConstant
          -> Data.ProtoLens.Encoding.Bytes.Parser DoubleConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        9 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToDouble
                                          Data.ProtoLens.Encoding.Bytes.getFixed64)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "DoubleConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 9)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putFixed64
                         Data.ProtoLens.Encoding.Bytes.doubleToWord _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData DoubleConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_DoubleConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_DoubleConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.tpe' @:: Lens' ExistentialType Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' ExistentialType (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.declarations' @:: Lens' ExistentialType Scope@
         * 'Proto.Scip_Fields.maybe'declarations' @:: Lens' ExistentialType (Prelude.Maybe Scope)@ -}
data ExistentialType
  = ExistentialType'_constructor {_ExistentialType'tpe :: !(Prelude.Maybe Type),
                                  _ExistentialType'declarations :: !(Prelude.Maybe Scope),
                                  _ExistentialType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ExistentialType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ExistentialType "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExistentialType'tpe
           (\ x__ y__ -> x__ {_ExistentialType'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ExistentialType "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExistentialType'tpe
           (\ x__ y__ -> x__ {_ExistentialType'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ExistentialType "declarations" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExistentialType'declarations
           (\ x__ y__ -> x__ {_ExistentialType'declarations = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ExistentialType "maybe'declarations" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ExistentialType'declarations
           (\ x__ y__ -> x__ {_ExistentialType'declarations = y__}))
        Prelude.id
instance Data.ProtoLens.Message ExistentialType where
  messageName _ = Data.Text.pack "scip.ExistentialType"
  packedMessageDescriptor _
    = "\n\
      \\SIExistentialType\DC2\FS\n\
      \\ETXtpe\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXtpe\DC2/\n\
      \\fdeclarations\CAN\ETX \SOH(\v2\v.scip.ScopeR\fdeclarationsJ\EOT\b\STX\DLE\ETX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor ExistentialType
        declarations__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "declarations"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'declarations")) ::
              Data.ProtoLens.FieldDescriptor ExistentialType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, tpe__field_descriptor),
           (Data.ProtoLens.Tag 3, declarations__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ExistentialType'_unknownFields
        (\ x__ y__ -> x__ {_ExistentialType'_unknownFields = y__})
  defMessage
    = ExistentialType'_constructor
        {_ExistentialType'tpe = Prelude.Nothing,
         _ExistentialType'declarations = Prelude.Nothing,
         _ExistentialType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ExistentialType
          -> Data.ProtoLens.Encoding.Bytes.Parser ExistentialType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "declarations"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"declarations") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ExistentialType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'declarations") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData ExistentialType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ExistentialType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ExistentialType'tpe x__)
                (Control.DeepSeq.deepseq (_ExistentialType'declarations x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' FloatConstant Prelude.Float@ -}
data FloatConstant
  = FloatConstant'_constructor {_FloatConstant'value :: !Prelude.Float,
                                _FloatConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show FloatConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField FloatConstant "value" Prelude.Float where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _FloatConstant'value
           (\ x__ y__ -> x__ {_FloatConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message FloatConstant where
  messageName _ = Data.Text.pack "scip.FloatConstant"
  packedMessageDescriptor _
    = "\n\
      \\rFloatConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\STXR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.FloatField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Float)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor FloatConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _FloatConstant'_unknownFields
        (\ x__ y__ -> x__ {_FloatConstant'_unknownFields = y__})
  defMessage
    = FloatConstant'_constructor
        {_FloatConstant'value = Data.ProtoLens.fieldDefault,
         _FloatConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          FloatConstant -> Data.ProtoLens.Encoding.Bytes.Parser FloatConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        13
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Data.ProtoLens.Encoding.Bytes.wordToFloat
                                          Data.ProtoLens.Encoding.Bytes.getFixed32)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "FloatConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 13)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putFixed32
                         Data.ProtoLens.Encoding.Bytes.floatToWord _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData FloatConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_FloatConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_FloatConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.metadata' @:: Lens' Index Metadata@
         * 'Proto.Scip_Fields.maybe'metadata' @:: Lens' Index (Prelude.Maybe Metadata)@
         * 'Proto.Scip_Fields.documents' @:: Lens' Index [Document]@
         * 'Proto.Scip_Fields.vec'documents' @:: Lens' Index (Data.Vector.Vector Document)@
         * 'Proto.Scip_Fields.externalSymbols' @:: Lens' Index [SymbolInformation]@
         * 'Proto.Scip_Fields.vec'externalSymbols' @:: Lens' Index (Data.Vector.Vector SymbolInformation)@ -}
data Index
  = Index'_constructor {_Index'metadata :: !(Prelude.Maybe Metadata),
                        _Index'documents :: !(Data.Vector.Vector Document),
                        _Index'externalSymbols :: !(Data.Vector.Vector SymbolInformation),
                        _Index'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Index where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Index "metadata" Metadata where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Index'metadata (\ x__ y__ -> x__ {_Index'metadata = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Index "maybe'metadata" (Prelude.Maybe Metadata) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Index'metadata (\ x__ y__ -> x__ {_Index'metadata = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Index "documents" [Document] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Index'documents (\ x__ y__ -> x__ {_Index'documents = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Index "vec'documents" (Data.Vector.Vector Document) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Index'documents (\ x__ y__ -> x__ {_Index'documents = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Index "externalSymbols" [SymbolInformation] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Index'externalSymbols
           (\ x__ y__ -> x__ {_Index'externalSymbols = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Index "vec'externalSymbols" (Data.Vector.Vector SymbolInformation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Index'externalSymbols
           (\ x__ y__ -> x__ {_Index'externalSymbols = y__}))
        Prelude.id
instance Data.ProtoLens.Message Index where
  messageName _ = Data.Text.pack "scip.Index"
  packedMessageDescriptor _
    = "\n\
      \\ENQIndex\DC2*\n\
      \\bmetadata\CAN\SOH \SOH(\v2\SO.scip.MetadataR\bmetadata\DC2,\n\
      \\tdocuments\CAN\STX \ETX(\v2\SO.scip.DocumentR\tdocuments\DC2B\n\
      \\DLEexternal_symbols\CAN\ETX \ETX(\v2\ETB.scip.SymbolInformationR\SIexternalSymbols"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        metadata__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "metadata"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Metadata)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'metadata")) ::
              Data.ProtoLens.FieldDescriptor Index
        documents__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "documents"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Document)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"documents")) ::
              Data.ProtoLens.FieldDescriptor Index
        externalSymbols__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "external_symbols"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SymbolInformation)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"externalSymbols")) ::
              Data.ProtoLens.FieldDescriptor Index
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, metadata__field_descriptor),
           (Data.ProtoLens.Tag 2, documents__field_descriptor),
           (Data.ProtoLens.Tag 3, externalSymbols__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Index'_unknownFields
        (\ x__ y__ -> x__ {_Index'_unknownFields = y__})
  defMessage
    = Index'_constructor
        {_Index'metadata = Prelude.Nothing,
         _Index'documents = Data.Vector.Generic.empty,
         _Index'externalSymbols = Data.Vector.Generic.empty,
         _Index'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Index
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Document
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld SymbolInformation
                -> Data.ProtoLens.Encoding.Bytes.Parser Index
        loop x mutable'documents mutable'externalSymbols
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'documents <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'documents)
                      frozen'externalSymbols <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                  (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                     mutable'externalSymbols)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'documents") frozen'documents
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'externalSymbols")
                                 frozen'externalSymbols x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "metadata"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"metadata") y x)
                                  mutable'documents mutable'externalSymbols
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "documents"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'documents y)
                                loop x v mutable'externalSymbols
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "external_symbols"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'externalSymbols y)
                                loop x mutable'documents v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'documents mutable'externalSymbols
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'documents <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'externalSymbols <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'documents
                mutable'externalSymbols)
          "Index"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'metadata") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'documents") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'externalSymbols") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Index where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Index'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Index'metadata x__)
                (Control.DeepSeq.deepseq
                   (_Index'documents x__)
                   (Control.DeepSeq.deepseq (_Index'externalSymbols x__) ())))
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' IntConstant Data.Int.Int32@ -}
data IntConstant
  = IntConstant'_constructor {_IntConstant'value :: !Data.Int.Int32,
                              _IntConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show IntConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField IntConstant "value" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _IntConstant'value (\ x__ y__ -> x__ {_IntConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message IntConstant where
  messageName _ = Data.Text.pack "scip.IntConstant"
  packedMessageDescriptor _
    = "\n\
      \\vIntConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor IntConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _IntConstant'_unknownFields
        (\ x__ y__ -> x__ {_IntConstant'_unknownFields = y__})
  defMessage
    = IntConstant'_constructor
        {_IntConstant'value = Data.ProtoLens.fieldDefault,
         _IntConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          IntConstant -> Data.ProtoLens.Encoding.Bytes.Parser IntConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "IntConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData IntConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_IntConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_IntConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.types' @:: Lens' IntersectionType [Type]@
         * 'Proto.Scip_Fields.vec'types' @:: Lens' IntersectionType (Data.Vector.Vector Type)@ -}
data IntersectionType
  = IntersectionType'_constructor {_IntersectionType'types :: !(Data.Vector.Vector Type),
                                   _IntersectionType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show IntersectionType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField IntersectionType "types" [Type] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _IntersectionType'types
           (\ x__ y__ -> x__ {_IntersectionType'types = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField IntersectionType "vec'types" (Data.Vector.Vector Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _IntersectionType'types
           (\ x__ y__ -> x__ {_IntersectionType'types = y__}))
        Prelude.id
instance Data.ProtoLens.Message IntersectionType where
  messageName _ = Data.Text.pack "scip.IntersectionType"
  packedMessageDescriptor _
    = "\n\
      \\DLEIntersectionType\DC2 \n\
      \\ENQtypes\CAN\SOH \ETX(\v2\n\
      \.scip.TypeR\ENQtypes"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        types__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "types"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"types")) ::
              Data.ProtoLens.FieldDescriptor IntersectionType
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, types__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _IntersectionType'_unknownFields
        (\ x__ y__ -> x__ {_IntersectionType'_unknownFields = y__})
  defMessage
    = IntersectionType'_constructor
        {_IntersectionType'types = Data.Vector.Generic.empty,
         _IntersectionType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          IntersectionType
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Type
             -> Data.ProtoLens.Encoding.Bytes.Parser IntersectionType
        loop x mutable'types
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'types)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'types") frozen'types x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "types"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'types y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'types
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'types)
          "IntersectionType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'types") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData IntersectionType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_IntersectionType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_IntersectionType'types x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.parameters' @:: Lens' LambdaType Scope@
         * 'Proto.Scip_Fields.maybe'parameters' @:: Lens' LambdaType (Prelude.Maybe Scope)@
         * 'Proto.Scip_Fields.returnType' @:: Lens' LambdaType Type@
         * 'Proto.Scip_Fields.maybe'returnType' @:: Lens' LambdaType (Prelude.Maybe Type)@ -}
data LambdaType
  = LambdaType'_constructor {_LambdaType'parameters :: !(Prelude.Maybe Scope),
                             _LambdaType'returnType :: !(Prelude.Maybe Type),
                             _LambdaType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show LambdaType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField LambdaType "parameters" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LambdaType'parameters
           (\ x__ y__ -> x__ {_LambdaType'parameters = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField LambdaType "maybe'parameters" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LambdaType'parameters
           (\ x__ y__ -> x__ {_LambdaType'parameters = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField LambdaType "returnType" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LambdaType'returnType
           (\ x__ y__ -> x__ {_LambdaType'returnType = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField LambdaType "maybe'returnType" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LambdaType'returnType
           (\ x__ y__ -> x__ {_LambdaType'returnType = y__}))
        Prelude.id
instance Data.ProtoLens.Message LambdaType where
  messageName _ = Data.Text.pack "scip.LambdaType"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \LambdaType\DC2+\n\
      \\n\
      \parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\n\
      \parameters\DC2+\n\
      \\vreturn_type\CAN\STX \SOH(\v2\n\
      \.scip.TypeR\n\
      \returnType"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        parameters__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "parameters"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'parameters")) ::
              Data.ProtoLens.FieldDescriptor LambdaType
        returnType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "return_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'returnType")) ::
              Data.ProtoLens.FieldDescriptor LambdaType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, parameters__field_descriptor),
           (Data.ProtoLens.Tag 2, returnType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LambdaType'_unknownFields
        (\ x__ y__ -> x__ {_LambdaType'_unknownFields = y__})
  defMessage
    = LambdaType'_constructor
        {_LambdaType'parameters = Prelude.Nothing,
         _LambdaType'returnType = Prelude.Nothing,
         _LambdaType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LambdaType -> Data.ProtoLens.Encoding.Bytes.Parser LambdaType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "parameters"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"parameters") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "return_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"returnType") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LambdaType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'parameters") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'returnType") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData LambdaType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LambdaType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_LambdaType'parameters x__)
                (Control.DeepSeq.deepseq (_LambdaType'returnType x__) ()))
newtype Language'UnrecognizedValue
  = Language'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Language
  = UnspecifiedLanguage |
    CSharp |
    Swift |
    Dart |
    Kotlin |
    Scala |
    Java |
    Groovy |
    Clojure |
    CommonLisp |
    Scheme |
    Racket |
    Lua |
    Perl |
    Raku |
    Python |
    Ruby |
    Elixir |
    Erlang |
    PHP |
    Hack |
    Coffeescript |
    JavaScript |
    TypeScript |
    Flow |
    Vue |
    CSS |
    Less |
    Sass |
    SCSS |
    HTML |
    XML |
    XSL |
    Go |
    C |
    CPP |
    Objective_C |
    Objective_CPP |
    Zig |
    Ada |
    Rust |
    OCaml |
    FSharp |
    SML |
    Haskell |
    Agda |
    Idris |
    Coq |
    Lean |
    APL |
    Dyalog |
    J |
    Matlab |
    Wolfram |
    R |
    Julia |
    Fortran |
    Delphi |
    Assembly |
    COBOL |
    ABAP |
    SAS |
    Razor |
    VisualBasic |
    ShellScript |
    Fish |
    Awk |
    PowerShell |
    Bat |
    SQL |
    PLSQL |
    Prolog |
    Ini |
    TOML |
    YAML |
    JSON |
    Jsonnet |
    Nix |
    Skylark |
    Makefile |
    Dockerfile |
    BibTeX |
    TeX |
    LaTeX |
    Markdown |
    ReST |
    AsciiDoc |
    Diff |
    Git_Config |
    Handlebars |
    Git_Commit |
    Git_Rebase |
    JavaScriptReact |
    TypeScriptReact |
    Solidity |
    Apex |
    CUDA |
    GraphQL |
    Pascal |
    Protobuf |
    Tcl |
    Repro |
    Thrift |
    Verilog |
    VHDL |
    Svelte |
    Slang |
    Luau |
    Justfile |
    Nickel |
    Language'Unrecognized !Language'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Language where
  maybeToEnum 0 = Prelude.Just UnspecifiedLanguage
  maybeToEnum 1 = Prelude.Just CSharp
  maybeToEnum 2 = Prelude.Just Swift
  maybeToEnum 3 = Prelude.Just Dart
  maybeToEnum 4 = Prelude.Just Kotlin
  maybeToEnum 5 = Prelude.Just Scala
  maybeToEnum 6 = Prelude.Just Java
  maybeToEnum 7 = Prelude.Just Groovy
  maybeToEnum 8 = Prelude.Just Clojure
  maybeToEnum 9 = Prelude.Just CommonLisp
  maybeToEnum 10 = Prelude.Just Scheme
  maybeToEnum 11 = Prelude.Just Racket
  maybeToEnum 12 = Prelude.Just Lua
  maybeToEnum 13 = Prelude.Just Perl
  maybeToEnum 14 = Prelude.Just Raku
  maybeToEnum 15 = Prelude.Just Python
  maybeToEnum 16 = Prelude.Just Ruby
  maybeToEnum 17 = Prelude.Just Elixir
  maybeToEnum 18 = Prelude.Just Erlang
  maybeToEnum 19 = Prelude.Just PHP
  maybeToEnum 20 = Prelude.Just Hack
  maybeToEnum 21 = Prelude.Just Coffeescript
  maybeToEnum 22 = Prelude.Just JavaScript
  maybeToEnum 23 = Prelude.Just TypeScript
  maybeToEnum 24 = Prelude.Just Flow
  maybeToEnum 25 = Prelude.Just Vue
  maybeToEnum 26 = Prelude.Just CSS
  maybeToEnum 27 = Prelude.Just Less
  maybeToEnum 28 = Prelude.Just Sass
  maybeToEnum 29 = Prelude.Just SCSS
  maybeToEnum 30 = Prelude.Just HTML
  maybeToEnum 31 = Prelude.Just XML
  maybeToEnum 32 = Prelude.Just XSL
  maybeToEnum 33 = Prelude.Just Go
  maybeToEnum 34 = Prelude.Just C
  maybeToEnum 35 = Prelude.Just CPP
  maybeToEnum 36 = Prelude.Just Objective_C
  maybeToEnum 37 = Prelude.Just Objective_CPP
  maybeToEnum 38 = Prelude.Just Zig
  maybeToEnum 39 = Prelude.Just Ada
  maybeToEnum 40 = Prelude.Just Rust
  maybeToEnum 41 = Prelude.Just OCaml
  maybeToEnum 42 = Prelude.Just FSharp
  maybeToEnum 43 = Prelude.Just SML
  maybeToEnum 44 = Prelude.Just Haskell
  maybeToEnum 45 = Prelude.Just Agda
  maybeToEnum 46 = Prelude.Just Idris
  maybeToEnum 47 = Prelude.Just Coq
  maybeToEnum 48 = Prelude.Just Lean
  maybeToEnum 49 = Prelude.Just APL
  maybeToEnum 50 = Prelude.Just Dyalog
  maybeToEnum 51 = Prelude.Just J
  maybeToEnum 52 = Prelude.Just Matlab
  maybeToEnum 53 = Prelude.Just Wolfram
  maybeToEnum 54 = Prelude.Just R
  maybeToEnum 55 = Prelude.Just Julia
  maybeToEnum 56 = Prelude.Just Fortran
  maybeToEnum 57 = Prelude.Just Delphi
  maybeToEnum 58 = Prelude.Just Assembly
  maybeToEnum 59 = Prelude.Just COBOL
  maybeToEnum 60 = Prelude.Just ABAP
  maybeToEnum 61 = Prelude.Just SAS
  maybeToEnum 62 = Prelude.Just Razor
  maybeToEnum 63 = Prelude.Just VisualBasic
  maybeToEnum 64 = Prelude.Just ShellScript
  maybeToEnum 65 = Prelude.Just Fish
  maybeToEnum 66 = Prelude.Just Awk
  maybeToEnum 67 = Prelude.Just PowerShell
  maybeToEnum 68 = Prelude.Just Bat
  maybeToEnum 69 = Prelude.Just SQL
  maybeToEnum 70 = Prelude.Just PLSQL
  maybeToEnum 71 = Prelude.Just Prolog
  maybeToEnum 72 = Prelude.Just Ini
  maybeToEnum 73 = Prelude.Just TOML
  maybeToEnum 74 = Prelude.Just YAML
  maybeToEnum 75 = Prelude.Just JSON
  maybeToEnum 76 = Prelude.Just Jsonnet
  maybeToEnum 77 = Prelude.Just Nix
  maybeToEnum 78 = Prelude.Just Skylark
  maybeToEnum 79 = Prelude.Just Makefile
  maybeToEnum 80 = Prelude.Just Dockerfile
  maybeToEnum 81 = Prelude.Just BibTeX
  maybeToEnum 82 = Prelude.Just TeX
  maybeToEnum 83 = Prelude.Just LaTeX
  maybeToEnum 84 = Prelude.Just Markdown
  maybeToEnum 85 = Prelude.Just ReST
  maybeToEnum 86 = Prelude.Just AsciiDoc
  maybeToEnum 88 = Prelude.Just Diff
  maybeToEnum 89 = Prelude.Just Git_Config
  maybeToEnum 90 = Prelude.Just Handlebars
  maybeToEnum 91 = Prelude.Just Git_Commit
  maybeToEnum 92 = Prelude.Just Git_Rebase
  maybeToEnum 93 = Prelude.Just JavaScriptReact
  maybeToEnum 94 = Prelude.Just TypeScriptReact
  maybeToEnum 95 = Prelude.Just Solidity
  maybeToEnum 96 = Prelude.Just Apex
  maybeToEnum 97 = Prelude.Just CUDA
  maybeToEnum 98 = Prelude.Just GraphQL
  maybeToEnum 99 = Prelude.Just Pascal
  maybeToEnum 100 = Prelude.Just Protobuf
  maybeToEnum 101 = Prelude.Just Tcl
  maybeToEnum 102 = Prelude.Just Repro
  maybeToEnum 103 = Prelude.Just Thrift
  maybeToEnum 104 = Prelude.Just Verilog
  maybeToEnum 105 = Prelude.Just VHDL
  maybeToEnum 106 = Prelude.Just Svelte
  maybeToEnum 107 = Prelude.Just Slang
  maybeToEnum 108 = Prelude.Just Luau
  maybeToEnum 109 = Prelude.Just Justfile
  maybeToEnum 110 = Prelude.Just Nickel
  maybeToEnum k
    = Prelude.Just
        (Language'Unrecognized
           (Language'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedLanguage = "UnspecifiedLanguage"
  showEnum ABAP = "ABAP"
  showEnum Apex = "Apex"
  showEnum APL = "APL"
  showEnum Ada = "Ada"
  showEnum Agda = "Agda"
  showEnum AsciiDoc = "AsciiDoc"
  showEnum Assembly = "Assembly"
  showEnum Awk = "Awk"
  showEnum Bat = "Bat"
  showEnum BibTeX = "BibTeX"
  showEnum C = "C"
  showEnum COBOL = "COBOL"
  showEnum CPP = "CPP"
  showEnum CSS = "CSS"
  showEnum CSharp = "CSharp"
  showEnum Clojure = "Clojure"
  showEnum Coffeescript = "Coffeescript"
  showEnum CommonLisp = "CommonLisp"
  showEnum Coq = "Coq"
  showEnum CUDA = "CUDA"
  showEnum Dart = "Dart"
  showEnum Delphi = "Delphi"
  showEnum Diff = "Diff"
  showEnum Dockerfile = "Dockerfile"
  showEnum Dyalog = "Dyalog"
  showEnum Elixir = "Elixir"
  showEnum Erlang = "Erlang"
  showEnum FSharp = "FSharp"
  showEnum Fish = "Fish"
  showEnum Flow = "Flow"
  showEnum Fortran = "Fortran"
  showEnum Git_Commit = "Git_Commit"
  showEnum Git_Config = "Git_Config"
  showEnum Git_Rebase = "Git_Rebase"
  showEnum Go = "Go"
  showEnum GraphQL = "GraphQL"
  showEnum Groovy = "Groovy"
  showEnum HTML = "HTML"
  showEnum Hack = "Hack"
  showEnum Handlebars = "Handlebars"
  showEnum Haskell = "Haskell"
  showEnum Idris = "Idris"
  showEnum Ini = "Ini"
  showEnum J = "J"
  showEnum JSON = "JSON"
  showEnum Java = "Java"
  showEnum JavaScript = "JavaScript"
  showEnum JavaScriptReact = "JavaScriptReact"
  showEnum Jsonnet = "Jsonnet"
  showEnum Julia = "Julia"
  showEnum Justfile = "Justfile"
  showEnum Kotlin = "Kotlin"
  showEnum LaTeX = "LaTeX"
  showEnum Lean = "Lean"
  showEnum Less = "Less"
  showEnum Lua = "Lua"
  showEnum Luau = "Luau"
  showEnum Makefile = "Makefile"
  showEnum Markdown = "Markdown"
  showEnum Matlab = "Matlab"
  showEnum Nickel = "Nickel"
  showEnum Nix = "Nix"
  showEnum OCaml = "OCaml"
  showEnum Objective_C = "Objective_C"
  showEnum Objective_CPP = "Objective_CPP"
  showEnum Pascal = "Pascal"
  showEnum PHP = "PHP"
  showEnum PLSQL = "PLSQL"
  showEnum Perl = "Perl"
  showEnum PowerShell = "PowerShell"
  showEnum Prolog = "Prolog"
  showEnum Protobuf = "Protobuf"
  showEnum Python = "Python"
  showEnum R = "R"
  showEnum Racket = "Racket"
  showEnum Raku = "Raku"
  showEnum Razor = "Razor"
  showEnum Repro = "Repro"
  showEnum ReST = "ReST"
  showEnum Ruby = "Ruby"
  showEnum Rust = "Rust"
  showEnum SAS = "SAS"
  showEnum SCSS = "SCSS"
  showEnum SML = "SML"
  showEnum SQL = "SQL"
  showEnum Sass = "Sass"
  showEnum Scala = "Scala"
  showEnum Scheme = "Scheme"
  showEnum ShellScript = "ShellScript"
  showEnum Skylark = "Skylark"
  showEnum Slang = "Slang"
  showEnum Solidity = "Solidity"
  showEnum Svelte = "Svelte"
  showEnum Swift = "Swift"
  showEnum Tcl = "Tcl"
  showEnum TOML = "TOML"
  showEnum TeX = "TeX"
  showEnum Thrift = "Thrift"
  showEnum TypeScript = "TypeScript"
  showEnum TypeScriptReact = "TypeScriptReact"
  showEnum Verilog = "Verilog"
  showEnum VHDL = "VHDL"
  showEnum VisualBasic = "VisualBasic"
  showEnum Vue = "Vue"
  showEnum Wolfram = "Wolfram"
  showEnum XML = "XML"
  showEnum XSL = "XSL"
  showEnum YAML = "YAML"
  showEnum Zig = "Zig"
  showEnum (Language'Unrecognized (Language'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedLanguage"
    = Prelude.Just UnspecifiedLanguage
    | (Prelude.==) k "ABAP" = Prelude.Just ABAP
    | (Prelude.==) k "Apex" = Prelude.Just Apex
    | (Prelude.==) k "APL" = Prelude.Just APL
    | (Prelude.==) k "Ada" = Prelude.Just Ada
    | (Prelude.==) k "Agda" = Prelude.Just Agda
    | (Prelude.==) k "AsciiDoc" = Prelude.Just AsciiDoc
    | (Prelude.==) k "Assembly" = Prelude.Just Assembly
    | (Prelude.==) k "Awk" = Prelude.Just Awk
    | (Prelude.==) k "Bat" = Prelude.Just Bat
    | (Prelude.==) k "BibTeX" = Prelude.Just BibTeX
    | (Prelude.==) k "C" = Prelude.Just C
    | (Prelude.==) k "COBOL" = Prelude.Just COBOL
    | (Prelude.==) k "CPP" = Prelude.Just CPP
    | (Prelude.==) k "CSS" = Prelude.Just CSS
    | (Prelude.==) k "CSharp" = Prelude.Just CSharp
    | (Prelude.==) k "Clojure" = Prelude.Just Clojure
    | (Prelude.==) k "Coffeescript" = Prelude.Just Coffeescript
    | (Prelude.==) k "CommonLisp" = Prelude.Just CommonLisp
    | (Prelude.==) k "Coq" = Prelude.Just Coq
    | (Prelude.==) k "CUDA" = Prelude.Just CUDA
    | (Prelude.==) k "Dart" = Prelude.Just Dart
    | (Prelude.==) k "Delphi" = Prelude.Just Delphi
    | (Prelude.==) k "Diff" = Prelude.Just Diff
    | (Prelude.==) k "Dockerfile" = Prelude.Just Dockerfile
    | (Prelude.==) k "Dyalog" = Prelude.Just Dyalog
    | (Prelude.==) k "Elixir" = Prelude.Just Elixir
    | (Prelude.==) k "Erlang" = Prelude.Just Erlang
    | (Prelude.==) k "FSharp" = Prelude.Just FSharp
    | (Prelude.==) k "Fish" = Prelude.Just Fish
    | (Prelude.==) k "Flow" = Prelude.Just Flow
    | (Prelude.==) k "Fortran" = Prelude.Just Fortran
    | (Prelude.==) k "Git_Commit" = Prelude.Just Git_Commit
    | (Prelude.==) k "Git_Config" = Prelude.Just Git_Config
    | (Prelude.==) k "Git_Rebase" = Prelude.Just Git_Rebase
    | (Prelude.==) k "Go" = Prelude.Just Go
    | (Prelude.==) k "GraphQL" = Prelude.Just GraphQL
    | (Prelude.==) k "Groovy" = Prelude.Just Groovy
    | (Prelude.==) k "HTML" = Prelude.Just HTML
    | (Prelude.==) k "Hack" = Prelude.Just Hack
    | (Prelude.==) k "Handlebars" = Prelude.Just Handlebars
    | (Prelude.==) k "Haskell" = Prelude.Just Haskell
    | (Prelude.==) k "Idris" = Prelude.Just Idris
    | (Prelude.==) k "Ini" = Prelude.Just Ini
    | (Prelude.==) k "J" = Prelude.Just J
    | (Prelude.==) k "JSON" = Prelude.Just JSON
    | (Prelude.==) k "Java" = Prelude.Just Java
    | (Prelude.==) k "JavaScript" = Prelude.Just JavaScript
    | (Prelude.==) k "JavaScriptReact" = Prelude.Just JavaScriptReact
    | (Prelude.==) k "Jsonnet" = Prelude.Just Jsonnet
    | (Prelude.==) k "Julia" = Prelude.Just Julia
    | (Prelude.==) k "Justfile" = Prelude.Just Justfile
    | (Prelude.==) k "Kotlin" = Prelude.Just Kotlin
    | (Prelude.==) k "LaTeX" = Prelude.Just LaTeX
    | (Prelude.==) k "Lean" = Prelude.Just Lean
    | (Prelude.==) k "Less" = Prelude.Just Less
    | (Prelude.==) k "Lua" = Prelude.Just Lua
    | (Prelude.==) k "Luau" = Prelude.Just Luau
    | (Prelude.==) k "Makefile" = Prelude.Just Makefile
    | (Prelude.==) k "Markdown" = Prelude.Just Markdown
    | (Prelude.==) k "Matlab" = Prelude.Just Matlab
    | (Prelude.==) k "Nickel" = Prelude.Just Nickel
    | (Prelude.==) k "Nix" = Prelude.Just Nix
    | (Prelude.==) k "OCaml" = Prelude.Just OCaml
    | (Prelude.==) k "Objective_C" = Prelude.Just Objective_C
    | (Prelude.==) k "Objective_CPP" = Prelude.Just Objective_CPP
    | (Prelude.==) k "Pascal" = Prelude.Just Pascal
    | (Prelude.==) k "PHP" = Prelude.Just PHP
    | (Prelude.==) k "PLSQL" = Prelude.Just PLSQL
    | (Prelude.==) k "Perl" = Prelude.Just Perl
    | (Prelude.==) k "PowerShell" = Prelude.Just PowerShell
    | (Prelude.==) k "Prolog" = Prelude.Just Prolog
    | (Prelude.==) k "Protobuf" = Prelude.Just Protobuf
    | (Prelude.==) k "Python" = Prelude.Just Python
    | (Prelude.==) k "R" = Prelude.Just R
    | (Prelude.==) k "Racket" = Prelude.Just Racket
    | (Prelude.==) k "Raku" = Prelude.Just Raku
    | (Prelude.==) k "Razor" = Prelude.Just Razor
    | (Prelude.==) k "Repro" = Prelude.Just Repro
    | (Prelude.==) k "ReST" = Prelude.Just ReST
    | (Prelude.==) k "Ruby" = Prelude.Just Ruby
    | (Prelude.==) k "Rust" = Prelude.Just Rust
    | (Prelude.==) k "SAS" = Prelude.Just SAS
    | (Prelude.==) k "SCSS" = Prelude.Just SCSS
    | (Prelude.==) k "SML" = Prelude.Just SML
    | (Prelude.==) k "SQL" = Prelude.Just SQL
    | (Prelude.==) k "Sass" = Prelude.Just Sass
    | (Prelude.==) k "Scala" = Prelude.Just Scala
    | (Prelude.==) k "Scheme" = Prelude.Just Scheme
    | (Prelude.==) k "ShellScript" = Prelude.Just ShellScript
    | (Prelude.==) k "Skylark" = Prelude.Just Skylark
    | (Prelude.==) k "Slang" = Prelude.Just Slang
    | (Prelude.==) k "Solidity" = Prelude.Just Solidity
    | (Prelude.==) k "Svelte" = Prelude.Just Svelte
    | (Prelude.==) k "Swift" = Prelude.Just Swift
    | (Prelude.==) k "Tcl" = Prelude.Just Tcl
    | (Prelude.==) k "TOML" = Prelude.Just TOML
    | (Prelude.==) k "TeX" = Prelude.Just TeX
    | (Prelude.==) k "Thrift" = Prelude.Just Thrift
    | (Prelude.==) k "TypeScript" = Prelude.Just TypeScript
    | (Prelude.==) k "TypeScriptReact" = Prelude.Just TypeScriptReact
    | (Prelude.==) k "Verilog" = Prelude.Just Verilog
    | (Prelude.==) k "VHDL" = Prelude.Just VHDL
    | (Prelude.==) k "VisualBasic" = Prelude.Just VisualBasic
    | (Prelude.==) k "Vue" = Prelude.Just Vue
    | (Prelude.==) k "Wolfram" = Prelude.Just Wolfram
    | (Prelude.==) k "XML" = Prelude.Just XML
    | (Prelude.==) k "XSL" = Prelude.Just XSL
    | (Prelude.==) k "YAML" = Prelude.Just YAML
    | (Prelude.==) k "Zig" = Prelude.Just Zig
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Language where
  minBound = UnspecifiedLanguage
  maxBound = Nickel
instance Prelude.Enum Language where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Language: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedLanguage = 0
  fromEnum CSharp = 1
  fromEnum Swift = 2
  fromEnum Dart = 3
  fromEnum Kotlin = 4
  fromEnum Scala = 5
  fromEnum Java = 6
  fromEnum Groovy = 7
  fromEnum Clojure = 8
  fromEnum CommonLisp = 9
  fromEnum Scheme = 10
  fromEnum Racket = 11
  fromEnum Lua = 12
  fromEnum Perl = 13
  fromEnum Raku = 14
  fromEnum Python = 15
  fromEnum Ruby = 16
  fromEnum Elixir = 17
  fromEnum Erlang = 18
  fromEnum PHP = 19
  fromEnum Hack = 20
  fromEnum Coffeescript = 21
  fromEnum JavaScript = 22
  fromEnum TypeScript = 23
  fromEnum Flow = 24
  fromEnum Vue = 25
  fromEnum CSS = 26
  fromEnum Less = 27
  fromEnum Sass = 28
  fromEnum SCSS = 29
  fromEnum HTML = 30
  fromEnum XML = 31
  fromEnum XSL = 32
  fromEnum Go = 33
  fromEnum C = 34
  fromEnum CPP = 35
  fromEnum Objective_C = 36
  fromEnum Objective_CPP = 37
  fromEnum Zig = 38
  fromEnum Ada = 39
  fromEnum Rust = 40
  fromEnum OCaml = 41
  fromEnum FSharp = 42
  fromEnum SML = 43
  fromEnum Haskell = 44
  fromEnum Agda = 45
  fromEnum Idris = 46
  fromEnum Coq = 47
  fromEnum Lean = 48
  fromEnum APL = 49
  fromEnum Dyalog = 50
  fromEnum J = 51
  fromEnum Matlab = 52
  fromEnum Wolfram = 53
  fromEnum R = 54
  fromEnum Julia = 55
  fromEnum Fortran = 56
  fromEnum Delphi = 57
  fromEnum Assembly = 58
  fromEnum COBOL = 59
  fromEnum ABAP = 60
  fromEnum SAS = 61
  fromEnum Razor = 62
  fromEnum VisualBasic = 63
  fromEnum ShellScript = 64
  fromEnum Fish = 65
  fromEnum Awk = 66
  fromEnum PowerShell = 67
  fromEnum Bat = 68
  fromEnum SQL = 69
  fromEnum PLSQL = 70
  fromEnum Prolog = 71
  fromEnum Ini = 72
  fromEnum TOML = 73
  fromEnum YAML = 74
  fromEnum JSON = 75
  fromEnum Jsonnet = 76
  fromEnum Nix = 77
  fromEnum Skylark = 78
  fromEnum Makefile = 79
  fromEnum Dockerfile = 80
  fromEnum BibTeX = 81
  fromEnum TeX = 82
  fromEnum LaTeX = 83
  fromEnum Markdown = 84
  fromEnum ReST = 85
  fromEnum AsciiDoc = 86
  fromEnum Diff = 88
  fromEnum Git_Config = 89
  fromEnum Handlebars = 90
  fromEnum Git_Commit = 91
  fromEnum Git_Rebase = 92
  fromEnum JavaScriptReact = 93
  fromEnum TypeScriptReact = 94
  fromEnum Solidity = 95
  fromEnum Apex = 96
  fromEnum CUDA = 97
  fromEnum GraphQL = 98
  fromEnum Pascal = 99
  fromEnum Protobuf = 100
  fromEnum Tcl = 101
  fromEnum Repro = 102
  fromEnum Thrift = 103
  fromEnum Verilog = 104
  fromEnum VHDL = 105
  fromEnum Svelte = 106
  fromEnum Slang = 107
  fromEnum Luau = 108
  fromEnum Justfile = 109
  fromEnum Nickel = 110
  fromEnum (Language'Unrecognized (Language'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Nickel
    = Prelude.error
        "Language.succ: bad argument Nickel. This value would be out of bounds."
  succ UnspecifiedLanguage = CSharp
  succ CSharp = Swift
  succ Swift = Dart
  succ Dart = Kotlin
  succ Kotlin = Scala
  succ Scala = Java
  succ Java = Groovy
  succ Groovy = Clojure
  succ Clojure = CommonLisp
  succ CommonLisp = Scheme
  succ Scheme = Racket
  succ Racket = Lua
  succ Lua = Perl
  succ Perl = Raku
  succ Raku = Python
  succ Python = Ruby
  succ Ruby = Elixir
  succ Elixir = Erlang
  succ Erlang = PHP
  succ PHP = Hack
  succ Hack = Coffeescript
  succ Coffeescript = JavaScript
  succ JavaScript = TypeScript
  succ TypeScript = Flow
  succ Flow = Vue
  succ Vue = CSS
  succ CSS = Less
  succ Less = Sass
  succ Sass = SCSS
  succ SCSS = HTML
  succ HTML = XML
  succ XML = XSL
  succ XSL = Go
  succ Go = C
  succ C = CPP
  succ CPP = Objective_C
  succ Objective_C = Objective_CPP
  succ Objective_CPP = Zig
  succ Zig = Ada
  succ Ada = Rust
  succ Rust = OCaml
  succ OCaml = FSharp
  succ FSharp = SML
  succ SML = Haskell
  succ Haskell = Agda
  succ Agda = Idris
  succ Idris = Coq
  succ Coq = Lean
  succ Lean = APL
  succ APL = Dyalog
  succ Dyalog = J
  succ J = Matlab
  succ Matlab = Wolfram
  succ Wolfram = R
  succ R = Julia
  succ Julia = Fortran
  succ Fortran = Delphi
  succ Delphi = Assembly
  succ Assembly = COBOL
  succ COBOL = ABAP
  succ ABAP = SAS
  succ SAS = Razor
  succ Razor = VisualBasic
  succ VisualBasic = ShellScript
  succ ShellScript = Fish
  succ Fish = Awk
  succ Awk = PowerShell
  succ PowerShell = Bat
  succ Bat = SQL
  succ SQL = PLSQL
  succ PLSQL = Prolog
  succ Prolog = Ini
  succ Ini = TOML
  succ TOML = YAML
  succ YAML = JSON
  succ JSON = Jsonnet
  succ Jsonnet = Nix
  succ Nix = Skylark
  succ Skylark = Makefile
  succ Makefile = Dockerfile
  succ Dockerfile = BibTeX
  succ BibTeX = TeX
  succ TeX = LaTeX
  succ LaTeX = Markdown
  succ Markdown = ReST
  succ ReST = AsciiDoc
  succ AsciiDoc = Diff
  succ Diff = Git_Config
  succ Git_Config = Handlebars
  succ Handlebars = Git_Commit
  succ Git_Commit = Git_Rebase
  succ Git_Rebase = JavaScriptReact
  succ JavaScriptReact = TypeScriptReact
  succ TypeScriptReact = Solidity
  succ Solidity = Apex
  succ Apex = CUDA
  succ CUDA = GraphQL
  succ GraphQL = Pascal
  succ Pascal = Protobuf
  succ Protobuf = Tcl
  succ Tcl = Repro
  succ Repro = Thrift
  succ Thrift = Verilog
  succ Verilog = VHDL
  succ VHDL = Svelte
  succ Svelte = Slang
  succ Slang = Luau
  succ Luau = Justfile
  succ Justfile = Nickel
  succ (Language'Unrecognized _)
    = Prelude.error "Language.succ: bad argument: unrecognized value"
  pred UnspecifiedLanguage
    = Prelude.error
        "Language.pred: bad argument UnspecifiedLanguage. This value would be out of bounds."
  pred CSharp = UnspecifiedLanguage
  pred Swift = CSharp
  pred Dart = Swift
  pred Kotlin = Dart
  pred Scala = Kotlin
  pred Java = Scala
  pred Groovy = Java
  pred Clojure = Groovy
  pred CommonLisp = Clojure
  pred Scheme = CommonLisp
  pred Racket = Scheme
  pred Lua = Racket
  pred Perl = Lua
  pred Raku = Perl
  pred Python = Raku
  pred Ruby = Python
  pred Elixir = Ruby
  pred Erlang = Elixir
  pred PHP = Erlang
  pred Hack = PHP
  pred Coffeescript = Hack
  pred JavaScript = Coffeescript
  pred TypeScript = JavaScript
  pred Flow = TypeScript
  pred Vue = Flow
  pred CSS = Vue
  pred Less = CSS
  pred Sass = Less
  pred SCSS = Sass
  pred HTML = SCSS
  pred XML = HTML
  pred XSL = XML
  pred Go = XSL
  pred C = Go
  pred CPP = C
  pred Objective_C = CPP
  pred Objective_CPP = Objective_C
  pred Zig = Objective_CPP
  pred Ada = Zig
  pred Rust = Ada
  pred OCaml = Rust
  pred FSharp = OCaml
  pred SML = FSharp
  pred Haskell = SML
  pred Agda = Haskell
  pred Idris = Agda
  pred Coq = Idris
  pred Lean = Coq
  pred APL = Lean
  pred Dyalog = APL
  pred J = Dyalog
  pred Matlab = J
  pred Wolfram = Matlab
  pred R = Wolfram
  pred Julia = R
  pred Fortran = Julia
  pred Delphi = Fortran
  pred Assembly = Delphi
  pred COBOL = Assembly
  pred ABAP = COBOL
  pred SAS = ABAP
  pred Razor = SAS
  pred VisualBasic = Razor
  pred ShellScript = VisualBasic
  pred Fish = ShellScript
  pred Awk = Fish
  pred PowerShell = Awk
  pred Bat = PowerShell
  pred SQL = Bat
  pred PLSQL = SQL
  pred Prolog = PLSQL
  pred Ini = Prolog
  pred TOML = Ini
  pred YAML = TOML
  pred JSON = YAML
  pred Jsonnet = JSON
  pred Nix = Jsonnet
  pred Skylark = Nix
  pred Makefile = Skylark
  pred Dockerfile = Makefile
  pred BibTeX = Dockerfile
  pred TeX = BibTeX
  pred LaTeX = TeX
  pred Markdown = LaTeX
  pred ReST = Markdown
  pred AsciiDoc = ReST
  pred Diff = AsciiDoc
  pred Git_Config = Diff
  pred Handlebars = Git_Config
  pred Git_Commit = Handlebars
  pred Git_Rebase = Git_Commit
  pred JavaScriptReact = Git_Rebase
  pred TypeScriptReact = JavaScriptReact
  pred Solidity = TypeScriptReact
  pred Apex = Solidity
  pred CUDA = Apex
  pred GraphQL = CUDA
  pred Pascal = GraphQL
  pred Protobuf = Pascal
  pred Tcl = Protobuf
  pred Repro = Tcl
  pred Thrift = Repro
  pred Verilog = Thrift
  pred VHDL = Verilog
  pred Svelte = VHDL
  pred Slang = Svelte
  pred Luau = Slang
  pred Justfile = Luau
  pred Nickel = Justfile
  pred (Language'Unrecognized _)
    = Prelude.error "Language.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Language where
  fieldDefault = UnspecifiedLanguage
instance Control.DeepSeq.NFData Language where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' LongConstant Data.Int.Int64@ -}
data LongConstant
  = LongConstant'_constructor {_LongConstant'value :: !Data.Int.Int64,
                               _LongConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show LongConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField LongConstant "value" Data.Int.Int64 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _LongConstant'value (\ x__ y__ -> x__ {_LongConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message LongConstant where
  messageName _ = Data.Text.pack "scip.LongConstant"
  packedMessageDescriptor _
    = "\n\
      \\fLongConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ETXR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int64Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int64)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor LongConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _LongConstant'_unknownFields
        (\ x__ y__ -> x__ {_LongConstant'_unknownFields = y__})
  defMessage
    = LongConstant'_constructor
        {_LongConstant'value = Data.ProtoLens.fieldDefault,
         _LongConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          LongConstant -> Data.ProtoLens.Encoding.Bytes.Parser LongConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "LongConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData LongConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_LongConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_LongConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.scrutinee' @:: Lens' MatchType Type@
         * 'Proto.Scip_Fields.maybe'scrutinee' @:: Lens' MatchType (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.cases' @:: Lens' MatchType [MatchType'CaseType]@
         * 'Proto.Scip_Fields.vec'cases' @:: Lens' MatchType (Data.Vector.Vector MatchType'CaseType)@ -}
data MatchType
  = MatchType'_constructor {_MatchType'scrutinee :: !(Prelude.Maybe Type),
                            _MatchType'cases :: !(Data.Vector.Vector MatchType'CaseType),
                            _MatchType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MatchType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MatchType "scrutinee" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'scrutinee
           (\ x__ y__ -> x__ {_MatchType'scrutinee = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MatchType "maybe'scrutinee" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'scrutinee
           (\ x__ y__ -> x__ {_MatchType'scrutinee = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MatchType "cases" [MatchType'CaseType] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'cases (\ x__ y__ -> x__ {_MatchType'cases = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField MatchType "vec'cases" (Data.Vector.Vector MatchType'CaseType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'cases (\ x__ y__ -> x__ {_MatchType'cases = y__}))
        Prelude.id
instance Data.ProtoLens.Message MatchType where
  messageName _ = Data.Text.pack "scip.MatchType"
  packedMessageDescriptor _
    = "\n\
      \\tMatchType\DC2(\n\
      \\tscrutinee\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\tscrutinee\DC2.\n\
      \\ENQcases\CAN\STX \ETX(\v2\CAN.scip.MatchType.CaseTypeR\ENQcases\SUBH\n\
      \\bCaseType\DC2\FS\n\
      \\ETXkey\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXkey\DC2\RS\n\
      \\EOTbody\CAN\STX \SOH(\v2\n\
      \.scip.TypeR\EOTbody"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        scrutinee__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "scrutinee"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'scrutinee")) ::
              Data.ProtoLens.FieldDescriptor MatchType
        cases__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "cases"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MatchType'CaseType)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"cases")) ::
              Data.ProtoLens.FieldDescriptor MatchType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, scrutinee__field_descriptor),
           (Data.ProtoLens.Tag 2, cases__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MatchType'_unknownFields
        (\ x__ y__ -> x__ {_MatchType'_unknownFields = y__})
  defMessage
    = MatchType'_constructor
        {_MatchType'scrutinee = Prelude.Nothing,
         _MatchType'cases = Data.Vector.Generic.empty,
         _MatchType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MatchType
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld MatchType'CaseType
             -> Data.ProtoLens.Encoding.Bytes.Parser MatchType
        loop x mutable'cases
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'cases <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'cases)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'cases") frozen'cases x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "scrutinee"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"scrutinee") y x)
                                  mutable'cases
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "cases"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'cases y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'cases
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'cases <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'cases)
          "MatchType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'scrutinee") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'cases") _x))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData MatchType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MatchType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MatchType'scrutinee x__)
                (Control.DeepSeq.deepseq (_MatchType'cases x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.key' @:: Lens' MatchType'CaseType Type@
         * 'Proto.Scip_Fields.maybe'key' @:: Lens' MatchType'CaseType (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.body' @:: Lens' MatchType'CaseType Type@
         * 'Proto.Scip_Fields.maybe'body' @:: Lens' MatchType'CaseType (Prelude.Maybe Type)@ -}
data MatchType'CaseType
  = MatchType'CaseType'_constructor {_MatchType'CaseType'key :: !(Prelude.Maybe Type),
                                     _MatchType'CaseType'body :: !(Prelude.Maybe Type),
                                     _MatchType'CaseType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MatchType'CaseType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MatchType'CaseType "key" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'CaseType'key
           (\ x__ y__ -> x__ {_MatchType'CaseType'key = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MatchType'CaseType "maybe'key" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'CaseType'key
           (\ x__ y__ -> x__ {_MatchType'CaseType'key = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MatchType'CaseType "body" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'CaseType'body
           (\ x__ y__ -> x__ {_MatchType'CaseType'body = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MatchType'CaseType "maybe'body" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MatchType'CaseType'body
           (\ x__ y__ -> x__ {_MatchType'CaseType'body = y__}))
        Prelude.id
instance Data.ProtoLens.Message MatchType'CaseType where
  messageName _ = Data.Text.pack "scip.MatchType.CaseType"
  packedMessageDescriptor _
    = "\n\
      \\bCaseType\DC2\FS\n\
      \\ETXkey\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXkey\DC2\RS\n\
      \\EOTbody\CAN\STX \SOH(\v2\n\
      \.scip.TypeR\EOTbody"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        key__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "key"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'key")) ::
              Data.ProtoLens.FieldDescriptor MatchType'CaseType
        body__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "body"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'body")) ::
              Data.ProtoLens.FieldDescriptor MatchType'CaseType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, key__field_descriptor),
           (Data.ProtoLens.Tag 2, body__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MatchType'CaseType'_unknownFields
        (\ x__ y__ -> x__ {_MatchType'CaseType'_unknownFields = y__})
  defMessage
    = MatchType'CaseType'_constructor
        {_MatchType'CaseType'key = Prelude.Nothing,
         _MatchType'CaseType'body = Prelude.Nothing,
         _MatchType'CaseType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MatchType'CaseType
          -> Data.ProtoLens.Encoding.Bytes.Parser MatchType'CaseType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "key"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"key") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "body"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"body") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "CaseType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'key") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'body") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData MatchType'CaseType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MatchType'CaseType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MatchType'CaseType'key x__)
                (Control.DeepSeq.deepseq (_MatchType'CaseType'body x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.version' @:: Lens' Metadata ProtocolVersion@
         * 'Proto.Scip_Fields.toolInfo' @:: Lens' Metadata ToolInfo@
         * 'Proto.Scip_Fields.maybe'toolInfo' @:: Lens' Metadata (Prelude.Maybe ToolInfo)@
         * 'Proto.Scip_Fields.projectRoot' @:: Lens' Metadata Data.Text.Text@
         * 'Proto.Scip_Fields.textDocumentEncoding' @:: Lens' Metadata TextEncoding@ -}
data Metadata
  = Metadata'_constructor {_Metadata'version :: !ProtocolVersion,
                           _Metadata'toolInfo :: !(Prelude.Maybe ToolInfo),
                           _Metadata'projectRoot :: !Data.Text.Text,
                           _Metadata'textDocumentEncoding :: !TextEncoding,
                           _Metadata'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Metadata where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Metadata "version" ProtocolVersion where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Metadata'version (\ x__ y__ -> x__ {_Metadata'version = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Metadata "toolInfo" ToolInfo where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Metadata'toolInfo (\ x__ y__ -> x__ {_Metadata'toolInfo = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Metadata "maybe'toolInfo" (Prelude.Maybe ToolInfo) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Metadata'toolInfo (\ x__ y__ -> x__ {_Metadata'toolInfo = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Metadata "projectRoot" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Metadata'projectRoot
           (\ x__ y__ -> x__ {_Metadata'projectRoot = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Metadata "textDocumentEncoding" TextEncoding where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Metadata'textDocumentEncoding
           (\ x__ y__ -> x__ {_Metadata'textDocumentEncoding = y__}))
        Prelude.id
instance Data.ProtoLens.Message Metadata where
  messageName _ = Data.Text.pack "scip.Metadata"
  packedMessageDescriptor _
    = "\n\
      \\bMetadata\DC2/\n\
      \\aversion\CAN\SOH \SOH(\SO2\NAK.scip.ProtocolVersionR\aversion\DC2+\n\
      \\ttool_info\CAN\STX \SOH(\v2\SO.scip.ToolInfoR\btoolInfo\DC2!\n\
      \\fproject_root\CAN\ETX \SOH(\tR\vprojectRoot\DC2H\n\
      \\SYNtext_document_encoding\CAN\EOT \SOH(\SO2\DC2.scip.TextEncodingR\DC4textDocumentEncoding"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        version__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor ProtocolVersion)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"version")) ::
              Data.ProtoLens.FieldDescriptor Metadata
        toolInfo__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tool_info"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ToolInfo)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'toolInfo")) ::
              Data.ProtoLens.FieldDescriptor Metadata
        projectRoot__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "project_root"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"projectRoot")) ::
              Data.ProtoLens.FieldDescriptor Metadata
        textDocumentEncoding__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "text_document_encoding"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor TextEncoding)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"textDocumentEncoding")) ::
              Data.ProtoLens.FieldDescriptor Metadata
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, version__field_descriptor),
           (Data.ProtoLens.Tag 2, toolInfo__field_descriptor),
           (Data.ProtoLens.Tag 3, projectRoot__field_descriptor),
           (Data.ProtoLens.Tag 4, textDocumentEncoding__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Metadata'_unknownFields
        (\ x__ y__ -> x__ {_Metadata'_unknownFields = y__})
  defMessage
    = Metadata'_constructor
        {_Metadata'version = Data.ProtoLens.fieldDefault,
         _Metadata'toolInfo = Prelude.Nothing,
         _Metadata'projectRoot = Data.ProtoLens.fieldDefault,
         _Metadata'textDocumentEncoding = Data.ProtoLens.fieldDefault,
         _Metadata'_unknownFields = []}
  parseMessage
    = let
        loop :: Metadata -> Data.ProtoLens.Encoding.Bytes.Parser Metadata
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "version"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"version") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tool_info"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"toolInfo") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "project_root"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"projectRoot") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "text_document_encoding"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"textDocumentEncoding") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Metadata"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"version") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                         Prelude.fromEnum _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'toolInfo") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"projectRoot") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"textDocumentEncoding") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                  Prelude.fromEnum _v))
                      (Data.ProtoLens.Encoding.Wire.buildFieldSet
                         (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))
instance Control.DeepSeq.NFData Metadata where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Metadata'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Metadata'version x__)
                (Control.DeepSeq.deepseq
                   (_Metadata'toolInfo x__)
                   (Control.DeepSeq.deepseq
                      (_Metadata'projectRoot x__)
                      (Control.DeepSeq.deepseq
                         (_Metadata'textDocumentEncoding x__) ()))))
{- | Fields :
     
         * 'Proto.Scip_Fields.typeParameters' @:: Lens' MethodSignature Scope@
         * 'Proto.Scip_Fields.maybe'typeParameters' @:: Lens' MethodSignature (Prelude.Maybe Scope)@
         * 'Proto.Scip_Fields.parameterLists' @:: Lens' MethodSignature [Scope]@
         * 'Proto.Scip_Fields.vec'parameterLists' @:: Lens' MethodSignature (Data.Vector.Vector Scope)@
         * 'Proto.Scip_Fields.returnType' @:: Lens' MethodSignature Type@
         * 'Proto.Scip_Fields.maybe'returnType' @:: Lens' MethodSignature (Prelude.Maybe Type)@ -}
data MethodSignature
  = MethodSignature'_constructor {_MethodSignature'typeParameters :: !(Prelude.Maybe Scope),
                                  _MethodSignature'parameterLists :: !(Data.Vector.Vector Scope),
                                  _MethodSignature'returnType :: !(Prelude.Maybe Type),
                                  _MethodSignature'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show MethodSignature where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField MethodSignature "typeParameters" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodSignature'typeParameters
           (\ x__ y__ -> x__ {_MethodSignature'typeParameters = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MethodSignature "maybe'typeParameters" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodSignature'typeParameters
           (\ x__ y__ -> x__ {_MethodSignature'typeParameters = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodSignature "parameterLists" [Scope] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodSignature'parameterLists
           (\ x__ y__ -> x__ {_MethodSignature'parameterLists = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField MethodSignature "vec'parameterLists" (Data.Vector.Vector Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodSignature'parameterLists
           (\ x__ y__ -> x__ {_MethodSignature'parameterLists = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField MethodSignature "returnType" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodSignature'returnType
           (\ x__ y__ -> x__ {_MethodSignature'returnType = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField MethodSignature "maybe'returnType" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _MethodSignature'returnType
           (\ x__ y__ -> x__ {_MethodSignature'returnType = y__}))
        Prelude.id
instance Data.ProtoLens.Message MethodSignature where
  messageName _ = Data.Text.pack "scip.MethodSignature"
  packedMessageDescriptor _
    = "\n\
      \\SIMethodSignature\DC24\n\
      \\SItype_parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC24\n\
      \\SIparameter_lists\CAN\STX \ETX(\v2\v.scip.ScopeR\SOparameterLists\DC2+\n\
      \\vreturn_type\CAN\ETX \SOH(\v2\n\
      \.scip.TypeR\n\
      \returnType"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        typeParameters__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_parameters"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeParameters")) ::
              Data.ProtoLens.FieldDescriptor MethodSignature
        parameterLists__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "parameter_lists"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"parameterLists")) ::
              Data.ProtoLens.FieldDescriptor MethodSignature
        returnType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "return_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'returnType")) ::
              Data.ProtoLens.FieldDescriptor MethodSignature
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, typeParameters__field_descriptor),
           (Data.ProtoLens.Tag 2, parameterLists__field_descriptor),
           (Data.ProtoLens.Tag 3, returnType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _MethodSignature'_unknownFields
        (\ x__ y__ -> x__ {_MethodSignature'_unknownFields = y__})
  defMessage
    = MethodSignature'_constructor
        {_MethodSignature'typeParameters = Prelude.Nothing,
         _MethodSignature'parameterLists = Data.Vector.Generic.empty,
         _MethodSignature'returnType = Prelude.Nothing,
         _MethodSignature'_unknownFields = []}
  parseMessage
    = let
        loop ::
          MethodSignature
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Scope
             -> Data.ProtoLens.Encoding.Bytes.Parser MethodSignature
        loop x mutable'parameterLists
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'parameterLists <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'parameterLists)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'parameterLists")
                              frozen'parameterLists x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type_parameters"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"typeParameters") y x)
                                  mutable'parameterLists
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "parameter_lists"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'parameterLists y)
                                loop x v
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "return_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"returnType") y x)
                                  mutable'parameterLists
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'parameterLists
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'parameterLists <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'parameterLists)
          "MethodSignature"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'typeParameters") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'parameterLists") _x))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'returnType") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData MethodSignature where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_MethodSignature'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_MethodSignature'typeParameters x__)
                (Control.DeepSeq.deepseq
                   (_MethodSignature'parameterLists x__)
                   (Control.DeepSeq.deepseq (_MethodSignature'returnType x__) ())))
{- | Fields :
      -}
data NullConstant
  = NullConstant'_constructor {_NullConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show NullConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message NullConstant where
  messageName _ = Data.Text.pack "scip.NullConstant"
  packedMessageDescriptor _
    = "\n\
      \\fNullConstant"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _NullConstant'_unknownFields
        (\ x__ y__ -> x__ {_NullConstant'_unknownFields = y__})
  defMessage
    = NullConstant'_constructor {_NullConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          NullConstant -> Data.ProtoLens.Encoding.Bytes.Parser NullConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "NullConstant"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData NullConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_NullConstant'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Scip_Fields.range' @:: Lens' Occurrence [Data.Int.Int32]@
         * 'Proto.Scip_Fields.vec'range' @:: Lens' Occurrence (Data.Vector.Unboxed.Vector Data.Int.Int32)@
         * 'Proto.Scip_Fields.symbol' @:: Lens' Occurrence Data.Text.Text@
         * 'Proto.Scip_Fields.symbolRoles' @:: Lens' Occurrence Data.Int.Int32@
         * 'Proto.Scip_Fields.overrideDocumentation' @:: Lens' Occurrence [Data.Text.Text]@
         * 'Proto.Scip_Fields.vec'overrideDocumentation' @:: Lens' Occurrence (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Scip_Fields.syntaxKind' @:: Lens' Occurrence SyntaxKind@
         * 'Proto.Scip_Fields.diagnostics' @:: Lens' Occurrence [Diagnostic]@
         * 'Proto.Scip_Fields.vec'diagnostics' @:: Lens' Occurrence (Data.Vector.Vector Diagnostic)@
         * 'Proto.Scip_Fields.enclosingRange' @:: Lens' Occurrence [Data.Int.Int32]@
         * 'Proto.Scip_Fields.vec'enclosingRange' @:: Lens' Occurrence (Data.Vector.Unboxed.Vector Data.Int.Int32)@ -}
data Occurrence
  = Occurrence'_constructor {_Occurrence'range :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                             _Occurrence'symbol :: !Data.Text.Text,
                             _Occurrence'symbolRoles :: !Data.Int.Int32,
                             _Occurrence'overrideDocumentation :: !(Data.Vector.Vector Data.Text.Text),
                             _Occurrence'syntaxKind :: !SyntaxKind,
                             _Occurrence'diagnostics :: !(Data.Vector.Vector Diagnostic),
                             _Occurrence'enclosingRange :: !(Data.Vector.Unboxed.Vector Data.Int.Int32),
                             _Occurrence'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Occurrence where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Occurrence "range" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'range (\ x__ y__ -> x__ {_Occurrence'range = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Occurrence "vec'range" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'range (\ x__ y__ -> x__ {_Occurrence'range = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Occurrence "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'symbol (\ x__ y__ -> x__ {_Occurrence'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Occurrence "symbolRoles" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'symbolRoles
           (\ x__ y__ -> x__ {_Occurrence'symbolRoles = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Occurrence "overrideDocumentation" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'overrideDocumentation
           (\ x__ y__ -> x__ {_Occurrence'overrideDocumentation = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Occurrence "vec'overrideDocumentation" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'overrideDocumentation
           (\ x__ y__ -> x__ {_Occurrence'overrideDocumentation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Occurrence "syntaxKind" SyntaxKind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'syntaxKind
           (\ x__ y__ -> x__ {_Occurrence'syntaxKind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Occurrence "diagnostics" [Diagnostic] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'diagnostics
           (\ x__ y__ -> x__ {_Occurrence'diagnostics = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Occurrence "vec'diagnostics" (Data.Vector.Vector Diagnostic) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'diagnostics
           (\ x__ y__ -> x__ {_Occurrence'diagnostics = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Occurrence "enclosingRange" [Data.Int.Int32] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'enclosingRange
           (\ x__ y__ -> x__ {_Occurrence'enclosingRange = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Occurrence "vec'enclosingRange" (Data.Vector.Unboxed.Vector Data.Int.Int32) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Occurrence'enclosingRange
           (\ x__ y__ -> x__ {_Occurrence'enclosingRange = y__}))
        Prelude.id
instance Data.ProtoLens.Message Occurrence where
  messageName _ = Data.Text.pack "scip.Occurrence"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \Occurrence\DC2\DC4\n\
      \\ENQrange\CAN\SOH \ETX(\ENQR\ENQrange\DC2\SYN\n\
      \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol\DC2!\n\
      \\fsymbol_roles\CAN\ETX \SOH(\ENQR\vsymbolRoles\DC25\n\
      \\SYNoverride_documentation\CAN\EOT \ETX(\tR\NAKoverrideDocumentation\DC21\n\
      \\vsyntax_kind\CAN\ENQ \SOH(\SO2\DLE.scip.SyntaxKindR\n\
      \syntaxKind\DC22\n\
      \\vdiagnostics\CAN\ACK \ETX(\v2\DLE.scip.DiagnosticR\vdiagnostics\DC2'\n\
      \\SIenclosing_range\CAN\a \ETX(\ENQR\SOenclosingRange"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        range__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "range"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed (Data.ProtoLens.Field.field @"range")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
        symbolRoles__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol_roles"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"symbolRoles")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
        overrideDocumentation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "override_documentation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"overrideDocumentation")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
        syntaxKind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "syntax_kind"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor SyntaxKind)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"syntaxKind")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
        diagnostics__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "diagnostics"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Diagnostic)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"diagnostics")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
        enclosingRange__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enclosing_range"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Packed
                 (Data.ProtoLens.Field.field @"enclosingRange")) ::
              Data.ProtoLens.FieldDescriptor Occurrence
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, range__field_descriptor),
           (Data.ProtoLens.Tag 2, symbol__field_descriptor),
           (Data.ProtoLens.Tag 3, symbolRoles__field_descriptor),
           (Data.ProtoLens.Tag 4, overrideDocumentation__field_descriptor),
           (Data.ProtoLens.Tag 5, syntaxKind__field_descriptor),
           (Data.ProtoLens.Tag 6, diagnostics__field_descriptor),
           (Data.ProtoLens.Tag 7, enclosingRange__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Occurrence'_unknownFields
        (\ x__ y__ -> x__ {_Occurrence'_unknownFields = y__})
  defMessage
    = Occurrence'_constructor
        {_Occurrence'range = Data.Vector.Generic.empty,
         _Occurrence'symbol = Data.ProtoLens.fieldDefault,
         _Occurrence'symbolRoles = Data.ProtoLens.fieldDefault,
         _Occurrence'overrideDocumentation = Data.Vector.Generic.empty,
         _Occurrence'syntaxKind = Data.ProtoLens.fieldDefault,
         _Occurrence'diagnostics = Data.Vector.Generic.empty,
         _Occurrence'enclosingRange = Data.Vector.Generic.empty,
         _Occurrence'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Occurrence
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Diagnostic
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
                -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                   -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Unboxed.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Int.Int32
                      -> Data.ProtoLens.Encoding.Bytes.Parser Occurrence
        loop
          x
          mutable'diagnostics
          mutable'enclosingRange
          mutable'overrideDocumentation
          mutable'range
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'diagnostics <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'diagnostics)
                      frozen'enclosingRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                    mutable'enclosingRange)
                      frozen'overrideDocumentation <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                           mutable'overrideDocumentation)
                      frozen'range <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'range)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'diagnostics") frozen'diagnostics
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'enclosingRange")
                                 frozen'enclosingRange
                                 (Lens.Family2.set
                                    (Data.ProtoLens.Field.field @"vec'overrideDocumentation")
                                    frozen'overrideDocumentation
                                    (Lens.Family2.set
                                       (Data.ProtoLens.Field.field @"vec'range") frozen'range x)))))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "range"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'range y)
                                loop
                                  x mutable'diagnostics mutable'enclosingRange
                                  mutable'overrideDocumentation v
                        10
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "range"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'range)
                                loop
                                  x mutable'diagnostics mutable'enclosingRange
                                  mutable'overrideDocumentation y
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                                  mutable'diagnostics mutable'enclosingRange
                                  mutable'overrideDocumentation mutable'range
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "symbol_roles"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"symbolRoles") y x)
                                  mutable'diagnostics mutable'enclosingRange
                                  mutable'overrideDocumentation mutable'range
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "override_documentation"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'overrideDocumentation y)
                                loop x mutable'diagnostics mutable'enclosingRange v mutable'range
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "syntax_kind"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"syntaxKind") y x)
                                  mutable'diagnostics mutable'enclosingRange
                                  mutable'overrideDocumentation mutable'range
                        50
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "diagnostics"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'diagnostics y)
                                loop
                                  x v mutable'enclosingRange mutable'overrideDocumentation
                                  mutable'range
                        56
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (Prelude.fmap
                                           Prelude.fromIntegral
                                           Data.ProtoLens.Encoding.Bytes.getVarInt)
                                        "enclosing_range"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'enclosingRange y)
                                loop
                                  x mutable'diagnostics v mutable'overrideDocumentation
                                  mutable'range
                        58
                          -> do y <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                        Data.ProtoLens.Encoding.Bytes.isolate
                                          (Prelude.fromIntegral len)
                                          ((let
                                              ploop qs
                                                = do packedEnd <- Data.ProtoLens.Encoding.Bytes.atEnd
                                                     if packedEnd then
                                                         Prelude.return qs
                                                     else
                                                         do !q <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                                                    (Prelude.fmap
                                                                       Prelude.fromIntegral
                                                                       Data.ProtoLens.Encoding.Bytes.getVarInt)
                                                                    "enclosing_range"
                                                            qs' <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                                     (Data.ProtoLens.Encoding.Growing.append
                                                                        qs q)
                                                            ploop qs'
                                            in ploop)
                                             mutable'enclosingRange)
                                loop
                                  x mutable'diagnostics y mutable'overrideDocumentation
                                  mutable'range
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'diagnostics mutable'enclosingRange
                                  mutable'overrideDocumentation mutable'range
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'diagnostics <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              mutable'enclosingRange <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                          Data.ProtoLens.Encoding.Growing.new
              mutable'overrideDocumentation <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                 Data.ProtoLens.Encoding.Growing.new
              mutable'range <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'diagnostics
                mutable'enclosingRange mutable'overrideDocumentation mutable'range)
          "Occurrence"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                p = Lens.Family2.view (Data.ProtoLens.Field.field @"vec'range") _x
              in
                if Data.Vector.Generic.null p then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((\ bs
                          -> (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (Prelude.fromIntegral (Data.ByteString.length bs)))
                               (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         (Data.ProtoLens.Encoding.Bytes.runBuilder
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                               p))))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view (Data.ProtoLens.Field.field @"symbolRoles") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
                   ((Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                         (\ _v
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                                 ((Prelude..)
                                    (\ bs
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt
                                               (Prelude.fromIntegral (Data.ByteString.length bs)))
                                            (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                    Data.Text.Encoding.encodeUtf8 _v))
                         (Lens.Family2.view
                            (Data.ProtoLens.Field.field @"vec'overrideDocumentation") _x))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"syntaxKind") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     ((Prelude..)
                                        Data.ProtoLens.Encoding.Bytes.putVarInt
                                        Prelude.fromIntegral)
                                     Prelude.fromEnum _v))
                         ((Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                               (\ _v
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                       ((Prelude..)
                                          (\ bs
                                             -> (Data.Monoid.<>)
                                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                     (Prelude.fromIntegral
                                                        (Data.ByteString.length bs)))
                                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                          Data.ProtoLens.encodeMessage _v))
                               (Lens.Family2.view
                                  (Data.ProtoLens.Field.field @"vec'diagnostics") _x))
                            ((Data.Monoid.<>)
                               (let
                                  p = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"vec'enclosingRange") _x
                                in
                                  if Data.Vector.Generic.null p then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                        ((\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                           (Data.ProtoLens.Encoding.Bytes.runBuilder
                                              (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                                                 ((Prelude..)
                                                    Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    Prelude.fromIntegral)
                                                 p))))
                               (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                  (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))))
instance Control.DeepSeq.NFData Occurrence where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Occurrence'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Occurrence'range x__)
                (Control.DeepSeq.deepseq
                   (_Occurrence'symbol x__)
                   (Control.DeepSeq.deepseq
                      (_Occurrence'symbolRoles x__)
                      (Control.DeepSeq.deepseq
                         (_Occurrence'overrideDocumentation x__)
                         (Control.DeepSeq.deepseq
                            (_Occurrence'syntaxKind x__)
                            (Control.DeepSeq.deepseq
                               (_Occurrence'diagnostics x__)
                               (Control.DeepSeq.deepseq (_Occurrence'enclosingRange x__) ())))))))
{- | Fields :
     
         * 'Proto.Scip_Fields.manager' @:: Lens' Package Data.Text.Text@
         * 'Proto.Scip_Fields.name' @:: Lens' Package Data.Text.Text@
         * 'Proto.Scip_Fields.version' @:: Lens' Package Data.Text.Text@ -}
data Package
  = Package'_constructor {_Package'manager :: !Data.Text.Text,
                          _Package'name :: !Data.Text.Text,
                          _Package'version :: !Data.Text.Text,
                          _Package'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Package where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Package "manager" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Package'manager (\ x__ y__ -> x__ {_Package'manager = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Package "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Package'name (\ x__ y__ -> x__ {_Package'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Package "version" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Package'version (\ x__ y__ -> x__ {_Package'version = y__}))
        Prelude.id
instance Data.ProtoLens.Message Package where
  messageName _ = Data.Text.pack "scip.Package"
  packedMessageDescriptor _
    = "\n\
      \\aPackage\DC2\CAN\n\
      \\amanager\CAN\SOH \SOH(\tR\amanager\DC2\DC2\n\
      \\EOTname\CAN\STX \SOH(\tR\EOTname\DC2\CAN\n\
      \\aversion\CAN\ETX \SOH(\tR\aversion"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        manager__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "manager"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"manager")) ::
              Data.ProtoLens.FieldDescriptor Package
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor Package
        version__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"version")) ::
              Data.ProtoLens.FieldDescriptor Package
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, manager__field_descriptor),
           (Data.ProtoLens.Tag 2, name__field_descriptor),
           (Data.ProtoLens.Tag 3, version__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Package'_unknownFields
        (\ x__ y__ -> x__ {_Package'_unknownFields = y__})
  defMessage
    = Package'_constructor
        {_Package'manager = Data.ProtoLens.fieldDefault,
         _Package'name = Data.ProtoLens.fieldDefault,
         _Package'version = Data.ProtoLens.fieldDefault,
         _Package'_unknownFields = []}
  parseMessage
    = let
        loop :: Package -> Data.ProtoLens.Encoding.Bytes.Parser Package
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "manager"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"manager") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "name"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "version"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"version") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Package"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"manager") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (let
                      _v = Lens.Family2.view (Data.ProtoLens.Field.field @"version") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                            ((Prelude..)
                               (\ bs
                                  -> (Data.Monoid.<>)
                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                          (Prelude.fromIntegral (Data.ByteString.length bs)))
                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                               Data.Text.Encoding.encodeUtf8 _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Package where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Package'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Package'manager x__)
                (Control.DeepSeq.deepseq
                   (_Package'name x__)
                   (Control.DeepSeq.deepseq (_Package'version x__) ())))
newtype PositionEncoding'UnrecognizedValue
  = PositionEncoding'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data PositionEncoding
  = UnspecifiedPositionEncoding |
    UTF8CodeUnitOffsetFromLineStart |
    UTF16CodeUnitOffsetFromLineStart |
    UTF32CodeUnitOffsetFromLineStart |
    PositionEncoding'Unrecognized !PositionEncoding'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum PositionEncoding where
  maybeToEnum 0 = Prelude.Just UnspecifiedPositionEncoding
  maybeToEnum 1 = Prelude.Just UTF8CodeUnitOffsetFromLineStart
  maybeToEnum 2 = Prelude.Just UTF16CodeUnitOffsetFromLineStart
  maybeToEnum 3 = Prelude.Just UTF32CodeUnitOffsetFromLineStart
  maybeToEnum k
    = Prelude.Just
        (PositionEncoding'Unrecognized
           (PositionEncoding'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedPositionEncoding
    = "UnspecifiedPositionEncoding"
  showEnum UTF8CodeUnitOffsetFromLineStart
    = "UTF8CodeUnitOffsetFromLineStart"
  showEnum UTF16CodeUnitOffsetFromLineStart
    = "UTF16CodeUnitOffsetFromLineStart"
  showEnum UTF32CodeUnitOffsetFromLineStart
    = "UTF32CodeUnitOffsetFromLineStart"
  showEnum
    (PositionEncoding'Unrecognized (PositionEncoding'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedPositionEncoding"
    = Prelude.Just UnspecifiedPositionEncoding
    | (Prelude.==) k "UTF8CodeUnitOffsetFromLineStart"
    = Prelude.Just UTF8CodeUnitOffsetFromLineStart
    | (Prelude.==) k "UTF16CodeUnitOffsetFromLineStart"
    = Prelude.Just UTF16CodeUnitOffsetFromLineStart
    | (Prelude.==) k "UTF32CodeUnitOffsetFromLineStart"
    = Prelude.Just UTF32CodeUnitOffsetFromLineStart
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded PositionEncoding where
  minBound = UnspecifiedPositionEncoding
  maxBound = UTF32CodeUnitOffsetFromLineStart
instance Prelude.Enum PositionEncoding where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum PositionEncoding: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedPositionEncoding = 0
  fromEnum UTF8CodeUnitOffsetFromLineStart = 1
  fromEnum UTF16CodeUnitOffsetFromLineStart = 2
  fromEnum UTF32CodeUnitOffsetFromLineStart = 3
  fromEnum
    (PositionEncoding'Unrecognized (PositionEncoding'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ UTF32CodeUnitOffsetFromLineStart
    = Prelude.error
        "PositionEncoding.succ: bad argument UTF32CodeUnitOffsetFromLineStart. This value would be out of bounds."
  succ UnspecifiedPositionEncoding = UTF8CodeUnitOffsetFromLineStart
  succ UTF8CodeUnitOffsetFromLineStart
    = UTF16CodeUnitOffsetFromLineStart
  succ UTF16CodeUnitOffsetFromLineStart
    = UTF32CodeUnitOffsetFromLineStart
  succ (PositionEncoding'Unrecognized _)
    = Prelude.error
        "PositionEncoding.succ: bad argument: unrecognized value"
  pred UnspecifiedPositionEncoding
    = Prelude.error
        "PositionEncoding.pred: bad argument UnspecifiedPositionEncoding. This value would be out of bounds."
  pred UTF8CodeUnitOffsetFromLineStart = UnspecifiedPositionEncoding
  pred UTF16CodeUnitOffsetFromLineStart
    = UTF8CodeUnitOffsetFromLineStart
  pred UTF32CodeUnitOffsetFromLineStart
    = UTF16CodeUnitOffsetFromLineStart
  pred (PositionEncoding'Unrecognized _)
    = Prelude.error
        "PositionEncoding.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault PositionEncoding where
  fieldDefault = UnspecifiedPositionEncoding
instance Control.DeepSeq.NFData PositionEncoding where
  rnf x__ = Prelude.seq x__ ()
newtype ProtocolVersion'UnrecognizedValue
  = ProtocolVersion'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data ProtocolVersion
  = UnspecifiedProtocolVersion |
    ProtocolVersion'Unrecognized !ProtocolVersion'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum ProtocolVersion where
  maybeToEnum 0 = Prelude.Just UnspecifiedProtocolVersion
  maybeToEnum k
    = Prelude.Just
        (ProtocolVersion'Unrecognized
           (ProtocolVersion'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedProtocolVersion = "UnspecifiedProtocolVersion"
  showEnum
    (ProtocolVersion'Unrecognized (ProtocolVersion'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedProtocolVersion"
    = Prelude.Just UnspecifiedProtocolVersion
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded ProtocolVersion where
  minBound = UnspecifiedProtocolVersion
  maxBound = UnspecifiedProtocolVersion
instance Prelude.Enum ProtocolVersion where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum ProtocolVersion: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedProtocolVersion = 0
  fromEnum
    (ProtocolVersion'Unrecognized (ProtocolVersion'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ UnspecifiedProtocolVersion
    = Prelude.error
        "ProtocolVersion.succ: bad argument UnspecifiedProtocolVersion. This value would be out of bounds."
  succ (ProtocolVersion'Unrecognized _)
    = Prelude.error
        "ProtocolVersion.succ: bad argument: unrecognized value"
  pred UnspecifiedProtocolVersion
    = Prelude.error
        "ProtocolVersion.pred: bad argument UnspecifiedProtocolVersion. This value would be out of bounds."
  pred (ProtocolVersion'Unrecognized _)
    = Prelude.error
        "ProtocolVersion.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault ProtocolVersion where
  fieldDefault = UnspecifiedProtocolVersion
instance Control.DeepSeq.NFData ProtocolVersion where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Scip_Fields.symbol' @:: Lens' Relationship Data.Text.Text@
         * 'Proto.Scip_Fields.isReference' @:: Lens' Relationship Prelude.Bool@
         * 'Proto.Scip_Fields.isImplementation' @:: Lens' Relationship Prelude.Bool@
         * 'Proto.Scip_Fields.isTypeDefinition' @:: Lens' Relationship Prelude.Bool@
         * 'Proto.Scip_Fields.isDefinition' @:: Lens' Relationship Prelude.Bool@ -}
data Relationship
  = Relationship'_constructor {_Relationship'symbol :: !Data.Text.Text,
                               _Relationship'isReference :: !Prelude.Bool,
                               _Relationship'isImplementation :: !Prelude.Bool,
                               _Relationship'isTypeDefinition :: !Prelude.Bool,
                               _Relationship'isDefinition :: !Prelude.Bool,
                               _Relationship'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Relationship where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Relationship "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Relationship'symbol
           (\ x__ y__ -> x__ {_Relationship'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Relationship "isReference" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Relationship'isReference
           (\ x__ y__ -> x__ {_Relationship'isReference = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Relationship "isImplementation" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Relationship'isImplementation
           (\ x__ y__ -> x__ {_Relationship'isImplementation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Relationship "isTypeDefinition" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Relationship'isTypeDefinition
           (\ x__ y__ -> x__ {_Relationship'isTypeDefinition = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Relationship "isDefinition" Prelude.Bool where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Relationship'isDefinition
           (\ x__ y__ -> x__ {_Relationship'isDefinition = y__}))
        Prelude.id
instance Data.ProtoLens.Message Relationship where
  messageName _ = Data.Text.pack "scip.Relationship"
  packedMessageDescriptor _
    = "\n\
      \\fRelationship\DC2\SYN\n\
      \\ACKsymbol\CAN\SOH \SOH(\tR\ACKsymbol\DC2!\n\
      \\fis_reference\CAN\STX \SOH(\bR\visReference\DC2+\n\
      \\DC1is_implementation\CAN\ETX \SOH(\bR\DLEisImplementation\DC2,\n\
      \\DC2is_type_definition\CAN\EOT \SOH(\bR\DLEisTypeDefinition\DC2#\n\
      \\ris_definition\CAN\ENQ \SOH(\bR\fisDefinition"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor Relationship
        isReference__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_reference"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"isReference")) ::
              Data.ProtoLens.FieldDescriptor Relationship
        isImplementation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_implementation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"isImplementation")) ::
              Data.ProtoLens.FieldDescriptor Relationship
        isTypeDefinition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_type_definition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"isTypeDefinition")) ::
              Data.ProtoLens.FieldDescriptor Relationship
        isDefinition__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "is_definition"
              (Data.ProtoLens.ScalarField Data.ProtoLens.BoolField ::
                 Data.ProtoLens.FieldTypeDescriptor Prelude.Bool)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"isDefinition")) ::
              Data.ProtoLens.FieldDescriptor Relationship
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, symbol__field_descriptor),
           (Data.ProtoLens.Tag 2, isReference__field_descriptor),
           (Data.ProtoLens.Tag 3, isImplementation__field_descriptor),
           (Data.ProtoLens.Tag 4, isTypeDefinition__field_descriptor),
           (Data.ProtoLens.Tag 5, isDefinition__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Relationship'_unknownFields
        (\ x__ y__ -> x__ {_Relationship'_unknownFields = y__})
  defMessage
    = Relationship'_constructor
        {_Relationship'symbol = Data.ProtoLens.fieldDefault,
         _Relationship'isReference = Data.ProtoLens.fieldDefault,
         _Relationship'isImplementation = Data.ProtoLens.fieldDefault,
         _Relationship'isTypeDefinition = Data.ProtoLens.fieldDefault,
         _Relationship'isDefinition = Data.ProtoLens.fieldDefault,
         _Relationship'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Relationship -> Data.ProtoLens.Encoding.Bytes.Parser Relationship
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                        16
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_reference"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"isReference") y x)
                        24
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_implementation"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"isImplementation") y x)
                        32
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_type_definition"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"isTypeDefinition") y x)
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          ((Prelude./=) 0) Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "is_definition"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"isDefinition") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Relationship"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v
                     = Lens.Family2.view (Data.ProtoLens.Field.field @"isReference") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 16)
                         ((Prelude..)
                            Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                            _v))
                ((Data.Monoid.<>)
                   (let
                      _v
                        = Lens.Family2.view
                            (Data.ProtoLens.Field.field @"isImplementation") _x
                    in
                      if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                          Data.Monoid.mempty
                      else
                          (Data.Monoid.<>)
                            (Data.ProtoLens.Encoding.Bytes.putVarInt 24)
                            ((Prelude..)
                               Data.ProtoLens.Encoding.Bytes.putVarInt (\ b -> if b then 1 else 0)
                               _v))
                   ((Data.Monoid.<>)
                      (let
                         _v
                           = Lens.Family2.view
                               (Data.ProtoLens.Field.field @"isTypeDefinition") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 32)
                               ((Prelude..)
                                  Data.ProtoLens.Encoding.Bytes.putVarInt
                                  (\ b -> if b then 1 else 0) _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"isDefinition") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (\ b -> if b then 1 else 0) _v))
                         (Data.ProtoLens.Encoding.Wire.buildFieldSet
                            (Lens.Family2.view Data.ProtoLens.unknownFields _x))))))
instance Control.DeepSeq.NFData Relationship where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Relationship'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Relationship'symbol x__)
                (Control.DeepSeq.deepseq
                   (_Relationship'isReference x__)
                   (Control.DeepSeq.deepseq
                      (_Relationship'isImplementation x__)
                      (Control.DeepSeq.deepseq
                         (_Relationship'isTypeDefinition x__)
                         (Control.DeepSeq.deepseq (_Relationship'isDefinition x__) ())))))
{- | Fields :
     
         * 'Proto.Scip_Fields.tpe' @:: Lens' RepeatedType Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' RepeatedType (Prelude.Maybe Type)@ -}
data RepeatedType
  = RepeatedType'_constructor {_RepeatedType'tpe :: !(Prelude.Maybe Type),
                               _RepeatedType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show RepeatedType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField RepeatedType "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RepeatedType'tpe (\ x__ y__ -> x__ {_RepeatedType'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField RepeatedType "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _RepeatedType'tpe (\ x__ y__ -> x__ {_RepeatedType'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Message RepeatedType where
  messageName _ = Data.Text.pack "scip.RepeatedType"
  packedMessageDescriptor _
    = "\n\
      \\fRepeatedType\DC2\FS\n\
      \\ETXtpe\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXtpe"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor RepeatedType
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, tpe__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _RepeatedType'_unknownFields
        (\ x__ y__ -> x__ {_RepeatedType'_unknownFields = y__})
  defMessage
    = RepeatedType'_constructor
        {_RepeatedType'tpe = Prelude.Nothing,
         _RepeatedType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          RepeatedType -> Data.ProtoLens.Encoding.Bytes.Parser RepeatedType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "RepeatedType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData RepeatedType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_RepeatedType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_RepeatedType'tpe x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.symlinks' @:: Lens' Scope [Data.Text.Text]@
         * 'Proto.Scip_Fields.vec'symlinks' @:: Lens' Scope (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Scip_Fields.hardlinks' @:: Lens' Scope [SymbolInformation]@
         * 'Proto.Scip_Fields.vec'hardlinks' @:: Lens' Scope (Data.Vector.Vector SymbolInformation)@ -}
data Scope
  = Scope'_constructor {_Scope'symlinks :: !(Data.Vector.Vector Data.Text.Text),
                        _Scope'hardlinks :: !(Data.Vector.Vector SymbolInformation),
                        _Scope'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Scope where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Scope "symlinks" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Scope'symlinks (\ x__ y__ -> x__ {_Scope'symlinks = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Scope "vec'symlinks" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Scope'symlinks (\ x__ y__ -> x__ {_Scope'symlinks = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Scope "hardlinks" [SymbolInformation] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Scope'hardlinks (\ x__ y__ -> x__ {_Scope'hardlinks = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Scope "vec'hardlinks" (Data.Vector.Vector SymbolInformation) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Scope'hardlinks (\ x__ y__ -> x__ {_Scope'hardlinks = y__}))
        Prelude.id
instance Data.ProtoLens.Message Scope where
  messageName _ = Data.Text.pack "scip.Scope"
  packedMessageDescriptor _
    = "\n\
      \\ENQScope\DC2\SUB\n\
      \\bsymlinks\CAN\SOH \ETX(\tR\bsymlinks\DC25\n\
      \\thardlinks\CAN\STX \ETX(\v2\ETB.scip.SymbolInformationR\thardlinks"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        symlinks__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symlinks"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"symlinks")) ::
              Data.ProtoLens.FieldDescriptor Scope
        hardlinks__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "hardlinks"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SymbolInformation)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"hardlinks")) ::
              Data.ProtoLens.FieldDescriptor Scope
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, symlinks__field_descriptor),
           (Data.ProtoLens.Tag 2, hardlinks__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Scope'_unknownFields
        (\ x__ y__ -> x__ {_Scope'_unknownFields = y__})
  defMessage
    = Scope'_constructor
        {_Scope'symlinks = Data.Vector.Generic.empty,
         _Scope'hardlinks = Data.Vector.Generic.empty,
         _Scope'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Scope
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld SymbolInformation
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
                -> Data.ProtoLens.Encoding.Bytes.Parser Scope
        loop x mutable'hardlinks mutable'symlinks
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'hardlinks <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'hardlinks)
                      frozen'symlinks <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                           (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                              mutable'symlinks)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'hardlinks") frozen'hardlinks
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'symlinks") frozen'symlinks x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "symlinks"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'symlinks y)
                                loop x mutable'hardlinks v
                        18
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "hardlinks"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'hardlinks y)
                                loop x v mutable'symlinks
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'hardlinks mutable'symlinks
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'hardlinks <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              mutable'symlinks <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                    Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'hardlinks mutable'symlinks)
          "Scope"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.Text.Encoding.encodeUtf8 _v))
                (Lens.Family2.view
                   (Data.ProtoLens.Field.field @"vec'symlinks") _x))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.ProtoLens.encodeMessage _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'hardlinks") _x))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData Scope where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Scope'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Scope'symlinks x__)
                (Control.DeepSeq.deepseq (_Scope'hardlinks x__) ()))
newtype Severity'UnrecognizedValue
  = Severity'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data Severity
  = UnspecifiedSeverity |
    Error |
    Warning |
    Information |
    Hint |
    Severity'Unrecognized !Severity'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum Severity where
  maybeToEnum 0 = Prelude.Just UnspecifiedSeverity
  maybeToEnum 1 = Prelude.Just Error
  maybeToEnum 2 = Prelude.Just Warning
  maybeToEnum 3 = Prelude.Just Information
  maybeToEnum 4 = Prelude.Just Hint
  maybeToEnum k
    = Prelude.Just
        (Severity'Unrecognized
           (Severity'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedSeverity = "UnspecifiedSeverity"
  showEnum Error = "Error"
  showEnum Warning = "Warning"
  showEnum Information = "Information"
  showEnum Hint = "Hint"
  showEnum (Severity'Unrecognized (Severity'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedSeverity"
    = Prelude.Just UnspecifiedSeverity
    | (Prelude.==) k "Error" = Prelude.Just Error
    | (Prelude.==) k "Warning" = Prelude.Just Warning
    | (Prelude.==) k "Information" = Prelude.Just Information
    | (Prelude.==) k "Hint" = Prelude.Just Hint
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded Severity where
  minBound = UnspecifiedSeverity
  maxBound = Hint
instance Prelude.Enum Severity where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Severity: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedSeverity = 0
  fromEnum Error = 1
  fromEnum Warning = 2
  fromEnum Information = 3
  fromEnum Hint = 4
  fromEnum (Severity'Unrecognized (Severity'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ Hint
    = Prelude.error
        "Severity.succ: bad argument Hint. This value would be out of bounds."
  succ UnspecifiedSeverity = Error
  succ Error = Warning
  succ Warning = Information
  succ Information = Hint
  succ (Severity'Unrecognized _)
    = Prelude.error "Severity.succ: bad argument: unrecognized value"
  pred UnspecifiedSeverity
    = Prelude.error
        "Severity.pred: bad argument UnspecifiedSeverity. This value would be out of bounds."
  pred Error = UnspecifiedSeverity
  pred Warning = Error
  pred Information = Warning
  pred Hint = Information
  pred (Severity'Unrecognized _)
    = Prelude.error "Severity.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault Severity where
  fieldDefault = UnspecifiedSeverity
instance Control.DeepSeq.NFData Severity where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' ShortConstant Data.Int.Int32@ -}
data ShortConstant
  = ShortConstant'_constructor {_ShortConstant'value :: !Data.Int.Int32,
                                _ShortConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ShortConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ShortConstant "value" Data.Int.Int32 where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ShortConstant'value
           (\ x__ y__ -> x__ {_ShortConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message ShortConstant where
  messageName _ = Data.Text.pack "scip.ShortConstant"
  packedMessageDescriptor _
    = "\n\
      \\rShortConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.Int32Field ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Int.Int32)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor ShortConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ShortConstant'_unknownFields
        (\ x__ y__ -> x__ {_ShortConstant'_unknownFields = y__})
  defMessage
    = ShortConstant'_constructor
        {_ShortConstant'value = Data.ProtoLens.fieldDefault,
         _ShortConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ShortConstant -> Data.ProtoLens.Encoding.Bytes.Parser ShortConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        8 -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.fromIntegral
                                          Data.ProtoLens.Encoding.Bytes.getVarInt)
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ShortConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 8)
                      ((Prelude..)
                         Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ShortConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ShortConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ShortConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.maybe'sealedValue' @:: Lens' Signature (Prelude.Maybe Signature'SealedValue)@
         * 'Proto.Scip_Fields.maybe'classSignature' @:: Lens' Signature (Prelude.Maybe ClassSignature)@
         * 'Proto.Scip_Fields.classSignature' @:: Lens' Signature ClassSignature@
         * 'Proto.Scip_Fields.maybe'methodSignature' @:: Lens' Signature (Prelude.Maybe MethodSignature)@
         * 'Proto.Scip_Fields.methodSignature' @:: Lens' Signature MethodSignature@
         * 'Proto.Scip_Fields.maybe'typeSignature' @:: Lens' Signature (Prelude.Maybe TypeSignature)@
         * 'Proto.Scip_Fields.typeSignature' @:: Lens' Signature TypeSignature@
         * 'Proto.Scip_Fields.maybe'valueSignature' @:: Lens' Signature (Prelude.Maybe ValueSignature)@
         * 'Proto.Scip_Fields.valueSignature' @:: Lens' Signature ValueSignature@ -}
data Signature
  = Signature'_constructor {_Signature'sealedValue :: !(Prelude.Maybe Signature'SealedValue),
                            _Signature'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Signature where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Signature'SealedValue
  = Signature'ClassSignature !ClassSignature |
    Signature'MethodSignature !MethodSignature |
    Signature'TypeSignature !TypeSignature |
    Signature'ValueSignature !ValueSignature
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Signature "maybe'sealedValue" (Prelude.Maybe Signature'SealedValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Signature "maybe'classSignature" (Prelude.Maybe ClassSignature) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Signature'ClassSignature x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Signature'ClassSignature y__))
instance Data.ProtoLens.Field.HasField Signature "classSignature" ClassSignature where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Signature'ClassSignature x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Signature'ClassSignature y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Signature "maybe'methodSignature" (Prelude.Maybe MethodSignature) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Signature'MethodSignature x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Signature'MethodSignature y__))
instance Data.ProtoLens.Field.HasField Signature "methodSignature" MethodSignature where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Signature'MethodSignature x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Signature'MethodSignature y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Signature "maybe'typeSignature" (Prelude.Maybe TypeSignature) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Signature'TypeSignature x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Signature'TypeSignature y__))
instance Data.ProtoLens.Field.HasField Signature "typeSignature" TypeSignature where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Signature'TypeSignature x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Signature'TypeSignature y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Signature "maybe'valueSignature" (Prelude.Maybe ValueSignature) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Signature'ValueSignature x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Signature'ValueSignature y__))
instance Data.ProtoLens.Field.HasField Signature "valueSignature" ValueSignature where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Signature'sealedValue
           (\ x__ y__ -> x__ {_Signature'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Signature'ValueSignature x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Signature'ValueSignature y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Signature where
  messageName _ = Data.Text.pack "scip.Signature"
  packedMessageDescriptor _
    = "\n\
      \\tSignature\DC2?\n\
      \\SIclass_signature\CAN\SOH \SOH(\v2\DC4.scip.ClassSignatureH\NULR\SOclassSignature\DC2B\n\
      \\DLEmethod_signature\CAN\STX \SOH(\v2\NAK.scip.MethodSignatureH\NULR\SImethodSignature\DC2<\n\
      \\SOtype_signature\CAN\ETX \SOH(\v2\DC3.scip.TypeSignatureH\NULR\rtypeSignature\DC2?\n\
      \\SIvalue_signature\CAN\EOT \SOH(\v2\DC4.scip.ValueSignatureH\NULR\SOvalueSignatureB\SO\n\
      \\fsealed_value"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        classSignature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "class_signature"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ClassSignature)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'classSignature")) ::
              Data.ProtoLens.FieldDescriptor Signature
        methodSignature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "method_signature"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MethodSignature)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'methodSignature")) ::
              Data.ProtoLens.FieldDescriptor Signature
        typeSignature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_signature"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TypeSignature)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeSignature")) ::
              Data.ProtoLens.FieldDescriptor Signature
        valueSignature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value_signature"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ValueSignature)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'valueSignature")) ::
              Data.ProtoLens.FieldDescriptor Signature
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, classSignature__field_descriptor),
           (Data.ProtoLens.Tag 2, methodSignature__field_descriptor),
           (Data.ProtoLens.Tag 3, typeSignature__field_descriptor),
           (Data.ProtoLens.Tag 4, valueSignature__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Signature'_unknownFields
        (\ x__ y__ -> x__ {_Signature'_unknownFields = y__})
  defMessage
    = Signature'_constructor
        {_Signature'sealedValue = Prelude.Nothing,
         _Signature'_unknownFields = []}
  parseMessage
    = let
        loop :: Signature -> Data.ProtoLens.Encoding.Bytes.Parser Signature
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "class_signature"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"classSignature") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "method_signature"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"methodSignature") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type_signature"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"typeSignature") y x)
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "value_signature"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"valueSignature") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Signature"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'sealedValue") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Signature'ClassSignature v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Signature'MethodSignature v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Signature'TypeSignature v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Signature'ValueSignature v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Signature where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Signature'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Signature'sealedValue x__) ())
instance Control.DeepSeq.NFData Signature'SealedValue where
  rnf (Signature'ClassSignature x__) = Control.DeepSeq.rnf x__
  rnf (Signature'MethodSignature x__) = Control.DeepSeq.rnf x__
  rnf (Signature'TypeSignature x__) = Control.DeepSeq.rnf x__
  rnf (Signature'ValueSignature x__) = Control.DeepSeq.rnf x__
_Signature'ClassSignature ::
  Data.ProtoLens.Prism.Prism' Signature'SealedValue ClassSignature
_Signature'ClassSignature
  = Data.ProtoLens.Prism.prism'
      Signature'ClassSignature
      (\ p__
         -> case p__ of
              (Signature'ClassSignature p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Signature'MethodSignature ::
  Data.ProtoLens.Prism.Prism' Signature'SealedValue MethodSignature
_Signature'MethodSignature
  = Data.ProtoLens.Prism.prism'
      Signature'MethodSignature
      (\ p__
         -> case p__ of
              (Signature'MethodSignature p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Signature'TypeSignature ::
  Data.ProtoLens.Prism.Prism' Signature'SealedValue TypeSignature
_Signature'TypeSignature
  = Data.ProtoLens.Prism.prism'
      Signature'TypeSignature
      (\ p__
         -> case p__ of
              (Signature'TypeSignature p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Signature'ValueSignature ::
  Data.ProtoLens.Prism.Prism' Signature'SealedValue ValueSignature
_Signature'ValueSignature
  = Data.ProtoLens.Prism.prism'
      Signature'ValueSignature
      (\ p__
         -> case p__ of
              (Signature'ValueSignature p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Scip_Fields.prefix' @:: Lens' SingleType Type@
         * 'Proto.Scip_Fields.maybe'prefix' @:: Lens' SingleType (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.symbol' @:: Lens' SingleType Data.Text.Text@ -}
data SingleType
  = SingleType'_constructor {_SingleType'prefix :: !(Prelude.Maybe Type),
                             _SingleType'symbol :: !Data.Text.Text,
                             _SingleType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SingleType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SingleType "prefix" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SingleType'prefix (\ x__ y__ -> x__ {_SingleType'prefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SingleType "maybe'prefix" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SingleType'prefix (\ x__ y__ -> x__ {_SingleType'prefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SingleType "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SingleType'symbol (\ x__ y__ -> x__ {_SingleType'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Message SingleType where
  messageName _ = Data.Text.pack "scip.SingleType"
  packedMessageDescriptor _
    = "\n\
      \\n\
      \SingleType\DC2\"\n\
      \\ACKprefix\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ACKprefix\DC2\SYN\n\
      \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        prefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "prefix"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'prefix")) ::
              Data.ProtoLens.FieldDescriptor SingleType
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor SingleType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, prefix__field_descriptor),
           (Data.ProtoLens.Tag 2, symbol__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SingleType'_unknownFields
        (\ x__ y__ -> x__ {_SingleType'_unknownFields = y__})
  defMessage
    = SingleType'_constructor
        {_SingleType'prefix = Prelude.Nothing,
         _SingleType'symbol = Data.ProtoLens.fieldDefault,
         _SingleType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SingleType -> Data.ProtoLens.Encoding.Bytes.Parser SingleType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "prefix"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"prefix") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SingleType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'prefix") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SingleType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SingleType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SingleType'prefix x__)
                (Control.DeepSeq.deepseq (_SingleType'symbol x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.value' @:: Lens' StringConstant Data.Text.Text@ -}
data StringConstant
  = StringConstant'_constructor {_StringConstant'value :: !Data.Text.Text,
                                 _StringConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show StringConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField StringConstant "value" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StringConstant'value
           (\ x__ y__ -> x__ {_StringConstant'value = y__}))
        Prelude.id
instance Data.ProtoLens.Message StringConstant where
  messageName _ = Data.Text.pack "scip.StringConstant"
  packedMessageDescriptor _
    = "\n\
      \\SOStringConstant\DC2\DC4\n\
      \\ENQvalue\CAN\SOH \SOH(\tR\ENQvalue"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        value__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "value"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"value")) ::
              Data.ProtoLens.FieldDescriptor StringConstant
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, value__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StringConstant'_unknownFields
        (\ x__ y__ -> x__ {_StringConstant'_unknownFields = y__})
  defMessage
    = StringConstant'_constructor
        {_StringConstant'value = Data.ProtoLens.fieldDefault,
         _StringConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StringConstant
          -> Data.ProtoLens.Encoding.Bytes.Parser StringConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "value"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"value") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "StringConstant"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"value") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData StringConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_StringConstant'_unknownFields x__)
             (Control.DeepSeq.deepseq (_StringConstant'value x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.tpe' @:: Lens' StructuralType Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' StructuralType (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.declarations' @:: Lens' StructuralType Scope@
         * 'Proto.Scip_Fields.maybe'declarations' @:: Lens' StructuralType (Prelude.Maybe Scope)@ -}
data StructuralType
  = StructuralType'_constructor {_StructuralType'tpe :: !(Prelude.Maybe Type),
                                 _StructuralType'declarations :: !(Prelude.Maybe Scope),
                                 _StructuralType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show StructuralType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField StructuralType "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StructuralType'tpe (\ x__ y__ -> x__ {_StructuralType'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField StructuralType "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StructuralType'tpe (\ x__ y__ -> x__ {_StructuralType'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField StructuralType "declarations" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StructuralType'declarations
           (\ x__ y__ -> x__ {_StructuralType'declarations = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField StructuralType "maybe'declarations" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _StructuralType'declarations
           (\ x__ y__ -> x__ {_StructuralType'declarations = y__}))
        Prelude.id
instance Data.ProtoLens.Message StructuralType where
  messageName _ = Data.Text.pack "scip.StructuralType"
  packedMessageDescriptor _
    = "\n\
      \\SOStructuralType\DC2\FS\n\
      \\ETXtpe\CAN\EOT \SOH(\v2\n\
      \.scip.TypeR\ETXtpe\DC2/\n\
      \\fdeclarations\CAN\ENQ \SOH(\v2\v.scip.ScopeR\fdeclarationsJ\EOT\b\SOH\DLE\STXJ\EOT\b\STX\DLE\ETXJ\EOT\b\ETX\DLE\EOT"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor StructuralType
        declarations__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "declarations"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'declarations")) ::
              Data.ProtoLens.FieldDescriptor StructuralType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 4, tpe__field_descriptor),
           (Data.ProtoLens.Tag 5, declarations__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _StructuralType'_unknownFields
        (\ x__ y__ -> x__ {_StructuralType'_unknownFields = y__})
  defMessage
    = StructuralType'_constructor
        {_StructuralType'tpe = Prelude.Nothing,
         _StructuralType'declarations = Prelude.Nothing,
         _StructuralType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          StructuralType
          -> Data.ProtoLens.Encoding.Bytes.Parser StructuralType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        34
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        42
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "declarations"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"declarations") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "StructuralType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'declarations") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 42)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData StructuralType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_StructuralType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_StructuralType'tpe x__)
                (Control.DeepSeq.deepseq (_StructuralType'declarations x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.prefix' @:: Lens' SuperType Type@
         * 'Proto.Scip_Fields.maybe'prefix' @:: Lens' SuperType (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.symbol' @:: Lens' SuperType Data.Text.Text@ -}
data SuperType
  = SuperType'_constructor {_SuperType'prefix :: !(Prelude.Maybe Type),
                            _SuperType'symbol :: !Data.Text.Text,
                            _SuperType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SuperType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SuperType "prefix" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SuperType'prefix (\ x__ y__ -> x__ {_SuperType'prefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SuperType "maybe'prefix" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SuperType'prefix (\ x__ y__ -> x__ {_SuperType'prefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SuperType "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SuperType'symbol (\ x__ y__ -> x__ {_SuperType'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Message SuperType where
  messageName _ = Data.Text.pack "scip.SuperType"
  packedMessageDescriptor _
    = "\n\
      \\tSuperType\DC2\"\n\
      \\ACKprefix\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ACKprefix\DC2\SYN\n\
      \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        prefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "prefix"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'prefix")) ::
              Data.ProtoLens.FieldDescriptor SuperType
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor SuperType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, prefix__field_descriptor),
           (Data.ProtoLens.Tag 2, symbol__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SuperType'_unknownFields
        (\ x__ y__ -> x__ {_SuperType'_unknownFields = y__})
  defMessage
    = SuperType'_constructor
        {_SuperType'prefix = Prelude.Nothing,
         _SuperType'symbol = Data.ProtoLens.fieldDefault,
         _SuperType'_unknownFields = []}
  parseMessage
    = let
        loop :: SuperType -> Data.ProtoLens.Encoding.Bytes.Parser SuperType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "prefix"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"prefix") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "SuperType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'prefix") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData SuperType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SuperType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SuperType'prefix x__)
                (Control.DeepSeq.deepseq (_SuperType'symbol x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.scheme' @:: Lens' Symbol Data.Text.Text@
         * 'Proto.Scip_Fields.package' @:: Lens' Symbol Package@
         * 'Proto.Scip_Fields.maybe'package' @:: Lens' Symbol (Prelude.Maybe Package)@
         * 'Proto.Scip_Fields.descriptors' @:: Lens' Symbol [Descriptor]@
         * 'Proto.Scip_Fields.vec'descriptors' @:: Lens' Symbol (Data.Vector.Vector Descriptor)@ -}
data Symbol
  = Symbol'_constructor {_Symbol'scheme :: !Data.Text.Text,
                         _Symbol'package :: !(Prelude.Maybe Package),
                         _Symbol'descriptors :: !(Data.Vector.Vector Descriptor),
                         _Symbol'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Symbol where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField Symbol "scheme" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Symbol'scheme (\ x__ y__ -> x__ {_Symbol'scheme = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Symbol "package" Package where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Symbol'package (\ x__ y__ -> x__ {_Symbol'package = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField Symbol "maybe'package" (Prelude.Maybe Package) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Symbol'package (\ x__ y__ -> x__ {_Symbol'package = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Symbol "descriptors" [Descriptor] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Symbol'descriptors (\ x__ y__ -> x__ {_Symbol'descriptors = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField Symbol "vec'descriptors" (Data.Vector.Vector Descriptor) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Symbol'descriptors (\ x__ y__ -> x__ {_Symbol'descriptors = y__}))
        Prelude.id
instance Data.ProtoLens.Message Symbol where
  messageName _ = Data.Text.pack "scip.Symbol"
  packedMessageDescriptor _
    = "\n\
      \\ACKSymbol\DC2\SYN\n\
      \\ACKscheme\CAN\SOH \SOH(\tR\ACKscheme\DC2'\n\
      \\apackage\CAN\STX \SOH(\v2\r.scip.PackageR\apackage\DC22\n\
      \\vdescriptors\CAN\ETX \ETX(\v2\DLE.scip.DescriptorR\vdescriptors"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        scheme__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "scheme"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"scheme")) ::
              Data.ProtoLens.FieldDescriptor Symbol
        package__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "package"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Package)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'package")) ::
              Data.ProtoLens.FieldDescriptor Symbol
        descriptors__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "descriptors"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Descriptor)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"descriptors")) ::
              Data.ProtoLens.FieldDescriptor Symbol
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, scheme__field_descriptor),
           (Data.ProtoLens.Tag 2, package__field_descriptor),
           (Data.ProtoLens.Tag 3, descriptors__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Symbol'_unknownFields
        (\ x__ y__ -> x__ {_Symbol'_unknownFields = y__})
  defMessage
    = Symbol'_constructor
        {_Symbol'scheme = Data.ProtoLens.fieldDefault,
         _Symbol'package = Prelude.Nothing,
         _Symbol'descriptors = Data.Vector.Generic.empty,
         _Symbol'_unknownFields = []}
  parseMessage
    = let
        loop ::
          Symbol
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Descriptor
             -> Data.ProtoLens.Encoding.Bytes.Parser Symbol
        loop x mutable'descriptors
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'descriptors <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                              (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                 mutable'descriptors)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'descriptors") frozen'descriptors
                              x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "scheme"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"scheme") y x)
                                  mutable'descriptors
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "package"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"package") y x)
                                  mutable'descriptors
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "descriptors"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'descriptors y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'descriptors
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'descriptors <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'descriptors)
          "Symbol"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"scheme") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'package") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'descriptors") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData Symbol where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Symbol'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_Symbol'scheme x__)
                (Control.DeepSeq.deepseq
                   (_Symbol'package x__)
                   (Control.DeepSeq.deepseq (_Symbol'descriptors x__) ())))
{- | Fields :
     
         * 'Proto.Scip_Fields.symbol' @:: Lens' SymbolInformation Data.Text.Text@
         * 'Proto.Scip_Fields.documentation' @:: Lens' SymbolInformation [Data.Text.Text]@
         * 'Proto.Scip_Fields.vec'documentation' @:: Lens' SymbolInformation (Data.Vector.Vector Data.Text.Text)@
         * 'Proto.Scip_Fields.relationships' @:: Lens' SymbolInformation [Relationship]@
         * 'Proto.Scip_Fields.vec'relationships' @:: Lens' SymbolInformation (Data.Vector.Vector Relationship)@
         * 'Proto.Scip_Fields.kind' @:: Lens' SymbolInformation SymbolInformation'Kind@
         * 'Proto.Scip_Fields.displayName' @:: Lens' SymbolInformation Data.Text.Text@
         * 'Proto.Scip_Fields.signatureDocumentation' @:: Lens' SymbolInformation Document@
         * 'Proto.Scip_Fields.maybe'signatureDocumentation' @:: Lens' SymbolInformation (Prelude.Maybe Document)@
         * 'Proto.Scip_Fields.enclosingSymbol' @:: Lens' SymbolInformation Data.Text.Text@
         * 'Proto.Scip_Fields.signature' @:: Lens' SymbolInformation Signature@
         * 'Proto.Scip_Fields.maybe'signature' @:: Lens' SymbolInformation (Prelude.Maybe Signature)@ -}
data SymbolInformation
  = SymbolInformation'_constructor {_SymbolInformation'symbol :: !Data.Text.Text,
                                    _SymbolInformation'documentation :: !(Data.Vector.Vector Data.Text.Text),
                                    _SymbolInformation'relationships :: !(Data.Vector.Vector Relationship),
                                    _SymbolInformation'kind :: !SymbolInformation'Kind,
                                    _SymbolInformation'displayName :: !Data.Text.Text,
                                    _SymbolInformation'signatureDocumentation :: !(Prelude.Maybe Document),
                                    _SymbolInformation'enclosingSymbol :: !Data.Text.Text,
                                    _SymbolInformation'signature :: !(Prelude.Maybe Signature),
                                    _SymbolInformation'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show SymbolInformation where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField SymbolInformation "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'symbol
           (\ x__ y__ -> x__ {_SymbolInformation'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "documentation" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'documentation
           (\ x__ y__ -> x__ {_SymbolInformation'documentation = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SymbolInformation "vec'documentation" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'documentation
           (\ x__ y__ -> x__ {_SymbolInformation'documentation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "relationships" [Relationship] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'relationships
           (\ x__ y__ -> x__ {_SymbolInformation'relationships = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField SymbolInformation "vec'relationships" (Data.Vector.Vector Relationship) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'relationships
           (\ x__ y__ -> x__ {_SymbolInformation'relationships = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "kind" SymbolInformation'Kind where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'kind
           (\ x__ y__ -> x__ {_SymbolInformation'kind = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "displayName" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'displayName
           (\ x__ y__ -> x__ {_SymbolInformation'displayName = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "signatureDocumentation" Document where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'signatureDocumentation
           (\ x__ y__
              -> x__ {_SymbolInformation'signatureDocumentation = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SymbolInformation "maybe'signatureDocumentation" (Prelude.Maybe Document) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'signatureDocumentation
           (\ x__ y__
              -> x__ {_SymbolInformation'signatureDocumentation = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "enclosingSymbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'enclosingSymbol
           (\ x__ y__ -> x__ {_SymbolInformation'enclosingSymbol = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField SymbolInformation "signature" Signature where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'signature
           (\ x__ y__ -> x__ {_SymbolInformation'signature = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField SymbolInformation "maybe'signature" (Prelude.Maybe Signature) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _SymbolInformation'signature
           (\ x__ y__ -> x__ {_SymbolInformation'signature = y__}))
        Prelude.id
instance Data.ProtoLens.Message SymbolInformation where
  messageName _ = Data.Text.pack "scip.SymbolInformation"
  packedMessageDescriptor _
    = "\n\
      \\DC1SymbolInformation\DC2\SYN\n\
      \\ACKsymbol\CAN\SOH \SOH(\tR\ACKsymbol\DC2$\n\
      \\rdocumentation\CAN\ETX \ETX(\tR\rdocumentation\DC28\n\
      \\rrelationships\CAN\EOT \ETX(\v2\DC2.scip.RelationshipR\rrelationships\DC20\n\
      \\EOTkind\CAN\ENQ \SOH(\SO2\FS.scip.SymbolInformation.KindR\EOTkind\DC2!\n\
      \\fdisplay_name\CAN\ACK \SOH(\tR\vdisplayName\DC2G\n\
      \\ETBsignature_documentation\CAN\a \SOH(\v2\SO.scip.DocumentR\SYNsignatureDocumentation\DC2)\n\
      \\DLEenclosing_symbol\CAN\b \SOH(\tR\SIenclosingSymbol\DC2-\n\
      \\tsignature\CAN\t \SOH(\v2\SI.scip.SignatureR\tsignature\"\212\t\n\
      \\EOTKind\DC2\DC3\n\
      \\SIUnspecifiedKind\DLE\NUL\DC2\DC2\n\
      \\SOAbstractMethod\DLEB\DC2\f\n\
      \\bAccessor\DLEH\DC2\t\n\
      \\ENQArray\DLE\SOH\DC2\r\n\
      \\tAssertion\DLE\STX\DC2\DC2\n\
      \\SOAssociatedType\DLE\ETX\DC2\r\n\
      \\tAttribute\DLE\EOT\DC2\t\n\
      \\ENQAxiom\DLE\ENQ\DC2\v\n\
      \\aBoolean\DLE\ACK\DC2\t\n\
      \\ENQClass\DLE\a\DC2\f\n\
      \\bConstant\DLE\b\DC2\SI\n\
      \\vConstructor\DLE\t\DC2\f\n\
      \\bContract\DLE>\DC2\SO\n\
      \\n\
      \DataFamily\DLE\n\
      \\DC2\f\n\
      \\bDelegate\DLEI\DC2\b\n\
      \\EOTEnum\DLE\v\DC2\SO\n\
      \\n\
      \EnumMember\DLE\f\DC2\t\n\
      \\ENQError\DLE?\DC2\t\n\
      \\ENQEvent\DLE\r\DC2\b\n\
      \\EOTFact\DLE\SO\DC2\t\n\
      \\ENQField\DLE\SI\DC2\b\n\
      \\EOTFile\DLE\DLE\DC2\f\n\
      \\bFunction\DLE\DC1\DC2\n\
      \\n\
      \\ACKGetter\DLE\DC2\DC2\v\n\
      \\aGrammar\DLE\DC3\DC2\f\n\
      \\bInstance\DLE\DC4\DC2\r\n\
      \\tInterface\DLE\NAK\DC2\a\n\
      \\ETXKey\DLE\SYN\DC2\b\n\
      \\EOTLang\DLE\ETB\DC2\t\n\
      \\ENQLemma\DLE\CAN\DC2\v\n\
      \\aLibrary\DLE@\DC2\t\n\
      \\ENQMacro\DLE\EM\DC2\n\
      \\n\
      \\ACKMethod\DLE\SUB\DC2\SI\n\
      \\vMethodAlias\DLEJ\DC2\DC2\n\
      \\SOMethodReceiver\DLE\ESC\DC2\ETB\n\
      \\DC3MethodSpecification\DLEC\DC2\v\n\
      \\aMessage\DLE\FS\DC2\f\n\
      \\bModifier\DLEA\DC2\n\
      \\n\
      \\ACKModule\DLE\GS\DC2\r\n\
      \\tNamespace\DLE\RS\DC2\b\n\
      \\EOTNull\DLE\US\DC2\n\
      \\n\
      \\ACKNumber\DLE \DC2\n\
      \\n\
      \\ACKObject\DLE!\DC2\f\n\
      \\bOperator\DLE\"\DC2\v\n\
      \\aPackage\DLE#\DC2\DC1\n\
      \\rPackageObject\DLE$\DC2\r\n\
      \\tParameter\DLE%\DC2\DC2\n\
      \\SOParameterLabel\DLE&\DC2\v\n\
      \\aPattern\DLE'\DC2\r\n\
      \\tPredicate\DLE(\DC2\f\n\
      \\bProperty\DLE)\DC2\f\n\
      \\bProtocol\DLE*\DC2\DC2\n\
      \\SOProtocolMethod\DLED\DC2\NAK\n\
      \\DC1PureVirtualMethod\DLEE\DC2\SI\n\
      \\vQuasiquoter\DLE+\DC2\DC1\n\
      \\rSelfParameter\DLE,\DC2\n\
      \\n\
      \\ACKSetter\DLE-\DC2\r\n\
      \\tSignature\DLE.\DC2\DC2\n\
      \\SOSingletonClass\DLEK\DC2\DC3\n\
      \\SISingletonMethod\DLEL\DC2\DC4\n\
      \\DLEStaticDataMember\DLEM\DC2\SI\n\
      \\vStaticEvent\DLEN\DC2\SI\n\
      \\vStaticField\DLEO\DC2\DLE\n\
      \\fStaticMethod\DLEP\DC2\DC2\n\
      \\SOStaticProperty\DLEQ\DC2\DC2\n\
      \\SOStaticVariable\DLER\DC2\n\
      \\n\
      \\ACKString\DLE0\DC2\n\
      \\n\
      \\ACKStruct\DLE1\DC2\r\n\
      \\tSubscript\DLE/\DC2\n\
      \\n\
      \\ACKTactic\DLE2\DC2\v\n\
      \\aTheorem\DLE3\DC2\DC1\n\
      \\rThisParameter\DLE4\DC2\t\n\
      \\ENQTrait\DLE5\DC2\SI\n\
      \\vTraitMethod\DLEF\DC2\b\n\
      \\EOTType\DLE6\DC2\r\n\
      \\tTypeAlias\DLE7\DC2\r\n\
      \\tTypeClass\DLE8\DC2\DC3\n\
      \\SITypeClassMethod\DLEG\DC2\SO\n\
      \\n\
      \TypeFamily\DLE9\DC2\DC1\n\
      \\rTypeParameter\DLE:\DC2\t\n\
      \\ENQUnion\DLE;\DC2\t\n\
      \\ENQValue\DLE<\DC2\f\n\
      \\bVariable\DLE="
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        documentation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "documentation"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"documentation")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        relationships__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "relationships"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Relationship)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"relationships")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        kind__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "kind"
              (Data.ProtoLens.ScalarField Data.ProtoLens.EnumField ::
                 Data.ProtoLens.FieldTypeDescriptor SymbolInformation'Kind)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"kind")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        displayName__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "display_name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"displayName")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        signatureDocumentation__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "signature_documentation"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Document)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'signatureDocumentation")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        enclosingSymbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "enclosing_symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional
                 (Data.ProtoLens.Field.field @"enclosingSymbol")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
        signature__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "signature"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Signature)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'signature")) ::
              Data.ProtoLens.FieldDescriptor SymbolInformation
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, symbol__field_descriptor),
           (Data.ProtoLens.Tag 3, documentation__field_descriptor),
           (Data.ProtoLens.Tag 4, relationships__field_descriptor),
           (Data.ProtoLens.Tag 5, kind__field_descriptor),
           (Data.ProtoLens.Tag 6, displayName__field_descriptor),
           (Data.ProtoLens.Tag 7, signatureDocumentation__field_descriptor),
           (Data.ProtoLens.Tag 8, enclosingSymbol__field_descriptor),
           (Data.ProtoLens.Tag 9, signature__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _SymbolInformation'_unknownFields
        (\ x__ y__ -> x__ {_SymbolInformation'_unknownFields = y__})
  defMessage
    = SymbolInformation'_constructor
        {_SymbolInformation'symbol = Data.ProtoLens.fieldDefault,
         _SymbolInformation'documentation = Data.Vector.Generic.empty,
         _SymbolInformation'relationships = Data.Vector.Generic.empty,
         _SymbolInformation'kind = Data.ProtoLens.fieldDefault,
         _SymbolInformation'displayName = Data.ProtoLens.fieldDefault,
         _SymbolInformation'signatureDocumentation = Prelude.Nothing,
         _SymbolInformation'enclosingSymbol = Data.ProtoLens.fieldDefault,
         _SymbolInformation'signature = Prelude.Nothing,
         _SymbolInformation'_unknownFields = []}
  parseMessage
    = let
        loop ::
          SymbolInformation
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Relationship
                -> Data.ProtoLens.Encoding.Bytes.Parser SymbolInformation
        loop x mutable'documentation mutable'relationships
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'documentation <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                   mutable'documentation)
                      frozen'relationships <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                   mutable'relationships)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'documentation")
                              frozen'documentation
                              (Lens.Family2.set
                                 (Data.ProtoLens.Field.field @"vec'relationships")
                                 frozen'relationships x)))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                                  mutable'documentation mutable'relationships
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "documentation"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'documentation y)
                                loop x v mutable'relationships
                        34
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "relationships"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'relationships y)
                                loop x mutable'documentation v
                        40
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (Prelude.fmap
                                          Prelude.toEnum
                                          (Prelude.fmap
                                             Prelude.fromIntegral
                                             Data.ProtoLens.Encoding.Bytes.getVarInt))
                                       "kind"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"kind") y x)
                                  mutable'documentation mutable'relationships
                        50
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "display_name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"displayName") y x)
                                  mutable'documentation mutable'relationships
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "signature_documentation"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"signatureDocumentation") y x)
                                  mutable'documentation mutable'relationships
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "enclosing_symbol"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"enclosingSymbol") y x)
                                  mutable'documentation mutable'relationships
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "signature"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"signature") y x)
                                  mutable'documentation mutable'relationships
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'documentation mutable'relationships
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'documentation <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         Data.ProtoLens.Encoding.Growing.new
              mutable'relationships <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         Data.ProtoLens.Encoding.Growing.new
              loop
                Data.ProtoLens.defMessage mutable'documentation
                mutable'relationships)
          "SymbolInformation"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                   (\ _v
                      -> (Data.Monoid.<>)
                           (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                           ((Prelude..)
                              (\ bs
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt
                                         (Prelude.fromIntegral (Data.ByteString.length bs)))
                                      (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                              Data.Text.Encoding.encodeUtf8 _v))
                   (Lens.Family2.view
                      (Data.ProtoLens.Field.field @"vec'documentation") _x))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 34)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'relationships") _x))
                   ((Data.Monoid.<>)
                      (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"kind") _x
                       in
                         if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                             Data.Monoid.mempty
                         else
                             (Data.Monoid.<>)
                               (Data.ProtoLens.Encoding.Bytes.putVarInt 40)
                               ((Prelude..)
                                  ((Prelude..)
                                     Data.ProtoLens.Encoding.Bytes.putVarInt Prelude.fromIntegral)
                                  Prelude.fromEnum _v))
                      ((Data.Monoid.<>)
                         (let
                            _v
                              = Lens.Family2.view (Data.ProtoLens.Field.field @"displayName") _x
                          in
                            if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                Data.Monoid.mempty
                            else
                                (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt 50)
                                  ((Prelude..)
                                     (\ bs
                                        -> (Data.Monoid.<>)
                                             (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                (Prelude.fromIntegral (Data.ByteString.length bs)))
                                             (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                     Data.Text.Encoding.encodeUtf8 _v))
                         ((Data.Monoid.<>)
                            (case
                                 Lens.Family2.view
                                   (Data.ProtoLens.Field.field @"maybe'signatureDocumentation") _x
                             of
                               Prelude.Nothing -> Data.Monoid.mempty
                               (Prelude.Just _v)
                                 -> (Data.Monoid.<>)
                                      (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                                      ((Prelude..)
                                         (\ bs
                                            -> (Data.Monoid.<>)
                                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                    (Prelude.fromIntegral
                                                       (Data.ByteString.length bs)))
                                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                         Data.ProtoLens.encodeMessage _v))
                            ((Data.Monoid.<>)
                               (let
                                  _v
                                    = Lens.Family2.view
                                        (Data.ProtoLens.Field.field @"enclosingSymbol") _x
                                in
                                  if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                                      Data.Monoid.mempty
                                  else
                                      (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                                        ((Prelude..)
                                           (\ bs
                                              -> (Data.Monoid.<>)
                                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                      (Prelude.fromIntegral
                                                         (Data.ByteString.length bs)))
                                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                           Data.Text.Encoding.encodeUtf8 _v))
                               ((Data.Monoid.<>)
                                  (case
                                       Lens.Family2.view
                                         (Data.ProtoLens.Field.field @"maybe'signature") _x
                                   of
                                     Prelude.Nothing -> Data.Monoid.mempty
                                     (Prelude.Just _v)
                                       -> (Data.Monoid.<>)
                                            (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                                            ((Prelude..)
                                               (\ bs
                                                  -> (Data.Monoid.<>)
                                                       (Data.ProtoLens.Encoding.Bytes.putVarInt
                                                          (Prelude.fromIntegral
                                                             (Data.ByteString.length bs)))
                                                       (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                               Data.ProtoLens.encodeMessage _v))
                                  (Data.ProtoLens.Encoding.Wire.buildFieldSet
                                     (Lens.Family2.view Data.ProtoLens.unknownFields _x)))))))))
instance Control.DeepSeq.NFData SymbolInformation where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_SymbolInformation'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_SymbolInformation'symbol x__)
                (Control.DeepSeq.deepseq
                   (_SymbolInformation'documentation x__)
                   (Control.DeepSeq.deepseq
                      (_SymbolInformation'relationships x__)
                      (Control.DeepSeq.deepseq
                         (_SymbolInformation'kind x__)
                         (Control.DeepSeq.deepseq
                            (_SymbolInformation'displayName x__)
                            (Control.DeepSeq.deepseq
                               (_SymbolInformation'signatureDocumentation x__)
                               (Control.DeepSeq.deepseq
                                  (_SymbolInformation'enclosingSymbol x__)
                                  (Control.DeepSeq.deepseq
                                     (_SymbolInformation'signature x__) ()))))))))
newtype SymbolInformation'Kind'UnrecognizedValue
  = SymbolInformation'Kind'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data SymbolInformation'Kind
  = SymbolInformation'UnspecifiedKind |
    SymbolInformation'Array |
    SymbolInformation'Assertion |
    SymbolInformation'AssociatedType |
    SymbolInformation'Attribute |
    SymbolInformation'Axiom |
    SymbolInformation'Boolean |
    SymbolInformation'Class |
    SymbolInformation'Constant |
    SymbolInformation'Constructor |
    SymbolInformation'DataFamily |
    SymbolInformation'Enum |
    SymbolInformation'EnumMember |
    SymbolInformation'Event |
    SymbolInformation'Fact |
    SymbolInformation'Field |
    SymbolInformation'File |
    SymbolInformation'Function |
    SymbolInformation'Getter |
    SymbolInformation'Grammar |
    SymbolInformation'Instance |
    SymbolInformation'Interface |
    SymbolInformation'Key |
    SymbolInformation'Lang |
    SymbolInformation'Lemma |
    SymbolInformation'Macro |
    SymbolInformation'Method |
    SymbolInformation'MethodReceiver |
    SymbolInformation'Message |
    SymbolInformation'Module |
    SymbolInformation'Namespace |
    SymbolInformation'Null |
    SymbolInformation'Number |
    SymbolInformation'Object |
    SymbolInformation'Operator |
    SymbolInformation'Package |
    SymbolInformation'PackageObject |
    SymbolInformation'Parameter |
    SymbolInformation'ParameterLabel |
    SymbolInformation'Pattern |
    SymbolInformation'Predicate |
    SymbolInformation'Property |
    SymbolInformation'Protocol |
    SymbolInformation'Quasiquoter |
    SymbolInformation'SelfParameter |
    SymbolInformation'Setter |
    SymbolInformation'Signature |
    SymbolInformation'Subscript |
    SymbolInformation'String |
    SymbolInformation'Struct |
    SymbolInformation'Tactic |
    SymbolInformation'Theorem |
    SymbolInformation'ThisParameter |
    SymbolInformation'Trait |
    SymbolInformation'Type |
    SymbolInformation'TypeAlias |
    SymbolInformation'TypeClass |
    SymbolInformation'TypeFamily |
    SymbolInformation'TypeParameter |
    SymbolInformation'Union |
    SymbolInformation'Value |
    SymbolInformation'Variable |
    SymbolInformation'Contract |
    SymbolInformation'Error |
    SymbolInformation'Library |
    SymbolInformation'Modifier |
    SymbolInformation'AbstractMethod |
    SymbolInformation'MethodSpecification |
    SymbolInformation'ProtocolMethod |
    SymbolInformation'PureVirtualMethod |
    SymbolInformation'TraitMethod |
    SymbolInformation'TypeClassMethod |
    SymbolInformation'Accessor |
    SymbolInformation'Delegate |
    SymbolInformation'MethodAlias |
    SymbolInformation'SingletonClass |
    SymbolInformation'SingletonMethod |
    SymbolInformation'StaticDataMember |
    SymbolInformation'StaticEvent |
    SymbolInformation'StaticField |
    SymbolInformation'StaticMethod |
    SymbolInformation'StaticProperty |
    SymbolInformation'StaticVariable |
    SymbolInformation'Kind'Unrecognized !SymbolInformation'Kind'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum SymbolInformation'Kind where
  maybeToEnum 0 = Prelude.Just SymbolInformation'UnspecifiedKind
  maybeToEnum 1 = Prelude.Just SymbolInformation'Array
  maybeToEnum 2 = Prelude.Just SymbolInformation'Assertion
  maybeToEnum 3 = Prelude.Just SymbolInformation'AssociatedType
  maybeToEnum 4 = Prelude.Just SymbolInformation'Attribute
  maybeToEnum 5 = Prelude.Just SymbolInformation'Axiom
  maybeToEnum 6 = Prelude.Just SymbolInformation'Boolean
  maybeToEnum 7 = Prelude.Just SymbolInformation'Class
  maybeToEnum 8 = Prelude.Just SymbolInformation'Constant
  maybeToEnum 9 = Prelude.Just SymbolInformation'Constructor
  maybeToEnum 10 = Prelude.Just SymbolInformation'DataFamily
  maybeToEnum 11 = Prelude.Just SymbolInformation'Enum
  maybeToEnum 12 = Prelude.Just SymbolInformation'EnumMember
  maybeToEnum 13 = Prelude.Just SymbolInformation'Event
  maybeToEnum 14 = Prelude.Just SymbolInformation'Fact
  maybeToEnum 15 = Prelude.Just SymbolInformation'Field
  maybeToEnum 16 = Prelude.Just SymbolInformation'File
  maybeToEnum 17 = Prelude.Just SymbolInformation'Function
  maybeToEnum 18 = Prelude.Just SymbolInformation'Getter
  maybeToEnum 19 = Prelude.Just SymbolInformation'Grammar
  maybeToEnum 20 = Prelude.Just SymbolInformation'Instance
  maybeToEnum 21 = Prelude.Just SymbolInformation'Interface
  maybeToEnum 22 = Prelude.Just SymbolInformation'Key
  maybeToEnum 23 = Prelude.Just SymbolInformation'Lang
  maybeToEnum 24 = Prelude.Just SymbolInformation'Lemma
  maybeToEnum 25 = Prelude.Just SymbolInformation'Macro
  maybeToEnum 26 = Prelude.Just SymbolInformation'Method
  maybeToEnum 27 = Prelude.Just SymbolInformation'MethodReceiver
  maybeToEnum 28 = Prelude.Just SymbolInformation'Message
  maybeToEnum 29 = Prelude.Just SymbolInformation'Module
  maybeToEnum 30 = Prelude.Just SymbolInformation'Namespace
  maybeToEnum 31 = Prelude.Just SymbolInformation'Null
  maybeToEnum 32 = Prelude.Just SymbolInformation'Number
  maybeToEnum 33 = Prelude.Just SymbolInformation'Object
  maybeToEnum 34 = Prelude.Just SymbolInformation'Operator
  maybeToEnum 35 = Prelude.Just SymbolInformation'Package
  maybeToEnum 36 = Prelude.Just SymbolInformation'PackageObject
  maybeToEnum 37 = Prelude.Just SymbolInformation'Parameter
  maybeToEnum 38 = Prelude.Just SymbolInformation'ParameterLabel
  maybeToEnum 39 = Prelude.Just SymbolInformation'Pattern
  maybeToEnum 40 = Prelude.Just SymbolInformation'Predicate
  maybeToEnum 41 = Prelude.Just SymbolInformation'Property
  maybeToEnum 42 = Prelude.Just SymbolInformation'Protocol
  maybeToEnum 43 = Prelude.Just SymbolInformation'Quasiquoter
  maybeToEnum 44 = Prelude.Just SymbolInformation'SelfParameter
  maybeToEnum 45 = Prelude.Just SymbolInformation'Setter
  maybeToEnum 46 = Prelude.Just SymbolInformation'Signature
  maybeToEnum 47 = Prelude.Just SymbolInformation'Subscript
  maybeToEnum 48 = Prelude.Just SymbolInformation'String
  maybeToEnum 49 = Prelude.Just SymbolInformation'Struct
  maybeToEnum 50 = Prelude.Just SymbolInformation'Tactic
  maybeToEnum 51 = Prelude.Just SymbolInformation'Theorem
  maybeToEnum 52 = Prelude.Just SymbolInformation'ThisParameter
  maybeToEnum 53 = Prelude.Just SymbolInformation'Trait
  maybeToEnum 54 = Prelude.Just SymbolInformation'Type
  maybeToEnum 55 = Prelude.Just SymbolInformation'TypeAlias
  maybeToEnum 56 = Prelude.Just SymbolInformation'TypeClass
  maybeToEnum 57 = Prelude.Just SymbolInformation'TypeFamily
  maybeToEnum 58 = Prelude.Just SymbolInformation'TypeParameter
  maybeToEnum 59 = Prelude.Just SymbolInformation'Union
  maybeToEnum 60 = Prelude.Just SymbolInformation'Value
  maybeToEnum 61 = Prelude.Just SymbolInformation'Variable
  maybeToEnum 62 = Prelude.Just SymbolInformation'Contract
  maybeToEnum 63 = Prelude.Just SymbolInformation'Error
  maybeToEnum 64 = Prelude.Just SymbolInformation'Library
  maybeToEnum 65 = Prelude.Just SymbolInformation'Modifier
  maybeToEnum 66 = Prelude.Just SymbolInformation'AbstractMethod
  maybeToEnum 67 = Prelude.Just SymbolInformation'MethodSpecification
  maybeToEnum 68 = Prelude.Just SymbolInformation'ProtocolMethod
  maybeToEnum 69 = Prelude.Just SymbolInformation'PureVirtualMethod
  maybeToEnum 70 = Prelude.Just SymbolInformation'TraitMethod
  maybeToEnum 71 = Prelude.Just SymbolInformation'TypeClassMethod
  maybeToEnum 72 = Prelude.Just SymbolInformation'Accessor
  maybeToEnum 73 = Prelude.Just SymbolInformation'Delegate
  maybeToEnum 74 = Prelude.Just SymbolInformation'MethodAlias
  maybeToEnum 75 = Prelude.Just SymbolInformation'SingletonClass
  maybeToEnum 76 = Prelude.Just SymbolInformation'SingletonMethod
  maybeToEnum 77 = Prelude.Just SymbolInformation'StaticDataMember
  maybeToEnum 78 = Prelude.Just SymbolInformation'StaticEvent
  maybeToEnum 79 = Prelude.Just SymbolInformation'StaticField
  maybeToEnum 80 = Prelude.Just SymbolInformation'StaticMethod
  maybeToEnum 81 = Prelude.Just SymbolInformation'StaticProperty
  maybeToEnum 82 = Prelude.Just SymbolInformation'StaticVariable
  maybeToEnum k
    = Prelude.Just
        (SymbolInformation'Kind'Unrecognized
           (SymbolInformation'Kind'UnrecognizedValue
              (Prelude.fromIntegral k)))
  showEnum SymbolInformation'UnspecifiedKind = "UnspecifiedKind"
  showEnum SymbolInformation'AbstractMethod = "AbstractMethod"
  showEnum SymbolInformation'Accessor = "Accessor"
  showEnum SymbolInformation'Array = "Array"
  showEnum SymbolInformation'Assertion = "Assertion"
  showEnum SymbolInformation'AssociatedType = "AssociatedType"
  showEnum SymbolInformation'Attribute = "Attribute"
  showEnum SymbolInformation'Axiom = "Axiom"
  showEnum SymbolInformation'Boolean = "Boolean"
  showEnum SymbolInformation'Class = "Class"
  showEnum SymbolInformation'Constant = "Constant"
  showEnum SymbolInformation'Constructor = "Constructor"
  showEnum SymbolInformation'Contract = "Contract"
  showEnum SymbolInformation'DataFamily = "DataFamily"
  showEnum SymbolInformation'Delegate = "Delegate"
  showEnum SymbolInformation'Enum = "Enum"
  showEnum SymbolInformation'EnumMember = "EnumMember"
  showEnum SymbolInformation'Error = "Error"
  showEnum SymbolInformation'Event = "Event"
  showEnum SymbolInformation'Fact = "Fact"
  showEnum SymbolInformation'Field = "Field"
  showEnum SymbolInformation'File = "File"
  showEnum SymbolInformation'Function = "Function"
  showEnum SymbolInformation'Getter = "Getter"
  showEnum SymbolInformation'Grammar = "Grammar"
  showEnum SymbolInformation'Instance = "Instance"
  showEnum SymbolInformation'Interface = "Interface"
  showEnum SymbolInformation'Key = "Key"
  showEnum SymbolInformation'Lang = "Lang"
  showEnum SymbolInformation'Lemma = "Lemma"
  showEnum SymbolInformation'Library = "Library"
  showEnum SymbolInformation'Macro = "Macro"
  showEnum SymbolInformation'Method = "Method"
  showEnum SymbolInformation'MethodAlias = "MethodAlias"
  showEnum SymbolInformation'MethodReceiver = "MethodReceiver"
  showEnum SymbolInformation'MethodSpecification
    = "MethodSpecification"
  showEnum SymbolInformation'Message = "Message"
  showEnum SymbolInformation'Modifier = "Modifier"
  showEnum SymbolInformation'Module = "Module"
  showEnum SymbolInformation'Namespace = "Namespace"
  showEnum SymbolInformation'Null = "Null"
  showEnum SymbolInformation'Number = "Number"
  showEnum SymbolInformation'Object = "Object"
  showEnum SymbolInformation'Operator = "Operator"
  showEnum SymbolInformation'Package = "Package"
  showEnum SymbolInformation'PackageObject = "PackageObject"
  showEnum SymbolInformation'Parameter = "Parameter"
  showEnum SymbolInformation'ParameterLabel = "ParameterLabel"
  showEnum SymbolInformation'Pattern = "Pattern"
  showEnum SymbolInformation'Predicate = "Predicate"
  showEnum SymbolInformation'Property = "Property"
  showEnum SymbolInformation'Protocol = "Protocol"
  showEnum SymbolInformation'ProtocolMethod = "ProtocolMethod"
  showEnum SymbolInformation'PureVirtualMethod = "PureVirtualMethod"
  showEnum SymbolInformation'Quasiquoter = "Quasiquoter"
  showEnum SymbolInformation'SelfParameter = "SelfParameter"
  showEnum SymbolInformation'Setter = "Setter"
  showEnum SymbolInformation'Signature = "Signature"
  showEnum SymbolInformation'SingletonClass = "SingletonClass"
  showEnum SymbolInformation'SingletonMethod = "SingletonMethod"
  showEnum SymbolInformation'StaticDataMember = "StaticDataMember"
  showEnum SymbolInformation'StaticEvent = "StaticEvent"
  showEnum SymbolInformation'StaticField = "StaticField"
  showEnum SymbolInformation'StaticMethod = "StaticMethod"
  showEnum SymbolInformation'StaticProperty = "StaticProperty"
  showEnum SymbolInformation'StaticVariable = "StaticVariable"
  showEnum SymbolInformation'String = "String"
  showEnum SymbolInformation'Struct = "Struct"
  showEnum SymbolInformation'Subscript = "Subscript"
  showEnum SymbolInformation'Tactic = "Tactic"
  showEnum SymbolInformation'Theorem = "Theorem"
  showEnum SymbolInformation'ThisParameter = "ThisParameter"
  showEnum SymbolInformation'Trait = "Trait"
  showEnum SymbolInformation'TraitMethod = "TraitMethod"
  showEnum SymbolInformation'Type = "Type"
  showEnum SymbolInformation'TypeAlias = "TypeAlias"
  showEnum SymbolInformation'TypeClass = "TypeClass"
  showEnum SymbolInformation'TypeClassMethod = "TypeClassMethod"
  showEnum SymbolInformation'TypeFamily = "TypeFamily"
  showEnum SymbolInformation'TypeParameter = "TypeParameter"
  showEnum SymbolInformation'Union = "Union"
  showEnum SymbolInformation'Value = "Value"
  showEnum SymbolInformation'Variable = "Variable"
  showEnum
    (SymbolInformation'Kind'Unrecognized (SymbolInformation'Kind'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedKind"
    = Prelude.Just SymbolInformation'UnspecifiedKind
    | (Prelude.==) k "AbstractMethod"
    = Prelude.Just SymbolInformation'AbstractMethod
    | (Prelude.==) k "Accessor"
    = Prelude.Just SymbolInformation'Accessor
    | (Prelude.==) k "Array" = Prelude.Just SymbolInformation'Array
    | (Prelude.==) k "Assertion"
    = Prelude.Just SymbolInformation'Assertion
    | (Prelude.==) k "AssociatedType"
    = Prelude.Just SymbolInformation'AssociatedType
    | (Prelude.==) k "Attribute"
    = Prelude.Just SymbolInformation'Attribute
    | (Prelude.==) k "Axiom" = Prelude.Just SymbolInformation'Axiom
    | (Prelude.==) k "Boolean" = Prelude.Just SymbolInformation'Boolean
    | (Prelude.==) k "Class" = Prelude.Just SymbolInformation'Class
    | (Prelude.==) k "Constant"
    = Prelude.Just SymbolInformation'Constant
    | (Prelude.==) k "Constructor"
    = Prelude.Just SymbolInformation'Constructor
    | (Prelude.==) k "Contract"
    = Prelude.Just SymbolInformation'Contract
    | (Prelude.==) k "DataFamily"
    = Prelude.Just SymbolInformation'DataFamily
    | (Prelude.==) k "Delegate"
    = Prelude.Just SymbolInformation'Delegate
    | (Prelude.==) k "Enum" = Prelude.Just SymbolInformation'Enum
    | (Prelude.==) k "EnumMember"
    = Prelude.Just SymbolInformation'EnumMember
    | (Prelude.==) k "Error" = Prelude.Just SymbolInformation'Error
    | (Prelude.==) k "Event" = Prelude.Just SymbolInformation'Event
    | (Prelude.==) k "Fact" = Prelude.Just SymbolInformation'Fact
    | (Prelude.==) k "Field" = Prelude.Just SymbolInformation'Field
    | (Prelude.==) k "File" = Prelude.Just SymbolInformation'File
    | (Prelude.==) k "Function"
    = Prelude.Just SymbolInformation'Function
    | (Prelude.==) k "Getter" = Prelude.Just SymbolInformation'Getter
    | (Prelude.==) k "Grammar" = Prelude.Just SymbolInformation'Grammar
    | (Prelude.==) k "Instance"
    = Prelude.Just SymbolInformation'Instance
    | (Prelude.==) k "Interface"
    = Prelude.Just SymbolInformation'Interface
    | (Prelude.==) k "Key" = Prelude.Just SymbolInformation'Key
    | (Prelude.==) k "Lang" = Prelude.Just SymbolInformation'Lang
    | (Prelude.==) k "Lemma" = Prelude.Just SymbolInformation'Lemma
    | (Prelude.==) k "Library" = Prelude.Just SymbolInformation'Library
    | (Prelude.==) k "Macro" = Prelude.Just SymbolInformation'Macro
    | (Prelude.==) k "Method" = Prelude.Just SymbolInformation'Method
    | (Prelude.==) k "MethodAlias"
    = Prelude.Just SymbolInformation'MethodAlias
    | (Prelude.==) k "MethodReceiver"
    = Prelude.Just SymbolInformation'MethodReceiver
    | (Prelude.==) k "MethodSpecification"
    = Prelude.Just SymbolInformation'MethodSpecification
    | (Prelude.==) k "Message" = Prelude.Just SymbolInformation'Message
    | (Prelude.==) k "Modifier"
    = Prelude.Just SymbolInformation'Modifier
    | (Prelude.==) k "Module" = Prelude.Just SymbolInformation'Module
    | (Prelude.==) k "Namespace"
    = Prelude.Just SymbolInformation'Namespace
    | (Prelude.==) k "Null" = Prelude.Just SymbolInformation'Null
    | (Prelude.==) k "Number" = Prelude.Just SymbolInformation'Number
    | (Prelude.==) k "Object" = Prelude.Just SymbolInformation'Object
    | (Prelude.==) k "Operator"
    = Prelude.Just SymbolInformation'Operator
    | (Prelude.==) k "Package" = Prelude.Just SymbolInformation'Package
    | (Prelude.==) k "PackageObject"
    = Prelude.Just SymbolInformation'PackageObject
    | (Prelude.==) k "Parameter"
    = Prelude.Just SymbolInformation'Parameter
    | (Prelude.==) k "ParameterLabel"
    = Prelude.Just SymbolInformation'ParameterLabel
    | (Prelude.==) k "Pattern" = Prelude.Just SymbolInformation'Pattern
    | (Prelude.==) k "Predicate"
    = Prelude.Just SymbolInformation'Predicate
    | (Prelude.==) k "Property"
    = Prelude.Just SymbolInformation'Property
    | (Prelude.==) k "Protocol"
    = Prelude.Just SymbolInformation'Protocol
    | (Prelude.==) k "ProtocolMethod"
    = Prelude.Just SymbolInformation'ProtocolMethod
    | (Prelude.==) k "PureVirtualMethod"
    = Prelude.Just SymbolInformation'PureVirtualMethod
    | (Prelude.==) k "Quasiquoter"
    = Prelude.Just SymbolInformation'Quasiquoter
    | (Prelude.==) k "SelfParameter"
    = Prelude.Just SymbolInformation'SelfParameter
    | (Prelude.==) k "Setter" = Prelude.Just SymbolInformation'Setter
    | (Prelude.==) k "Signature"
    = Prelude.Just SymbolInformation'Signature
    | (Prelude.==) k "SingletonClass"
    = Prelude.Just SymbolInformation'SingletonClass
    | (Prelude.==) k "SingletonMethod"
    = Prelude.Just SymbolInformation'SingletonMethod
    | (Prelude.==) k "StaticDataMember"
    = Prelude.Just SymbolInformation'StaticDataMember
    | (Prelude.==) k "StaticEvent"
    = Prelude.Just SymbolInformation'StaticEvent
    | (Prelude.==) k "StaticField"
    = Prelude.Just SymbolInformation'StaticField
    | (Prelude.==) k "StaticMethod"
    = Prelude.Just SymbolInformation'StaticMethod
    | (Prelude.==) k "StaticProperty"
    = Prelude.Just SymbolInformation'StaticProperty
    | (Prelude.==) k "StaticVariable"
    = Prelude.Just SymbolInformation'StaticVariable
    | (Prelude.==) k "String" = Prelude.Just SymbolInformation'String
    | (Prelude.==) k "Struct" = Prelude.Just SymbolInformation'Struct
    | (Prelude.==) k "Subscript"
    = Prelude.Just SymbolInformation'Subscript
    | (Prelude.==) k "Tactic" = Prelude.Just SymbolInformation'Tactic
    | (Prelude.==) k "Theorem" = Prelude.Just SymbolInformation'Theorem
    | (Prelude.==) k "ThisParameter"
    = Prelude.Just SymbolInformation'ThisParameter
    | (Prelude.==) k "Trait" = Prelude.Just SymbolInformation'Trait
    | (Prelude.==) k "TraitMethod"
    = Prelude.Just SymbolInformation'TraitMethod
    | (Prelude.==) k "Type" = Prelude.Just SymbolInformation'Type
    | (Prelude.==) k "TypeAlias"
    = Prelude.Just SymbolInformation'TypeAlias
    | (Prelude.==) k "TypeClass"
    = Prelude.Just SymbolInformation'TypeClass
    | (Prelude.==) k "TypeClassMethod"
    = Prelude.Just SymbolInformation'TypeClassMethod
    | (Prelude.==) k "TypeFamily"
    = Prelude.Just SymbolInformation'TypeFamily
    | (Prelude.==) k "TypeParameter"
    = Prelude.Just SymbolInformation'TypeParameter
    | (Prelude.==) k "Union" = Prelude.Just SymbolInformation'Union
    | (Prelude.==) k "Value" = Prelude.Just SymbolInformation'Value
    | (Prelude.==) k "Variable"
    = Prelude.Just SymbolInformation'Variable
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded SymbolInformation'Kind where
  minBound = SymbolInformation'UnspecifiedKind
  maxBound = SymbolInformation'StaticVariable
instance Prelude.Enum SymbolInformation'Kind where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum Kind: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum SymbolInformation'UnspecifiedKind = 0
  fromEnum SymbolInformation'Array = 1
  fromEnum SymbolInformation'Assertion = 2
  fromEnum SymbolInformation'AssociatedType = 3
  fromEnum SymbolInformation'Attribute = 4
  fromEnum SymbolInformation'Axiom = 5
  fromEnum SymbolInformation'Boolean = 6
  fromEnum SymbolInformation'Class = 7
  fromEnum SymbolInformation'Constant = 8
  fromEnum SymbolInformation'Constructor = 9
  fromEnum SymbolInformation'DataFamily = 10
  fromEnum SymbolInformation'Enum = 11
  fromEnum SymbolInformation'EnumMember = 12
  fromEnum SymbolInformation'Event = 13
  fromEnum SymbolInformation'Fact = 14
  fromEnum SymbolInformation'Field = 15
  fromEnum SymbolInformation'File = 16
  fromEnum SymbolInformation'Function = 17
  fromEnum SymbolInformation'Getter = 18
  fromEnum SymbolInformation'Grammar = 19
  fromEnum SymbolInformation'Instance = 20
  fromEnum SymbolInformation'Interface = 21
  fromEnum SymbolInformation'Key = 22
  fromEnum SymbolInformation'Lang = 23
  fromEnum SymbolInformation'Lemma = 24
  fromEnum SymbolInformation'Macro = 25
  fromEnum SymbolInformation'Method = 26
  fromEnum SymbolInformation'MethodReceiver = 27
  fromEnum SymbolInformation'Message = 28
  fromEnum SymbolInformation'Module = 29
  fromEnum SymbolInformation'Namespace = 30
  fromEnum SymbolInformation'Null = 31
  fromEnum SymbolInformation'Number = 32
  fromEnum SymbolInformation'Object = 33
  fromEnum SymbolInformation'Operator = 34
  fromEnum SymbolInformation'Package = 35
  fromEnum SymbolInformation'PackageObject = 36
  fromEnum SymbolInformation'Parameter = 37
  fromEnum SymbolInformation'ParameterLabel = 38
  fromEnum SymbolInformation'Pattern = 39
  fromEnum SymbolInformation'Predicate = 40
  fromEnum SymbolInformation'Property = 41
  fromEnum SymbolInformation'Protocol = 42
  fromEnum SymbolInformation'Quasiquoter = 43
  fromEnum SymbolInformation'SelfParameter = 44
  fromEnum SymbolInformation'Setter = 45
  fromEnum SymbolInformation'Signature = 46
  fromEnum SymbolInformation'Subscript = 47
  fromEnum SymbolInformation'String = 48
  fromEnum SymbolInformation'Struct = 49
  fromEnum SymbolInformation'Tactic = 50
  fromEnum SymbolInformation'Theorem = 51
  fromEnum SymbolInformation'ThisParameter = 52
  fromEnum SymbolInformation'Trait = 53
  fromEnum SymbolInformation'Type = 54
  fromEnum SymbolInformation'TypeAlias = 55
  fromEnum SymbolInformation'TypeClass = 56
  fromEnum SymbolInformation'TypeFamily = 57
  fromEnum SymbolInformation'TypeParameter = 58
  fromEnum SymbolInformation'Union = 59
  fromEnum SymbolInformation'Value = 60
  fromEnum SymbolInformation'Variable = 61
  fromEnum SymbolInformation'Contract = 62
  fromEnum SymbolInformation'Error = 63
  fromEnum SymbolInformation'Library = 64
  fromEnum SymbolInformation'Modifier = 65
  fromEnum SymbolInformation'AbstractMethod = 66
  fromEnum SymbolInformation'MethodSpecification = 67
  fromEnum SymbolInformation'ProtocolMethod = 68
  fromEnum SymbolInformation'PureVirtualMethod = 69
  fromEnum SymbolInformation'TraitMethod = 70
  fromEnum SymbolInformation'TypeClassMethod = 71
  fromEnum SymbolInformation'Accessor = 72
  fromEnum SymbolInformation'Delegate = 73
  fromEnum SymbolInformation'MethodAlias = 74
  fromEnum SymbolInformation'SingletonClass = 75
  fromEnum SymbolInformation'SingletonMethod = 76
  fromEnum SymbolInformation'StaticDataMember = 77
  fromEnum SymbolInformation'StaticEvent = 78
  fromEnum SymbolInformation'StaticField = 79
  fromEnum SymbolInformation'StaticMethod = 80
  fromEnum SymbolInformation'StaticProperty = 81
  fromEnum SymbolInformation'StaticVariable = 82
  fromEnum
    (SymbolInformation'Kind'Unrecognized (SymbolInformation'Kind'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ SymbolInformation'StaticVariable
    = Prelude.error
        "SymbolInformation'Kind.succ: bad argument SymbolInformation'StaticVariable. This value would be out of bounds."
  succ SymbolInformation'UnspecifiedKind = SymbolInformation'Array
  succ SymbolInformation'Array = SymbolInformation'Assertion
  succ SymbolInformation'Assertion = SymbolInformation'AssociatedType
  succ SymbolInformation'AssociatedType = SymbolInformation'Attribute
  succ SymbolInformation'Attribute = SymbolInformation'Axiom
  succ SymbolInformation'Axiom = SymbolInformation'Boolean
  succ SymbolInformation'Boolean = SymbolInformation'Class
  succ SymbolInformation'Class = SymbolInformation'Constant
  succ SymbolInformation'Constant = SymbolInformation'Constructor
  succ SymbolInformation'Constructor = SymbolInformation'DataFamily
  succ SymbolInformation'DataFamily = SymbolInformation'Enum
  succ SymbolInformation'Enum = SymbolInformation'EnumMember
  succ SymbolInformation'EnumMember = SymbolInformation'Event
  succ SymbolInformation'Event = SymbolInformation'Fact
  succ SymbolInformation'Fact = SymbolInformation'Field
  succ SymbolInformation'Field = SymbolInformation'File
  succ SymbolInformation'File = SymbolInformation'Function
  succ SymbolInformation'Function = SymbolInformation'Getter
  succ SymbolInformation'Getter = SymbolInformation'Grammar
  succ SymbolInformation'Grammar = SymbolInformation'Instance
  succ SymbolInformation'Instance = SymbolInformation'Interface
  succ SymbolInformation'Interface = SymbolInformation'Key
  succ SymbolInformation'Key = SymbolInformation'Lang
  succ SymbolInformation'Lang = SymbolInformation'Lemma
  succ SymbolInformation'Lemma = SymbolInformation'Macro
  succ SymbolInformation'Macro = SymbolInformation'Method
  succ SymbolInformation'Method = SymbolInformation'MethodReceiver
  succ SymbolInformation'MethodReceiver = SymbolInformation'Message
  succ SymbolInformation'Message = SymbolInformation'Module
  succ SymbolInformation'Module = SymbolInformation'Namespace
  succ SymbolInformation'Namespace = SymbolInformation'Null
  succ SymbolInformation'Null = SymbolInformation'Number
  succ SymbolInformation'Number = SymbolInformation'Object
  succ SymbolInformation'Object = SymbolInformation'Operator
  succ SymbolInformation'Operator = SymbolInformation'Package
  succ SymbolInformation'Package = SymbolInformation'PackageObject
  succ SymbolInformation'PackageObject = SymbolInformation'Parameter
  succ SymbolInformation'Parameter = SymbolInformation'ParameterLabel
  succ SymbolInformation'ParameterLabel = SymbolInformation'Pattern
  succ SymbolInformation'Pattern = SymbolInformation'Predicate
  succ SymbolInformation'Predicate = SymbolInformation'Property
  succ SymbolInformation'Property = SymbolInformation'Protocol
  succ SymbolInformation'Protocol = SymbolInformation'Quasiquoter
  succ SymbolInformation'Quasiquoter
    = SymbolInformation'SelfParameter
  succ SymbolInformation'SelfParameter = SymbolInformation'Setter
  succ SymbolInformation'Setter = SymbolInformation'Signature
  succ SymbolInformation'Signature = SymbolInformation'Subscript
  succ SymbolInformation'Subscript = SymbolInformation'String
  succ SymbolInformation'String = SymbolInformation'Struct
  succ SymbolInformation'Struct = SymbolInformation'Tactic
  succ SymbolInformation'Tactic = SymbolInformation'Theorem
  succ SymbolInformation'Theorem = SymbolInformation'ThisParameter
  succ SymbolInformation'ThisParameter = SymbolInformation'Trait
  succ SymbolInformation'Trait = SymbolInformation'Type
  succ SymbolInformation'Type = SymbolInformation'TypeAlias
  succ SymbolInformation'TypeAlias = SymbolInformation'TypeClass
  succ SymbolInformation'TypeClass = SymbolInformation'TypeFamily
  succ SymbolInformation'TypeFamily = SymbolInformation'TypeParameter
  succ SymbolInformation'TypeParameter = SymbolInformation'Union
  succ SymbolInformation'Union = SymbolInformation'Value
  succ SymbolInformation'Value = SymbolInformation'Variable
  succ SymbolInformation'Variable = SymbolInformation'Contract
  succ SymbolInformation'Contract = SymbolInformation'Error
  succ SymbolInformation'Error = SymbolInformation'Library
  succ SymbolInformation'Library = SymbolInformation'Modifier
  succ SymbolInformation'Modifier = SymbolInformation'AbstractMethod
  succ SymbolInformation'AbstractMethod
    = SymbolInformation'MethodSpecification
  succ SymbolInformation'MethodSpecification
    = SymbolInformation'ProtocolMethod
  succ SymbolInformation'ProtocolMethod
    = SymbolInformation'PureVirtualMethod
  succ SymbolInformation'PureVirtualMethod
    = SymbolInformation'TraitMethod
  succ SymbolInformation'TraitMethod
    = SymbolInformation'TypeClassMethod
  succ SymbolInformation'TypeClassMethod = SymbolInformation'Accessor
  succ SymbolInformation'Accessor = SymbolInformation'Delegate
  succ SymbolInformation'Delegate = SymbolInformation'MethodAlias
  succ SymbolInformation'MethodAlias
    = SymbolInformation'SingletonClass
  succ SymbolInformation'SingletonClass
    = SymbolInformation'SingletonMethod
  succ SymbolInformation'SingletonMethod
    = SymbolInformation'StaticDataMember
  succ SymbolInformation'StaticDataMember
    = SymbolInformation'StaticEvent
  succ SymbolInformation'StaticEvent = SymbolInformation'StaticField
  succ SymbolInformation'StaticField = SymbolInformation'StaticMethod
  succ SymbolInformation'StaticMethod
    = SymbolInformation'StaticProperty
  succ SymbolInformation'StaticProperty
    = SymbolInformation'StaticVariable
  succ (SymbolInformation'Kind'Unrecognized _)
    = Prelude.error
        "SymbolInformation'Kind.succ: bad argument: unrecognized value"
  pred SymbolInformation'UnspecifiedKind
    = Prelude.error
        "SymbolInformation'Kind.pred: bad argument SymbolInformation'UnspecifiedKind. This value would be out of bounds."
  pred SymbolInformation'Array = SymbolInformation'UnspecifiedKind
  pred SymbolInformation'Assertion = SymbolInformation'Array
  pred SymbolInformation'AssociatedType = SymbolInformation'Assertion
  pred SymbolInformation'Attribute = SymbolInformation'AssociatedType
  pred SymbolInformation'Axiom = SymbolInformation'Attribute
  pred SymbolInformation'Boolean = SymbolInformation'Axiom
  pred SymbolInformation'Class = SymbolInformation'Boolean
  pred SymbolInformation'Constant = SymbolInformation'Class
  pred SymbolInformation'Constructor = SymbolInformation'Constant
  pred SymbolInformation'DataFamily = SymbolInformation'Constructor
  pred SymbolInformation'Enum = SymbolInformation'DataFamily
  pred SymbolInformation'EnumMember = SymbolInformation'Enum
  pred SymbolInformation'Event = SymbolInformation'EnumMember
  pred SymbolInformation'Fact = SymbolInformation'Event
  pred SymbolInformation'Field = SymbolInformation'Fact
  pred SymbolInformation'File = SymbolInformation'Field
  pred SymbolInformation'Function = SymbolInformation'File
  pred SymbolInformation'Getter = SymbolInformation'Function
  pred SymbolInformation'Grammar = SymbolInformation'Getter
  pred SymbolInformation'Instance = SymbolInformation'Grammar
  pred SymbolInformation'Interface = SymbolInformation'Instance
  pred SymbolInformation'Key = SymbolInformation'Interface
  pred SymbolInformation'Lang = SymbolInformation'Key
  pred SymbolInformation'Lemma = SymbolInformation'Lang
  pred SymbolInformation'Macro = SymbolInformation'Lemma
  pred SymbolInformation'Method = SymbolInformation'Macro
  pred SymbolInformation'MethodReceiver = SymbolInformation'Method
  pred SymbolInformation'Message = SymbolInformation'MethodReceiver
  pred SymbolInformation'Module = SymbolInformation'Message
  pred SymbolInformation'Namespace = SymbolInformation'Module
  pred SymbolInformation'Null = SymbolInformation'Namespace
  pred SymbolInformation'Number = SymbolInformation'Null
  pred SymbolInformation'Object = SymbolInformation'Number
  pred SymbolInformation'Operator = SymbolInformation'Object
  pred SymbolInformation'Package = SymbolInformation'Operator
  pred SymbolInformation'PackageObject = SymbolInformation'Package
  pred SymbolInformation'Parameter = SymbolInformation'PackageObject
  pred SymbolInformation'ParameterLabel = SymbolInformation'Parameter
  pred SymbolInformation'Pattern = SymbolInformation'ParameterLabel
  pred SymbolInformation'Predicate = SymbolInformation'Pattern
  pred SymbolInformation'Property = SymbolInformation'Predicate
  pred SymbolInformation'Protocol = SymbolInformation'Property
  pred SymbolInformation'Quasiquoter = SymbolInformation'Protocol
  pred SymbolInformation'SelfParameter
    = SymbolInformation'Quasiquoter
  pred SymbolInformation'Setter = SymbolInformation'SelfParameter
  pred SymbolInformation'Signature = SymbolInformation'Setter
  pred SymbolInformation'Subscript = SymbolInformation'Signature
  pred SymbolInformation'String = SymbolInformation'Subscript
  pred SymbolInformation'Struct = SymbolInformation'String
  pred SymbolInformation'Tactic = SymbolInformation'Struct
  pred SymbolInformation'Theorem = SymbolInformation'Tactic
  pred SymbolInformation'ThisParameter = SymbolInformation'Theorem
  pred SymbolInformation'Trait = SymbolInformation'ThisParameter
  pred SymbolInformation'Type = SymbolInformation'Trait
  pred SymbolInformation'TypeAlias = SymbolInformation'Type
  pred SymbolInformation'TypeClass = SymbolInformation'TypeAlias
  pred SymbolInformation'TypeFamily = SymbolInformation'TypeClass
  pred SymbolInformation'TypeParameter = SymbolInformation'TypeFamily
  pred SymbolInformation'Union = SymbolInformation'TypeParameter
  pred SymbolInformation'Value = SymbolInformation'Union
  pred SymbolInformation'Variable = SymbolInformation'Value
  pred SymbolInformation'Contract = SymbolInformation'Variable
  pred SymbolInformation'Error = SymbolInformation'Contract
  pred SymbolInformation'Library = SymbolInformation'Error
  pred SymbolInformation'Modifier = SymbolInformation'Library
  pred SymbolInformation'AbstractMethod = SymbolInformation'Modifier
  pred SymbolInformation'MethodSpecification
    = SymbolInformation'AbstractMethod
  pred SymbolInformation'ProtocolMethod
    = SymbolInformation'MethodSpecification
  pred SymbolInformation'PureVirtualMethod
    = SymbolInformation'ProtocolMethod
  pred SymbolInformation'TraitMethod
    = SymbolInformation'PureVirtualMethod
  pred SymbolInformation'TypeClassMethod
    = SymbolInformation'TraitMethod
  pred SymbolInformation'Accessor = SymbolInformation'TypeClassMethod
  pred SymbolInformation'Delegate = SymbolInformation'Accessor
  pred SymbolInformation'MethodAlias = SymbolInformation'Delegate
  pred SymbolInformation'SingletonClass
    = SymbolInformation'MethodAlias
  pred SymbolInformation'SingletonMethod
    = SymbolInformation'SingletonClass
  pred SymbolInformation'StaticDataMember
    = SymbolInformation'SingletonMethod
  pred SymbolInformation'StaticEvent
    = SymbolInformation'StaticDataMember
  pred SymbolInformation'StaticField = SymbolInformation'StaticEvent
  pred SymbolInformation'StaticMethod = SymbolInformation'StaticField
  pred SymbolInformation'StaticProperty
    = SymbolInformation'StaticMethod
  pred SymbolInformation'StaticVariable
    = SymbolInformation'StaticProperty
  pred (SymbolInformation'Kind'Unrecognized _)
    = Prelude.error
        "SymbolInformation'Kind.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault SymbolInformation'Kind where
  fieldDefault = SymbolInformation'UnspecifiedKind
instance Control.DeepSeq.NFData SymbolInformation'Kind where
  rnf x__ = Prelude.seq x__ ()
newtype SymbolRole'UnrecognizedValue
  = SymbolRole'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data SymbolRole
  = UnspecifiedSymbolRole |
    Definition |
    Import |
    WriteAccess |
    ReadAccess |
    Generated |
    Test |
    ForwardDefinition |
    SymbolRole'Unrecognized !SymbolRole'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum SymbolRole where
  maybeToEnum 0 = Prelude.Just UnspecifiedSymbolRole
  maybeToEnum 1 = Prelude.Just Definition
  maybeToEnum 2 = Prelude.Just Import
  maybeToEnum 4 = Prelude.Just WriteAccess
  maybeToEnum 8 = Prelude.Just ReadAccess
  maybeToEnum 16 = Prelude.Just Generated
  maybeToEnum 32 = Prelude.Just Test
  maybeToEnum 64 = Prelude.Just ForwardDefinition
  maybeToEnum k
    = Prelude.Just
        (SymbolRole'Unrecognized
           (SymbolRole'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedSymbolRole = "UnspecifiedSymbolRole"
  showEnum Definition = "Definition"
  showEnum Import = "Import"
  showEnum WriteAccess = "WriteAccess"
  showEnum ReadAccess = "ReadAccess"
  showEnum Generated = "Generated"
  showEnum Test = "Test"
  showEnum ForwardDefinition = "ForwardDefinition"
  showEnum (SymbolRole'Unrecognized (SymbolRole'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedSymbolRole"
    = Prelude.Just UnspecifiedSymbolRole
    | (Prelude.==) k "Definition" = Prelude.Just Definition
    | (Prelude.==) k "Import" = Prelude.Just Import
    | (Prelude.==) k "WriteAccess" = Prelude.Just WriteAccess
    | (Prelude.==) k "ReadAccess" = Prelude.Just ReadAccess
    | (Prelude.==) k "Generated" = Prelude.Just Generated
    | (Prelude.==) k "Test" = Prelude.Just Test
    | (Prelude.==) k "ForwardDefinition"
    = Prelude.Just ForwardDefinition
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded SymbolRole where
  minBound = UnspecifiedSymbolRole
  maxBound = ForwardDefinition
instance Prelude.Enum SymbolRole where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum SymbolRole: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedSymbolRole = 0
  fromEnum Definition = 1
  fromEnum Import = 2
  fromEnum WriteAccess = 4
  fromEnum ReadAccess = 8
  fromEnum Generated = 16
  fromEnum Test = 32
  fromEnum ForwardDefinition = 64
  fromEnum (SymbolRole'Unrecognized (SymbolRole'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ ForwardDefinition
    = Prelude.error
        "SymbolRole.succ: bad argument ForwardDefinition. This value would be out of bounds."
  succ UnspecifiedSymbolRole = Definition
  succ Definition = Import
  succ Import = WriteAccess
  succ WriteAccess = ReadAccess
  succ ReadAccess = Generated
  succ Generated = Test
  succ Test = ForwardDefinition
  succ (SymbolRole'Unrecognized _)
    = Prelude.error "SymbolRole.succ: bad argument: unrecognized value"
  pred UnspecifiedSymbolRole
    = Prelude.error
        "SymbolRole.pred: bad argument UnspecifiedSymbolRole. This value would be out of bounds."
  pred Definition = UnspecifiedSymbolRole
  pred Import = Definition
  pred WriteAccess = Import
  pred ReadAccess = WriteAccess
  pred Generated = ReadAccess
  pred Test = Generated
  pred ForwardDefinition = Test
  pred (SymbolRole'Unrecognized _)
    = Prelude.error "SymbolRole.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault SymbolRole where
  fieldDefault = UnspecifiedSymbolRole
instance Control.DeepSeq.NFData SymbolRole where
  rnf x__ = Prelude.seq x__ ()
newtype SyntaxKind'UnrecognizedValue
  = SyntaxKind'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data SyntaxKind
  = UnspecifiedSyntaxKind |
    Comment |
    PunctuationDelimiter |
    PunctuationBracket |
    Keyword |
    IdentifierOperator |
    Identifier |
    IdentifierBuiltin |
    IdentifierNull |
    IdentifierConstant |
    IdentifierMutableGlobal |
    IdentifierParameter |
    IdentifierLocal |
    IdentifierShadowed |
    IdentifierNamespace |
    IdentifierFunction |
    IdentifierFunctionDefinition |
    IdentifierMacro |
    IdentifierMacroDefinition |
    IdentifierType |
    IdentifierBuiltinType |
    IdentifierAttribute |
    RegexEscape |
    RegexRepeated |
    RegexWildcard |
    RegexDelimiter |
    RegexJoin |
    StringLiteral |
    StringLiteralEscape |
    StringLiteralSpecial |
    StringLiteralKey |
    CharacterLiteral |
    NumericLiteral |
    BooleanLiteral |
    Tag |
    TagAttribute |
    TagDelimiter |
    SyntaxKind'Unrecognized !SyntaxKind'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum SyntaxKind where
  maybeToEnum 0 = Prelude.Just UnspecifiedSyntaxKind
  maybeToEnum 1 = Prelude.Just Comment
  maybeToEnum 2 = Prelude.Just PunctuationDelimiter
  maybeToEnum 3 = Prelude.Just PunctuationBracket
  maybeToEnum 4 = Prelude.Just Keyword
  maybeToEnum 5 = Prelude.Just IdentifierOperator
  maybeToEnum 6 = Prelude.Just Identifier
  maybeToEnum 7 = Prelude.Just IdentifierBuiltin
  maybeToEnum 8 = Prelude.Just IdentifierNull
  maybeToEnum 9 = Prelude.Just IdentifierConstant
  maybeToEnum 10 = Prelude.Just IdentifierMutableGlobal
  maybeToEnum 11 = Prelude.Just IdentifierParameter
  maybeToEnum 12 = Prelude.Just IdentifierLocal
  maybeToEnum 13 = Prelude.Just IdentifierShadowed
  maybeToEnum 14 = Prelude.Just IdentifierNamespace
  maybeToEnum 15 = Prelude.Just IdentifierFunction
  maybeToEnum 16 = Prelude.Just IdentifierFunctionDefinition
  maybeToEnum 17 = Prelude.Just IdentifierMacro
  maybeToEnum 18 = Prelude.Just IdentifierMacroDefinition
  maybeToEnum 19 = Prelude.Just IdentifierType
  maybeToEnum 20 = Prelude.Just IdentifierBuiltinType
  maybeToEnum 21 = Prelude.Just IdentifierAttribute
  maybeToEnum 22 = Prelude.Just RegexEscape
  maybeToEnum 23 = Prelude.Just RegexRepeated
  maybeToEnum 24 = Prelude.Just RegexWildcard
  maybeToEnum 25 = Prelude.Just RegexDelimiter
  maybeToEnum 26 = Prelude.Just RegexJoin
  maybeToEnum 27 = Prelude.Just StringLiteral
  maybeToEnum 28 = Prelude.Just StringLiteralEscape
  maybeToEnum 29 = Prelude.Just StringLiteralSpecial
  maybeToEnum 30 = Prelude.Just StringLiteralKey
  maybeToEnum 31 = Prelude.Just CharacterLiteral
  maybeToEnum 32 = Prelude.Just NumericLiteral
  maybeToEnum 33 = Prelude.Just BooleanLiteral
  maybeToEnum 34 = Prelude.Just Tag
  maybeToEnum 35 = Prelude.Just TagAttribute
  maybeToEnum 36 = Prelude.Just TagDelimiter
  maybeToEnum k
    = Prelude.Just
        (SyntaxKind'Unrecognized
           (SyntaxKind'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedSyntaxKind = "UnspecifiedSyntaxKind"
  showEnum Comment = "Comment"
  showEnum PunctuationDelimiter = "PunctuationDelimiter"
  showEnum PunctuationBracket = "PunctuationBracket"
  showEnum Keyword = "Keyword"
  showEnum IdentifierOperator = "IdentifierOperator"
  showEnum Identifier = "Identifier"
  showEnum IdentifierBuiltin = "IdentifierBuiltin"
  showEnum IdentifierNull = "IdentifierNull"
  showEnum IdentifierConstant = "IdentifierConstant"
  showEnum IdentifierMutableGlobal = "IdentifierMutableGlobal"
  showEnum IdentifierParameter = "IdentifierParameter"
  showEnum IdentifierLocal = "IdentifierLocal"
  showEnum IdentifierShadowed = "IdentifierShadowed"
  showEnum IdentifierNamespace = "IdentifierNamespace"
  showEnum IdentifierFunction = "IdentifierFunction"
  showEnum IdentifierFunctionDefinition
    = "IdentifierFunctionDefinition"
  showEnum IdentifierMacro = "IdentifierMacro"
  showEnum IdentifierMacroDefinition = "IdentifierMacroDefinition"
  showEnum IdentifierType = "IdentifierType"
  showEnum IdentifierBuiltinType = "IdentifierBuiltinType"
  showEnum IdentifierAttribute = "IdentifierAttribute"
  showEnum RegexEscape = "RegexEscape"
  showEnum RegexRepeated = "RegexRepeated"
  showEnum RegexWildcard = "RegexWildcard"
  showEnum RegexDelimiter = "RegexDelimiter"
  showEnum RegexJoin = "RegexJoin"
  showEnum StringLiteral = "StringLiteral"
  showEnum StringLiteralEscape = "StringLiteralEscape"
  showEnum StringLiteralSpecial = "StringLiteralSpecial"
  showEnum StringLiteralKey = "StringLiteralKey"
  showEnum CharacterLiteral = "CharacterLiteral"
  showEnum NumericLiteral = "NumericLiteral"
  showEnum BooleanLiteral = "BooleanLiteral"
  showEnum Tag = "Tag"
  showEnum TagAttribute = "TagAttribute"
  showEnum TagDelimiter = "TagDelimiter"
  showEnum (SyntaxKind'Unrecognized (SyntaxKind'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedSyntaxKind"
    = Prelude.Just UnspecifiedSyntaxKind
    | (Prelude.==) k "Comment" = Prelude.Just Comment
    | (Prelude.==) k "PunctuationDelimiter"
    = Prelude.Just PunctuationDelimiter
    | (Prelude.==) k "PunctuationBracket"
    = Prelude.Just PunctuationBracket
    | (Prelude.==) k "Keyword" = Prelude.Just Keyword
    | (Prelude.==) k "IdentifierKeyword"
    = Prelude.Just IdentifierKeyword
    | (Prelude.==) k "IdentifierOperator"
    = Prelude.Just IdentifierOperator
    | (Prelude.==) k "Identifier" = Prelude.Just Identifier
    | (Prelude.==) k "IdentifierBuiltin"
    = Prelude.Just IdentifierBuiltin
    | (Prelude.==) k "IdentifierNull" = Prelude.Just IdentifierNull
    | (Prelude.==) k "IdentifierConstant"
    = Prelude.Just IdentifierConstant
    | (Prelude.==) k "IdentifierMutableGlobal"
    = Prelude.Just IdentifierMutableGlobal
    | (Prelude.==) k "IdentifierParameter"
    = Prelude.Just IdentifierParameter
    | (Prelude.==) k "IdentifierLocal" = Prelude.Just IdentifierLocal
    | (Prelude.==) k "IdentifierShadowed"
    = Prelude.Just IdentifierShadowed
    | (Prelude.==) k "IdentifierNamespace"
    = Prelude.Just IdentifierNamespace
    | (Prelude.==) k "IdentifierModule" = Prelude.Just IdentifierModule
    | (Prelude.==) k "IdentifierFunction"
    = Prelude.Just IdentifierFunction
    | (Prelude.==) k "IdentifierFunctionDefinition"
    = Prelude.Just IdentifierFunctionDefinition
    | (Prelude.==) k "IdentifierMacro" = Prelude.Just IdentifierMacro
    | (Prelude.==) k "IdentifierMacroDefinition"
    = Prelude.Just IdentifierMacroDefinition
    | (Prelude.==) k "IdentifierType" = Prelude.Just IdentifierType
    | (Prelude.==) k "IdentifierBuiltinType"
    = Prelude.Just IdentifierBuiltinType
    | (Prelude.==) k "IdentifierAttribute"
    = Prelude.Just IdentifierAttribute
    | (Prelude.==) k "RegexEscape" = Prelude.Just RegexEscape
    | (Prelude.==) k "RegexRepeated" = Prelude.Just RegexRepeated
    | (Prelude.==) k "RegexWildcard" = Prelude.Just RegexWildcard
    | (Prelude.==) k "RegexDelimiter" = Prelude.Just RegexDelimiter
    | (Prelude.==) k "RegexJoin" = Prelude.Just RegexJoin
    | (Prelude.==) k "StringLiteral" = Prelude.Just StringLiteral
    | (Prelude.==) k "StringLiteralEscape"
    = Prelude.Just StringLiteralEscape
    | (Prelude.==) k "StringLiteralSpecial"
    = Prelude.Just StringLiteralSpecial
    | (Prelude.==) k "StringLiteralKey" = Prelude.Just StringLiteralKey
    | (Prelude.==) k "CharacterLiteral" = Prelude.Just CharacterLiteral
    | (Prelude.==) k "NumericLiteral" = Prelude.Just NumericLiteral
    | (Prelude.==) k "BooleanLiteral" = Prelude.Just BooleanLiteral
    | (Prelude.==) k "Tag" = Prelude.Just Tag
    | (Prelude.==) k "TagAttribute" = Prelude.Just TagAttribute
    | (Prelude.==) k "TagDelimiter" = Prelude.Just TagDelimiter
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded SyntaxKind where
  minBound = UnspecifiedSyntaxKind
  maxBound = TagDelimiter
instance Prelude.Enum SyntaxKind where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum SyntaxKind: " (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedSyntaxKind = 0
  fromEnum Comment = 1
  fromEnum PunctuationDelimiter = 2
  fromEnum PunctuationBracket = 3
  fromEnum Keyword = 4
  fromEnum IdentifierOperator = 5
  fromEnum Identifier = 6
  fromEnum IdentifierBuiltin = 7
  fromEnum IdentifierNull = 8
  fromEnum IdentifierConstant = 9
  fromEnum IdentifierMutableGlobal = 10
  fromEnum IdentifierParameter = 11
  fromEnum IdentifierLocal = 12
  fromEnum IdentifierShadowed = 13
  fromEnum IdentifierNamespace = 14
  fromEnum IdentifierFunction = 15
  fromEnum IdentifierFunctionDefinition = 16
  fromEnum IdentifierMacro = 17
  fromEnum IdentifierMacroDefinition = 18
  fromEnum IdentifierType = 19
  fromEnum IdentifierBuiltinType = 20
  fromEnum IdentifierAttribute = 21
  fromEnum RegexEscape = 22
  fromEnum RegexRepeated = 23
  fromEnum RegexWildcard = 24
  fromEnum RegexDelimiter = 25
  fromEnum RegexJoin = 26
  fromEnum StringLiteral = 27
  fromEnum StringLiteralEscape = 28
  fromEnum StringLiteralSpecial = 29
  fromEnum StringLiteralKey = 30
  fromEnum CharacterLiteral = 31
  fromEnum NumericLiteral = 32
  fromEnum BooleanLiteral = 33
  fromEnum Tag = 34
  fromEnum TagAttribute = 35
  fromEnum TagDelimiter = 36
  fromEnum (SyntaxKind'Unrecognized (SyntaxKind'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ TagDelimiter
    = Prelude.error
        "SyntaxKind.succ: bad argument TagDelimiter. This value would be out of bounds."
  succ UnspecifiedSyntaxKind = Comment
  succ Comment = PunctuationDelimiter
  succ PunctuationDelimiter = PunctuationBracket
  succ PunctuationBracket = Keyword
  succ Keyword = IdentifierOperator
  succ IdentifierOperator = Identifier
  succ Identifier = IdentifierBuiltin
  succ IdentifierBuiltin = IdentifierNull
  succ IdentifierNull = IdentifierConstant
  succ IdentifierConstant = IdentifierMutableGlobal
  succ IdentifierMutableGlobal = IdentifierParameter
  succ IdentifierParameter = IdentifierLocal
  succ IdentifierLocal = IdentifierShadowed
  succ IdentifierShadowed = IdentifierNamespace
  succ IdentifierNamespace = IdentifierFunction
  succ IdentifierFunction = IdentifierFunctionDefinition
  succ IdentifierFunctionDefinition = IdentifierMacro
  succ IdentifierMacro = IdentifierMacroDefinition
  succ IdentifierMacroDefinition = IdentifierType
  succ IdentifierType = IdentifierBuiltinType
  succ IdentifierBuiltinType = IdentifierAttribute
  succ IdentifierAttribute = RegexEscape
  succ RegexEscape = RegexRepeated
  succ RegexRepeated = RegexWildcard
  succ RegexWildcard = RegexDelimiter
  succ RegexDelimiter = RegexJoin
  succ RegexJoin = StringLiteral
  succ StringLiteral = StringLiteralEscape
  succ StringLiteralEscape = StringLiteralSpecial
  succ StringLiteralSpecial = StringLiteralKey
  succ StringLiteralKey = CharacterLiteral
  succ CharacterLiteral = NumericLiteral
  succ NumericLiteral = BooleanLiteral
  succ BooleanLiteral = Tag
  succ Tag = TagAttribute
  succ TagAttribute = TagDelimiter
  succ (SyntaxKind'Unrecognized _)
    = Prelude.error "SyntaxKind.succ: bad argument: unrecognized value"
  pred UnspecifiedSyntaxKind
    = Prelude.error
        "SyntaxKind.pred: bad argument UnspecifiedSyntaxKind. This value would be out of bounds."
  pred Comment = UnspecifiedSyntaxKind
  pred PunctuationDelimiter = Comment
  pred PunctuationBracket = PunctuationDelimiter
  pred Keyword = PunctuationBracket
  pred IdentifierOperator = Keyword
  pred Identifier = IdentifierOperator
  pred IdentifierBuiltin = Identifier
  pred IdentifierNull = IdentifierBuiltin
  pred IdentifierConstant = IdentifierNull
  pred IdentifierMutableGlobal = IdentifierConstant
  pred IdentifierParameter = IdentifierMutableGlobal
  pred IdentifierLocal = IdentifierParameter
  pred IdentifierShadowed = IdentifierLocal
  pred IdentifierNamespace = IdentifierShadowed
  pred IdentifierFunction = IdentifierNamespace
  pred IdentifierFunctionDefinition = IdentifierFunction
  pred IdentifierMacro = IdentifierFunctionDefinition
  pred IdentifierMacroDefinition = IdentifierMacro
  pred IdentifierType = IdentifierMacroDefinition
  pred IdentifierBuiltinType = IdentifierType
  pred IdentifierAttribute = IdentifierBuiltinType
  pred RegexEscape = IdentifierAttribute
  pred RegexRepeated = RegexEscape
  pred RegexWildcard = RegexRepeated
  pred RegexDelimiter = RegexWildcard
  pred RegexJoin = RegexDelimiter
  pred StringLiteral = RegexJoin
  pred StringLiteralEscape = StringLiteral
  pred StringLiteralSpecial = StringLiteralEscape
  pred StringLiteralKey = StringLiteralSpecial
  pred CharacterLiteral = StringLiteralKey
  pred NumericLiteral = CharacterLiteral
  pred BooleanLiteral = NumericLiteral
  pred Tag = BooleanLiteral
  pred TagAttribute = Tag
  pred TagDelimiter = TagAttribute
  pred (SyntaxKind'Unrecognized _)
    = Prelude.error "SyntaxKind.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault SyntaxKind where
  fieldDefault = UnspecifiedSyntaxKind
instance Control.DeepSeq.NFData SyntaxKind where
  rnf x__ = Prelude.seq x__ ()
pattern IdentifierKeyword :: SyntaxKind
pattern IdentifierKeyword = Keyword
pattern IdentifierModule :: SyntaxKind
pattern IdentifierModule = IdentifierNamespace
newtype TextEncoding'UnrecognizedValue
  = TextEncoding'UnrecognizedValue Data.Int.Int32
  deriving stock (Prelude.Eq, Prelude.Ord, Prelude.Show)
data TextEncoding
  = UnspecifiedTextEncoding |
    UTF8 |
    UTF16 |
    TextEncoding'Unrecognized !TextEncoding'UnrecognizedValue
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.MessageEnum TextEncoding where
  maybeToEnum 0 = Prelude.Just UnspecifiedTextEncoding
  maybeToEnum 1 = Prelude.Just UTF8
  maybeToEnum 2 = Prelude.Just UTF16
  maybeToEnum k
    = Prelude.Just
        (TextEncoding'Unrecognized
           (TextEncoding'UnrecognizedValue (Prelude.fromIntegral k)))
  showEnum UnspecifiedTextEncoding = "UnspecifiedTextEncoding"
  showEnum UTF8 = "UTF8"
  showEnum UTF16 = "UTF16"
  showEnum
    (TextEncoding'Unrecognized (TextEncoding'UnrecognizedValue k))
    = Prelude.show k
  readEnum k
    | (Prelude.==) k "UnspecifiedTextEncoding"
    = Prelude.Just UnspecifiedTextEncoding
    | (Prelude.==) k "UTF8" = Prelude.Just UTF8
    | (Prelude.==) k "UTF16" = Prelude.Just UTF16
    | Prelude.otherwise
    = (Prelude.>>=) (Text.Read.readMaybe k) Data.ProtoLens.maybeToEnum
instance Prelude.Bounded TextEncoding where
  minBound = UnspecifiedTextEncoding
  maxBound = UTF16
instance Prelude.Enum TextEncoding where
  toEnum k__
    = Prelude.maybe
        (Prelude.error
           ((Prelude.++)
              "toEnum: unknown value for enum TextEncoding: "
              (Prelude.show k__)))
        Prelude.id (Data.ProtoLens.maybeToEnum k__)
  fromEnum UnspecifiedTextEncoding = 0
  fromEnum UTF8 = 1
  fromEnum UTF16 = 2
  fromEnum
    (TextEncoding'Unrecognized (TextEncoding'UnrecognizedValue k))
    = Prelude.fromIntegral k
  succ UTF16
    = Prelude.error
        "TextEncoding.succ: bad argument UTF16. This value would be out of bounds."
  succ UnspecifiedTextEncoding = UTF8
  succ UTF8 = UTF16
  succ (TextEncoding'Unrecognized _)
    = Prelude.error
        "TextEncoding.succ: bad argument: unrecognized value"
  pred UnspecifiedTextEncoding
    = Prelude.error
        "TextEncoding.pred: bad argument UnspecifiedTextEncoding. This value would be out of bounds."
  pred UTF8 = UnspecifiedTextEncoding
  pred UTF16 = UTF8
  pred (TextEncoding'Unrecognized _)
    = Prelude.error
        "TextEncoding.pred: bad argument: unrecognized value"
  enumFrom = Data.ProtoLens.Message.Enum.messageEnumFrom
  enumFromTo = Data.ProtoLens.Message.Enum.messageEnumFromTo
  enumFromThen = Data.ProtoLens.Message.Enum.messageEnumFromThen
  enumFromThenTo = Data.ProtoLens.Message.Enum.messageEnumFromThenTo
instance Data.ProtoLens.FieldDefault TextEncoding where
  fieldDefault = UnspecifiedTextEncoding
instance Control.DeepSeq.NFData TextEncoding where
  rnf x__ = Prelude.seq x__ ()
{- | Fields :
     
         * 'Proto.Scip_Fields.symbol' @:: Lens' ThisType Data.Text.Text@ -}
data ThisType
  = ThisType'_constructor {_ThisType'symbol :: !Data.Text.Text,
                           _ThisType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ThisType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ThisType "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ThisType'symbol (\ x__ y__ -> x__ {_ThisType'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Message ThisType where
  messageName _ = Data.Text.pack "scip.ThisType"
  packedMessageDescriptor _
    = "\n\
      \\bThisType\DC2\SYN\n\
      \\ACKsymbol\CAN\SOH \SOH(\tR\ACKsymbol"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor ThisType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, symbol__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ThisType'_unknownFields
        (\ x__ y__ -> x__ {_ThisType'_unknownFields = y__})
  defMessage
    = ThisType'_constructor
        {_ThisType'symbol = Data.ProtoLens.fieldDefault,
         _ThisType'_unknownFields = []}
  parseMessage
    = let
        loop :: ThisType -> Data.ProtoLens.Encoding.Bytes.Parser ThisType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ThisType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let
                _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ThisType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ThisType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ThisType'symbol x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.name' @:: Lens' ToolInfo Data.Text.Text@
         * 'Proto.Scip_Fields.version' @:: Lens' ToolInfo Data.Text.Text@
         * 'Proto.Scip_Fields.arguments' @:: Lens' ToolInfo [Data.Text.Text]@
         * 'Proto.Scip_Fields.vec'arguments' @:: Lens' ToolInfo (Data.Vector.Vector Data.Text.Text)@ -}
data ToolInfo
  = ToolInfo'_constructor {_ToolInfo'name :: !Data.Text.Text,
                           _ToolInfo'version :: !Data.Text.Text,
                           _ToolInfo'arguments :: !(Data.Vector.Vector Data.Text.Text),
                           _ToolInfo'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ToolInfo where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ToolInfo "name" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ToolInfo'name (\ x__ y__ -> x__ {_ToolInfo'name = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ToolInfo "version" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ToolInfo'version (\ x__ y__ -> x__ {_ToolInfo'version = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField ToolInfo "arguments" [Data.Text.Text] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ToolInfo'arguments (\ x__ y__ -> x__ {_ToolInfo'arguments = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField ToolInfo "vec'arguments" (Data.Vector.Vector Data.Text.Text) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ToolInfo'arguments (\ x__ y__ -> x__ {_ToolInfo'arguments = y__}))
        Prelude.id
instance Data.ProtoLens.Message ToolInfo where
  messageName _ = Data.Text.pack "scip.ToolInfo"
  packedMessageDescriptor _
    = "\n\
      \\bToolInfo\DC2\DC2\n\
      \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\CAN\n\
      \\aversion\CAN\STX \SOH(\tR\aversion\DC2\FS\n\
      \\targuments\CAN\ETX \ETX(\tR\targuments"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        name__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "name"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"name")) ::
              Data.ProtoLens.FieldDescriptor ToolInfo
        version__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "version"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"version")) ::
              Data.ProtoLens.FieldDescriptor ToolInfo
        arguments__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "arguments"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"arguments")) ::
              Data.ProtoLens.FieldDescriptor ToolInfo
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, name__field_descriptor),
           (Data.ProtoLens.Tag 2, version__field_descriptor),
           (Data.ProtoLens.Tag 3, arguments__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ToolInfo'_unknownFields
        (\ x__ y__ -> x__ {_ToolInfo'_unknownFields = y__})
  defMessage
    = ToolInfo'_constructor
        {_ToolInfo'name = Data.ProtoLens.fieldDefault,
         _ToolInfo'version = Data.ProtoLens.fieldDefault,
         _ToolInfo'arguments = Data.Vector.Generic.empty,
         _ToolInfo'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ToolInfo
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Data.Text.Text
             -> Data.ProtoLens.Encoding.Bytes.Parser ToolInfo
        loop x mutable'arguments
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'arguments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                            (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                               mutable'arguments)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'arguments") frozen'arguments x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "name"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"name") y x)
                                  mutable'arguments
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "version"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"version") y x)
                                  mutable'arguments
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                        Data.ProtoLens.Encoding.Bytes.getBytes
                                                          (Prelude.fromIntegral len)
                                            Data.ProtoLens.Encoding.Bytes.runEither
                                              (case Data.Text.Encoding.decodeUtf8' value of
                                                 (Prelude.Left err)
                                                   -> Prelude.Left (Prelude.show err)
                                                 (Prelude.Right r) -> Prelude.Right r))
                                        "arguments"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'arguments y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'arguments
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'arguments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                     Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'arguments)
          "ToolInfo"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (let _v = Lens.Family2.view (Data.ProtoLens.Field.field @"name") _x
              in
                if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                    Data.Monoid.mempty
                else
                    (Data.Monoid.<>)
                      (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                      ((Prelude..)
                         (\ bs
                            -> (Data.Monoid.<>)
                                 (Data.ProtoLens.Encoding.Bytes.putVarInt
                                    (Prelude.fromIntegral (Data.ByteString.length bs)))
                                 (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                         Data.Text.Encoding.encodeUtf8 _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"version") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.Text.Encoding.encodeUtf8 _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'arguments") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData ToolInfo where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ToolInfo'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_ToolInfo'name x__)
                (Control.DeepSeq.deepseq
                   (_ToolInfo'version x__)
                   (Control.DeepSeq.deepseq (_ToolInfo'arguments x__) ())))
{- | Fields :
     
         * 'Proto.Scip_Fields.maybe'sealedValue' @:: Lens' Type (Prelude.Maybe Type'SealedValue)@
         * 'Proto.Scip_Fields.maybe'typeRef' @:: Lens' Type (Prelude.Maybe TypeRef)@
         * 'Proto.Scip_Fields.typeRef' @:: Lens' Type TypeRef@
         * 'Proto.Scip_Fields.maybe'singleType' @:: Lens' Type (Prelude.Maybe SingleType)@
         * 'Proto.Scip_Fields.singleType' @:: Lens' Type SingleType@
         * 'Proto.Scip_Fields.maybe'thisType' @:: Lens' Type (Prelude.Maybe ThisType)@
         * 'Proto.Scip_Fields.thisType' @:: Lens' Type ThisType@
         * 'Proto.Scip_Fields.maybe'superType' @:: Lens' Type (Prelude.Maybe SuperType)@
         * 'Proto.Scip_Fields.superType' @:: Lens' Type SuperType@
         * 'Proto.Scip_Fields.maybe'constantType' @:: Lens' Type (Prelude.Maybe ConstantType)@
         * 'Proto.Scip_Fields.constantType' @:: Lens' Type ConstantType@
         * 'Proto.Scip_Fields.maybe'intersectionType' @:: Lens' Type (Prelude.Maybe IntersectionType)@
         * 'Proto.Scip_Fields.intersectionType' @:: Lens' Type IntersectionType@
         * 'Proto.Scip_Fields.maybe'unionType' @:: Lens' Type (Prelude.Maybe UnionType)@
         * 'Proto.Scip_Fields.unionType' @:: Lens' Type UnionType@
         * 'Proto.Scip_Fields.maybe'withType' @:: Lens' Type (Prelude.Maybe WithType)@
         * 'Proto.Scip_Fields.withType' @:: Lens' Type WithType@
         * 'Proto.Scip_Fields.maybe'structuralType' @:: Lens' Type (Prelude.Maybe StructuralType)@
         * 'Proto.Scip_Fields.structuralType' @:: Lens' Type StructuralType@
         * 'Proto.Scip_Fields.maybe'annotatedType' @:: Lens' Type (Prelude.Maybe AnnotatedType)@
         * 'Proto.Scip_Fields.annotatedType' @:: Lens' Type AnnotatedType@
         * 'Proto.Scip_Fields.maybe'existentialType' @:: Lens' Type (Prelude.Maybe ExistentialType)@
         * 'Proto.Scip_Fields.existentialType' @:: Lens' Type ExistentialType@
         * 'Proto.Scip_Fields.maybe'universalType' @:: Lens' Type (Prelude.Maybe UniversalType)@
         * 'Proto.Scip_Fields.universalType' @:: Lens' Type UniversalType@
         * 'Proto.Scip_Fields.maybe'byNameType' @:: Lens' Type (Prelude.Maybe ByNameType)@
         * 'Proto.Scip_Fields.byNameType' @:: Lens' Type ByNameType@
         * 'Proto.Scip_Fields.maybe'repeatedType' @:: Lens' Type (Prelude.Maybe RepeatedType)@
         * 'Proto.Scip_Fields.repeatedType' @:: Lens' Type RepeatedType@
         * 'Proto.Scip_Fields.maybe'matchType' @:: Lens' Type (Prelude.Maybe MatchType)@
         * 'Proto.Scip_Fields.matchType' @:: Lens' Type MatchType@
         * 'Proto.Scip_Fields.maybe'lambdaType' @:: Lens' Type (Prelude.Maybe LambdaType)@
         * 'Proto.Scip_Fields.lambdaType' @:: Lens' Type LambdaType@ -}
data Type
  = Type'_constructor {_Type'sealedValue :: !(Prelude.Maybe Type'SealedValue),
                       _Type'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show Type where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
data Type'SealedValue
  = Type'TypeRef !TypeRef |
    Type'SingleType !SingleType |
    Type'ThisType !ThisType |
    Type'SuperType !SuperType |
    Type'ConstantType !ConstantType |
    Type'IntersectionType !IntersectionType |
    Type'UnionType !UnionType |
    Type'WithType !WithType |
    Type'StructuralType !StructuralType |
    Type'AnnotatedType !AnnotatedType |
    Type'ExistentialType !ExistentialType |
    Type'UniversalType !UniversalType |
    Type'ByNameType !ByNameType |
    Type'RepeatedType !RepeatedType |
    Type'MatchType !MatchType |
    Type'LambdaType !LambdaType
  deriving stock (Prelude.Show, Prelude.Eq, Prelude.Ord)
instance Data.ProtoLens.Field.HasField Type "maybe'sealedValue" (Prelude.Maybe Type'SealedValue) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField Type "maybe'typeRef" (Prelude.Maybe TypeRef) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'TypeRef x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'TypeRef y__))
instance Data.ProtoLens.Field.HasField Type "typeRef" TypeRef where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'TypeRef x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'TypeRef y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'singleType" (Prelude.Maybe SingleType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'SingleType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'SingleType y__))
instance Data.ProtoLens.Field.HasField Type "singleType" SingleType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'SingleType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'SingleType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'thisType" (Prelude.Maybe ThisType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'ThisType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'ThisType y__))
instance Data.ProtoLens.Field.HasField Type "thisType" ThisType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'ThisType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'ThisType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'superType" (Prelude.Maybe SuperType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'SuperType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'SuperType y__))
instance Data.ProtoLens.Field.HasField Type "superType" SuperType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'SuperType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'SuperType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'constantType" (Prelude.Maybe ConstantType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'ConstantType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'ConstantType y__))
instance Data.ProtoLens.Field.HasField Type "constantType" ConstantType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'ConstantType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'ConstantType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'intersectionType" (Prelude.Maybe IntersectionType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'IntersectionType x__val))
                     -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'IntersectionType y__))
instance Data.ProtoLens.Field.HasField Type "intersectionType" IntersectionType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'IntersectionType x__val))
                        -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'IntersectionType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'unionType" (Prelude.Maybe UnionType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'UnionType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'UnionType y__))
instance Data.ProtoLens.Field.HasField Type "unionType" UnionType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'UnionType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'UnionType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'withType" (Prelude.Maybe WithType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'WithType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'WithType y__))
instance Data.ProtoLens.Field.HasField Type "withType" WithType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'WithType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'WithType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'structuralType" (Prelude.Maybe StructuralType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'StructuralType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'StructuralType y__))
instance Data.ProtoLens.Field.HasField Type "structuralType" StructuralType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'StructuralType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'StructuralType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'annotatedType" (Prelude.Maybe AnnotatedType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'AnnotatedType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'AnnotatedType y__))
instance Data.ProtoLens.Field.HasField Type "annotatedType" AnnotatedType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'AnnotatedType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'AnnotatedType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'existentialType" (Prelude.Maybe ExistentialType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'ExistentialType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'ExistentialType y__))
instance Data.ProtoLens.Field.HasField Type "existentialType" ExistentialType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'ExistentialType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'ExistentialType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'universalType" (Prelude.Maybe UniversalType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'UniversalType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'UniversalType y__))
instance Data.ProtoLens.Field.HasField Type "universalType" UniversalType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'UniversalType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'UniversalType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'byNameType" (Prelude.Maybe ByNameType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'ByNameType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'ByNameType y__))
instance Data.ProtoLens.Field.HasField Type "byNameType" ByNameType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'ByNameType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'ByNameType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'repeatedType" (Prelude.Maybe RepeatedType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'RepeatedType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'RepeatedType y__))
instance Data.ProtoLens.Field.HasField Type "repeatedType" RepeatedType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'RepeatedType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'RepeatedType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'matchType" (Prelude.Maybe MatchType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'MatchType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'MatchType y__))
instance Data.ProtoLens.Field.HasField Type "matchType" MatchType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'MatchType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'MatchType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Field.HasField Type "maybe'lambdaType" (Prelude.Maybe LambdaType) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        (Lens.Family2.Unchecked.lens
           (\ x__
              -> case x__ of
                   (Prelude.Just (Type'LambdaType x__val)) -> Prelude.Just x__val
                   _otherwise -> Prelude.Nothing)
           (\ _ y__ -> Prelude.fmap Type'LambdaType y__))
instance Data.ProtoLens.Field.HasField Type "lambdaType" LambdaType where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _Type'sealedValue (\ x__ y__ -> x__ {_Type'sealedValue = y__}))
        ((Prelude..)
           (Lens.Family2.Unchecked.lens
              (\ x__
                 -> case x__ of
                      (Prelude.Just (Type'LambdaType x__val)) -> Prelude.Just x__val
                      _otherwise -> Prelude.Nothing)
              (\ _ y__ -> Prelude.fmap Type'LambdaType y__))
           (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage))
instance Data.ProtoLens.Message Type where
  messageName _ = Data.Text.pack "scip.Type"
  packedMessageDescriptor _
    = "\n\
      \\EOTType\DC2*\n\
      \\btype_ref\CAN\STX \SOH(\v2\r.scip.TypeRefH\NULR\atypeRef\DC23\n\
      \\vsingle_type\CAN\DC4 \SOH(\v2\DLE.scip.SingleTypeH\NULR\n\
      \singleType\DC2-\n\
      \\tthis_type\CAN\NAK \SOH(\v2\SO.scip.ThisTypeH\NULR\bthisType\DC20\n\
      \\n\
      \super_type\CAN\SYN \SOH(\v2\SI.scip.SuperTypeH\NULR\tsuperType\DC29\n\
      \\rconstant_type\CAN\ETB \SOH(\v2\DC2.scip.ConstantTypeH\NULR\fconstantType\DC2E\n\
      \\DC1intersection_type\CAN\DC1 \SOH(\v2\SYN.scip.IntersectionTypeH\NULR\DLEintersectionType\DC20\n\
      \\n\
      \union_type\CAN\DC2 \SOH(\v2\SI.scip.UnionTypeH\NULR\tunionType\DC2-\n\
      \\twith_type\CAN\DC3 \SOH(\v2\SO.scip.WithTypeH\NULR\bwithType\DC2?\n\
      \\SIstructural_type\CAN\a \SOH(\v2\DC4.scip.StructuralTypeH\NULR\SOstructuralType\DC2<\n\
      \\SOannotated_type\CAN\b \SOH(\v2\DC3.scip.AnnotatedTypeH\NULR\rannotatedType\DC2B\n\
      \\DLEexistential_type\CAN\t \SOH(\v2\NAK.scip.ExistentialTypeH\NULR\SIexistentialType\DC2<\n\
      \\SOuniversal_type\CAN\n\
      \ \SOH(\v2\DC3.scip.UniversalTypeH\NULR\runiversalType\DC24\n\
      \\fby_name_type\CAN\r \SOH(\v2\DLE.scip.ByNameTypeH\NULR\n\
      \byNameType\DC29\n\
      \\rrepeated_type\CAN\SO \SOH(\v2\DC2.scip.RepeatedTypeH\NULR\frepeatedType\DC20\n\
      \\n\
      \match_type\CAN\EM \SOH(\v2\SI.scip.MatchTypeH\NULR\tmatchType\DC23\n\
      \\vlambda_type\CAN\SUB \SOH(\v2\DLE.scip.LambdaTypeH\NULR\n\
      \lambdaTypeB\SO\n\
      \\fsealed_valueJ\EOT\b\SOH\DLE\STXJ\EOT\b\ETX\DLE\EOTJ\EOT\b\EOT\DLE\ENQJ\EOT\b\ENQ\DLE\ACKJ\EOT\b\ACK\DLE\aJ\EOT\b\v\DLE\fJ\EOT\b\f\DLE\rJ\EOT\b\SI\DLE\DLEJ\EOT\b\DLE\DLE\DC1"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        typeRef__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_ref"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor TypeRef)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeRef")) ::
              Data.ProtoLens.FieldDescriptor Type
        singleType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "single_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SingleType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'singleType")) ::
              Data.ProtoLens.FieldDescriptor Type
        thisType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "this_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ThisType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'thisType")) ::
              Data.ProtoLens.FieldDescriptor Type
        superType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "super_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor SuperType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'superType")) ::
              Data.ProtoLens.FieldDescriptor Type
        constantType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "constant_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ConstantType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'constantType")) ::
              Data.ProtoLens.FieldDescriptor Type
        intersectionType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "intersection_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor IntersectionType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'intersectionType")) ::
              Data.ProtoLens.FieldDescriptor Type
        unionType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "union_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UnionType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'unionType")) ::
              Data.ProtoLens.FieldDescriptor Type
        withType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "with_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor WithType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'withType")) ::
              Data.ProtoLens.FieldDescriptor Type
        structuralType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "structural_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor StructuralType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'structuralType")) ::
              Data.ProtoLens.FieldDescriptor Type
        annotatedType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "annotated_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor AnnotatedType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'annotatedType")) ::
              Data.ProtoLens.FieldDescriptor Type
        existentialType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "existential_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ExistentialType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'existentialType")) ::
              Data.ProtoLens.FieldDescriptor Type
        universalType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "universal_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor UniversalType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'universalType")) ::
              Data.ProtoLens.FieldDescriptor Type
        byNameType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "by_name_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor ByNameType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'byNameType")) ::
              Data.ProtoLens.FieldDescriptor Type
        repeatedType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "repeated_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor RepeatedType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'repeatedType")) ::
              Data.ProtoLens.FieldDescriptor Type
        matchType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "match_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor MatchType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'matchType")) ::
              Data.ProtoLens.FieldDescriptor Type
        lambdaType__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "lambda_type"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor LambdaType)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'lambdaType")) ::
              Data.ProtoLens.FieldDescriptor Type
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 2, typeRef__field_descriptor),
           (Data.ProtoLens.Tag 20, singleType__field_descriptor),
           (Data.ProtoLens.Tag 21, thisType__field_descriptor),
           (Data.ProtoLens.Tag 22, superType__field_descriptor),
           (Data.ProtoLens.Tag 23, constantType__field_descriptor),
           (Data.ProtoLens.Tag 17, intersectionType__field_descriptor),
           (Data.ProtoLens.Tag 18, unionType__field_descriptor),
           (Data.ProtoLens.Tag 19, withType__field_descriptor),
           (Data.ProtoLens.Tag 7, structuralType__field_descriptor),
           (Data.ProtoLens.Tag 8, annotatedType__field_descriptor),
           (Data.ProtoLens.Tag 9, existentialType__field_descriptor),
           (Data.ProtoLens.Tag 10, universalType__field_descriptor),
           (Data.ProtoLens.Tag 13, byNameType__field_descriptor),
           (Data.ProtoLens.Tag 14, repeatedType__field_descriptor),
           (Data.ProtoLens.Tag 25, matchType__field_descriptor),
           (Data.ProtoLens.Tag 26, lambdaType__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _Type'_unknownFields
        (\ x__ y__ -> x__ {_Type'_unknownFields = y__})
  defMessage
    = Type'_constructor
        {_Type'sealedValue = Prelude.Nothing, _Type'_unknownFields = []}
  parseMessage
    = let
        loop :: Type -> Data.ProtoLens.Encoding.Bytes.Parser Type
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type_ref"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"typeRef") y x)
                        162
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "single_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"singleType") y x)
                        170
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "this_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"thisType") y x)
                        178
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "super_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"superType") y x)
                        186
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "constant_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"constantType") y x)
                        138
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "intersection_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"intersectionType") y x)
                        146
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "union_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"unionType") y x)
                        154
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "with_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"withType") y x)
                        58
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "structural_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"structuralType") y x)
                        66
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "annotated_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"annotatedType") y x)
                        74
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "existential_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"existentialType") y x)
                        82
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "universal_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"universalType") y x)
                        106
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "by_name_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"byNameType") y x)
                        114
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "repeated_type"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"repeatedType") y x)
                        202
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "match_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"matchType") y x)
                        210
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "lambda_type"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"lambdaType") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "Type"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'sealedValue") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just (Type'TypeRef v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'SingleType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 162)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'ThisType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 170)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'SuperType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 178)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'ConstantType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 186)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'IntersectionType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 138)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'UnionType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 146)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'WithType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 154)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'StructuralType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 58)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'AnnotatedType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 66)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'ExistentialType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 74)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'UniversalType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 82)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'ByNameType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 106)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'RepeatedType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 114)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'MatchType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 202)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v)
                (Prelude.Just (Type'LambdaType v))
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 210)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData Type where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_Type'_unknownFields x__)
             (Control.DeepSeq.deepseq (_Type'sealedValue x__) ())
instance Control.DeepSeq.NFData Type'SealedValue where
  rnf (Type'TypeRef x__) = Control.DeepSeq.rnf x__
  rnf (Type'SingleType x__) = Control.DeepSeq.rnf x__
  rnf (Type'ThisType x__) = Control.DeepSeq.rnf x__
  rnf (Type'SuperType x__) = Control.DeepSeq.rnf x__
  rnf (Type'ConstantType x__) = Control.DeepSeq.rnf x__
  rnf (Type'IntersectionType x__) = Control.DeepSeq.rnf x__
  rnf (Type'UnionType x__) = Control.DeepSeq.rnf x__
  rnf (Type'WithType x__) = Control.DeepSeq.rnf x__
  rnf (Type'StructuralType x__) = Control.DeepSeq.rnf x__
  rnf (Type'AnnotatedType x__) = Control.DeepSeq.rnf x__
  rnf (Type'ExistentialType x__) = Control.DeepSeq.rnf x__
  rnf (Type'UniversalType x__) = Control.DeepSeq.rnf x__
  rnf (Type'ByNameType x__) = Control.DeepSeq.rnf x__
  rnf (Type'RepeatedType x__) = Control.DeepSeq.rnf x__
  rnf (Type'MatchType x__) = Control.DeepSeq.rnf x__
  rnf (Type'LambdaType x__) = Control.DeepSeq.rnf x__
_Type'TypeRef ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue TypeRef
_Type'TypeRef
  = Data.ProtoLens.Prism.prism'
      Type'TypeRef
      (\ p__
         -> case p__ of
              (Type'TypeRef p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'SingleType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue SingleType
_Type'SingleType
  = Data.ProtoLens.Prism.prism'
      Type'SingleType
      (\ p__
         -> case p__ of
              (Type'SingleType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'ThisType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue ThisType
_Type'ThisType
  = Data.ProtoLens.Prism.prism'
      Type'ThisType
      (\ p__
         -> case p__ of
              (Type'ThisType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'SuperType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue SuperType
_Type'SuperType
  = Data.ProtoLens.Prism.prism'
      Type'SuperType
      (\ p__
         -> case p__ of
              (Type'SuperType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'ConstantType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue ConstantType
_Type'ConstantType
  = Data.ProtoLens.Prism.prism'
      Type'ConstantType
      (\ p__
         -> case p__ of
              (Type'ConstantType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'IntersectionType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue IntersectionType
_Type'IntersectionType
  = Data.ProtoLens.Prism.prism'
      Type'IntersectionType
      (\ p__
         -> case p__ of
              (Type'IntersectionType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'UnionType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue UnionType
_Type'UnionType
  = Data.ProtoLens.Prism.prism'
      Type'UnionType
      (\ p__
         -> case p__ of
              (Type'UnionType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'WithType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue WithType
_Type'WithType
  = Data.ProtoLens.Prism.prism'
      Type'WithType
      (\ p__
         -> case p__ of
              (Type'WithType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'StructuralType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue StructuralType
_Type'StructuralType
  = Data.ProtoLens.Prism.prism'
      Type'StructuralType
      (\ p__
         -> case p__ of
              (Type'StructuralType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'AnnotatedType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue AnnotatedType
_Type'AnnotatedType
  = Data.ProtoLens.Prism.prism'
      Type'AnnotatedType
      (\ p__
         -> case p__ of
              (Type'AnnotatedType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'ExistentialType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue ExistentialType
_Type'ExistentialType
  = Data.ProtoLens.Prism.prism'
      Type'ExistentialType
      (\ p__
         -> case p__ of
              (Type'ExistentialType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'UniversalType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue UniversalType
_Type'UniversalType
  = Data.ProtoLens.Prism.prism'
      Type'UniversalType
      (\ p__
         -> case p__ of
              (Type'UniversalType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'ByNameType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue ByNameType
_Type'ByNameType
  = Data.ProtoLens.Prism.prism'
      Type'ByNameType
      (\ p__
         -> case p__ of
              (Type'ByNameType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'RepeatedType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue RepeatedType
_Type'RepeatedType
  = Data.ProtoLens.Prism.prism'
      Type'RepeatedType
      (\ p__
         -> case p__ of
              (Type'RepeatedType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'MatchType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue MatchType
_Type'MatchType
  = Data.ProtoLens.Prism.prism'
      Type'MatchType
      (\ p__
         -> case p__ of
              (Type'MatchType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
_Type'LambdaType ::
  Data.ProtoLens.Prism.Prism' Type'SealedValue LambdaType
_Type'LambdaType
  = Data.ProtoLens.Prism.prism'
      Type'LambdaType
      (\ p__
         -> case p__ of
              (Type'LambdaType p__val) -> Prelude.Just p__val
              _otherwise -> Prelude.Nothing)
{- | Fields :
     
         * 'Proto.Scip_Fields.prefix' @:: Lens' TypeRef Type@
         * 'Proto.Scip_Fields.maybe'prefix' @:: Lens' TypeRef (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.symbol' @:: Lens' TypeRef Data.Text.Text@
         * 'Proto.Scip_Fields.typeArguments' @:: Lens' TypeRef [Type]@
         * 'Proto.Scip_Fields.vec'typeArguments' @:: Lens' TypeRef (Data.Vector.Vector Type)@ -}
data TypeRef
  = TypeRef'_constructor {_TypeRef'prefix :: !(Prelude.Maybe Type),
                          _TypeRef'symbol :: !Data.Text.Text,
                          _TypeRef'typeArguments :: !(Data.Vector.Vector Type),
                          _TypeRef'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TypeRef where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField TypeRef "prefix" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeRef'prefix (\ x__ y__ -> x__ {_TypeRef'prefix = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField TypeRef "maybe'prefix" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeRef'prefix (\ x__ y__ -> x__ {_TypeRef'prefix = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TypeRef "symbol" Data.Text.Text where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeRef'symbol (\ x__ y__ -> x__ {_TypeRef'symbol = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TypeRef "typeArguments" [Type] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeRef'typeArguments
           (\ x__ y__ -> x__ {_TypeRef'typeArguments = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField TypeRef "vec'typeArguments" (Data.Vector.Vector Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeRef'typeArguments
           (\ x__ y__ -> x__ {_TypeRef'typeArguments = y__}))
        Prelude.id
instance Data.ProtoLens.Message TypeRef where
  messageName _ = Data.Text.pack "scip.TypeRef"
  packedMessageDescriptor _
    = "\n\
      \\aTypeRef\DC2\"\n\
      \\ACKprefix\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ACKprefix\DC2\SYN\n\
      \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol\DC21\n\
      \\SOtype_arguments\CAN\ETX \ETX(\v2\n\
      \.scip.TypeR\rtypeArguments"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        prefix__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "prefix"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'prefix")) ::
              Data.ProtoLens.FieldDescriptor TypeRef
        symbol__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "symbol"
              (Data.ProtoLens.ScalarField Data.ProtoLens.StringField ::
                 Data.ProtoLens.FieldTypeDescriptor Data.Text.Text)
              (Data.ProtoLens.PlainField
                 Data.ProtoLens.Optional (Data.ProtoLens.Field.field @"symbol")) ::
              Data.ProtoLens.FieldDescriptor TypeRef
        typeArguments__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_arguments"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked
                 (Data.ProtoLens.Field.field @"typeArguments")) ::
              Data.ProtoLens.FieldDescriptor TypeRef
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, prefix__field_descriptor),
           (Data.ProtoLens.Tag 2, symbol__field_descriptor),
           (Data.ProtoLens.Tag 3, typeArguments__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TypeRef'_unknownFields
        (\ x__ y__ -> x__ {_TypeRef'_unknownFields = y__})
  defMessage
    = TypeRef'_constructor
        {_TypeRef'prefix = Prelude.Nothing,
         _TypeRef'symbol = Data.ProtoLens.fieldDefault,
         _TypeRef'typeArguments = Data.Vector.Generic.empty,
         _TypeRef'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TypeRef
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Type
             -> Data.ProtoLens.Encoding.Bytes.Parser TypeRef
        loop x mutable'typeArguments
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'typeArguments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                                (Data.ProtoLens.Encoding.Growing.unsafeFreeze
                                                   mutable'typeArguments)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'typeArguments")
                              frozen'typeArguments x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "prefix"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"prefix") y x)
                                  mutable'typeArguments
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do value <- do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                                       Data.ProtoLens.Encoding.Bytes.getBytes
                                                         (Prelude.fromIntegral len)
                                           Data.ProtoLens.Encoding.Bytes.runEither
                                             (case Data.Text.Encoding.decodeUtf8' value of
                                                (Prelude.Left err)
                                                  -> Prelude.Left (Prelude.show err)
                                                (Prelude.Right r) -> Prelude.Right r))
                                       "symbol"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"symbol") y x)
                                  mutable'typeArguments
                        26
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "type_arguments"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append
                                          mutable'typeArguments y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'typeArguments
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'typeArguments <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                         Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'typeArguments)
          "TypeRef"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'prefix") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (let
                   _v = Lens.Family2.view (Data.ProtoLens.Field.field @"symbol") _x
                 in
                   if (Prelude.==) _v Data.ProtoLens.fieldDefault then
                       Data.Monoid.mempty
                   else
                       (Data.Monoid.<>)
                         (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                         ((Prelude..)
                            (\ bs
                               -> (Data.Monoid.<>)
                                    (Data.ProtoLens.Encoding.Bytes.putVarInt
                                       (Prelude.fromIntegral (Data.ByteString.length bs)))
                                    (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                            Data.Text.Encoding.encodeUtf8 _v))
                ((Data.Monoid.<>)
                   (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                      (\ _v
                         -> (Data.Monoid.<>)
                              (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                              ((Prelude..)
                                 (\ bs
                                    -> (Data.Monoid.<>)
                                         (Data.ProtoLens.Encoding.Bytes.putVarInt
                                            (Prelude.fromIntegral (Data.ByteString.length bs)))
                                         (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                 Data.ProtoLens.encodeMessage _v))
                      (Lens.Family2.view
                         (Data.ProtoLens.Field.field @"vec'typeArguments") _x))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData TypeRef where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TypeRef'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TypeRef'prefix x__)
                (Control.DeepSeq.deepseq
                   (_TypeRef'symbol x__)
                   (Control.DeepSeq.deepseq (_TypeRef'typeArguments x__) ())))
{- | Fields :
     
         * 'Proto.Scip_Fields.typeParameters' @:: Lens' TypeSignature Scope@
         * 'Proto.Scip_Fields.maybe'typeParameters' @:: Lens' TypeSignature (Prelude.Maybe Scope)@
         * 'Proto.Scip_Fields.lowerBound' @:: Lens' TypeSignature Type@
         * 'Proto.Scip_Fields.maybe'lowerBound' @:: Lens' TypeSignature (Prelude.Maybe Type)@
         * 'Proto.Scip_Fields.upperBound' @:: Lens' TypeSignature Type@
         * 'Proto.Scip_Fields.maybe'upperBound' @:: Lens' TypeSignature (Prelude.Maybe Type)@ -}
data TypeSignature
  = TypeSignature'_constructor {_TypeSignature'typeParameters :: !(Prelude.Maybe Scope),
                                _TypeSignature'lowerBound :: !(Prelude.Maybe Type),
                                _TypeSignature'upperBound :: !(Prelude.Maybe Type),
                                _TypeSignature'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show TypeSignature where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField TypeSignature "typeParameters" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeSignature'typeParameters
           (\ x__ y__ -> x__ {_TypeSignature'typeParameters = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField TypeSignature "maybe'typeParameters" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeSignature'typeParameters
           (\ x__ y__ -> x__ {_TypeSignature'typeParameters = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TypeSignature "lowerBound" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeSignature'lowerBound
           (\ x__ y__ -> x__ {_TypeSignature'lowerBound = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField TypeSignature "maybe'lowerBound" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeSignature'lowerBound
           (\ x__ y__ -> x__ {_TypeSignature'lowerBound = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField TypeSignature "upperBound" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeSignature'upperBound
           (\ x__ y__ -> x__ {_TypeSignature'upperBound = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField TypeSignature "maybe'upperBound" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _TypeSignature'upperBound
           (\ x__ y__ -> x__ {_TypeSignature'upperBound = y__}))
        Prelude.id
instance Data.ProtoLens.Message TypeSignature where
  messageName _ = Data.Text.pack "scip.TypeSignature"
  packedMessageDescriptor _
    = "\n\
      \\rTypeSignature\DC24\n\
      \\SItype_parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC2+\n\
      \\vlower_bound\CAN\STX \SOH(\v2\n\
      \.scip.TypeR\n\
      \lowerBound\DC2+\n\
      \\vupper_bound\CAN\ETX \SOH(\v2\n\
      \.scip.TypeR\n\
      \upperBound"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        typeParameters__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_parameters"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeParameters")) ::
              Data.ProtoLens.FieldDescriptor TypeSignature
        lowerBound__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "lower_bound"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'lowerBound")) ::
              Data.ProtoLens.FieldDescriptor TypeSignature
        upperBound__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "upper_bound"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'upperBound")) ::
              Data.ProtoLens.FieldDescriptor TypeSignature
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 1, typeParameters__field_descriptor),
           (Data.ProtoLens.Tag 2, lowerBound__field_descriptor),
           (Data.ProtoLens.Tag 3, upperBound__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _TypeSignature'_unknownFields
        (\ x__ y__ -> x__ {_TypeSignature'_unknownFields = y__})
  defMessage
    = TypeSignature'_constructor
        {_TypeSignature'typeParameters = Prelude.Nothing,
         _TypeSignature'lowerBound = Prelude.Nothing,
         _TypeSignature'upperBound = Prelude.Nothing,
         _TypeSignature'_unknownFields = []}
  parseMessage
    = let
        loop ::
          TypeSignature -> Data.ProtoLens.Encoding.Bytes.Parser TypeSignature
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type_parameters"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"typeParameters") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "lower_bound"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"lowerBound") y x)
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "upper_bound"
                                loop
                                  (Lens.Family2.set (Data.ProtoLens.Field.field @"upperBound") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "TypeSignature"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'typeParameters") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view
                       (Data.ProtoLens.Field.field @"maybe'lowerBound") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                ((Data.Monoid.<>)
                   (case
                        Lens.Family2.view
                          (Data.ProtoLens.Field.field @"maybe'upperBound") _x
                    of
                      Prelude.Nothing -> Data.Monoid.mempty
                      (Prelude.Just _v)
                        -> (Data.Monoid.<>)
                             (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                             ((Prelude..)
                                (\ bs
                                   -> (Data.Monoid.<>)
                                        (Data.ProtoLens.Encoding.Bytes.putVarInt
                                           (Prelude.fromIntegral (Data.ByteString.length bs)))
                                        (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                                Data.ProtoLens.encodeMessage _v))
                   (Data.ProtoLens.Encoding.Wire.buildFieldSet
                      (Lens.Family2.view Data.ProtoLens.unknownFields _x))))
instance Control.DeepSeq.NFData TypeSignature where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_TypeSignature'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_TypeSignature'typeParameters x__)
                (Control.DeepSeq.deepseq
                   (_TypeSignature'lowerBound x__)
                   (Control.DeepSeq.deepseq (_TypeSignature'upperBound x__) ())))
{- | Fields :
     
         * 'Proto.Scip_Fields.types' @:: Lens' UnionType [Type]@
         * 'Proto.Scip_Fields.vec'types' @:: Lens' UnionType (Data.Vector.Vector Type)@ -}
data UnionType
  = UnionType'_constructor {_UnionType'types :: !(Data.Vector.Vector Type),
                            _UnionType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UnionType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UnionType "types" [Type] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnionType'types (\ x__ y__ -> x__ {_UnionType'types = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField UnionType "vec'types" (Data.Vector.Vector Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UnionType'types (\ x__ y__ -> x__ {_UnionType'types = y__}))
        Prelude.id
instance Data.ProtoLens.Message UnionType where
  messageName _ = Data.Text.pack "scip.UnionType"
  packedMessageDescriptor _
    = "\n\
      \\tUnionType\DC2 \n\
      \\ENQtypes\CAN\SOH \ETX(\v2\n\
      \.scip.TypeR\ENQtypes"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        types__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "types"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"types")) ::
              Data.ProtoLens.FieldDescriptor UnionType
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, types__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UnionType'_unknownFields
        (\ x__ y__ -> x__ {_UnionType'_unknownFields = y__})
  defMessage
    = UnionType'_constructor
        {_UnionType'types = Data.Vector.Generic.empty,
         _UnionType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UnionType
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Type
             -> Data.ProtoLens.Encoding.Bytes.Parser UnionType
        loop x mutable'types
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'types)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'types") frozen'types x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "types"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'types y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'types
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'types)
          "UnionType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'types") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData UnionType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UnionType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_UnionType'types x__) ())
{- | Fields :
      -}
data UnitConstant
  = UnitConstant'_constructor {_UnitConstant'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UnitConstant where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Message UnitConstant where
  messageName _ = Data.Text.pack "scip.UnitConstant"
  packedMessageDescriptor _
    = "\n\
      \\fUnitConstant"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag = let in Data.Map.fromList []
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UnitConstant'_unknownFields
        (\ x__ y__ -> x__ {_UnitConstant'_unknownFields = y__})
  defMessage
    = UnitConstant'_constructor {_UnitConstant'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UnitConstant -> Data.ProtoLens.Encoding.Bytes.Parser UnitConstant
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of {
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x) }
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UnitConstant"
  buildMessage
    = \ _x
        -> Data.ProtoLens.Encoding.Wire.buildFieldSet
             (Lens.Family2.view Data.ProtoLens.unknownFields _x)
instance Control.DeepSeq.NFData UnitConstant where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq (_UnitConstant'_unknownFields x__) ()
{- | Fields :
     
         * 'Proto.Scip_Fields.typeParameters' @:: Lens' UniversalType Scope@
         * 'Proto.Scip_Fields.maybe'typeParameters' @:: Lens' UniversalType (Prelude.Maybe Scope)@
         * 'Proto.Scip_Fields.tpe' @:: Lens' UniversalType Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' UniversalType (Prelude.Maybe Type)@ -}
data UniversalType
  = UniversalType'_constructor {_UniversalType'typeParameters :: !(Prelude.Maybe Scope),
                                _UniversalType'tpe :: !(Prelude.Maybe Type),
                                _UniversalType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show UniversalType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField UniversalType "typeParameters" Scope where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UniversalType'typeParameters
           (\ x__ y__ -> x__ {_UniversalType'typeParameters = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UniversalType "maybe'typeParameters" (Prelude.Maybe Scope) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UniversalType'typeParameters
           (\ x__ y__ -> x__ {_UniversalType'typeParameters = y__}))
        Prelude.id
instance Data.ProtoLens.Field.HasField UniversalType "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UniversalType'tpe (\ x__ y__ -> x__ {_UniversalType'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField UniversalType "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _UniversalType'tpe (\ x__ y__ -> x__ {_UniversalType'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Message UniversalType where
  messageName _ = Data.Text.pack "scip.UniversalType"
  packedMessageDescriptor _
    = "\n\
      \\rUniversalType\DC24\n\
      \\SItype_parameters\CAN\ETX \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC2\FS\n\
      \\ETXtpe\CAN\STX \SOH(\v2\n\
      \.scip.TypeR\ETXtpeJ\EOT\b\SOH\DLE\STX"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        typeParameters__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "type_parameters"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Scope)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'typeParameters")) ::
              Data.ProtoLens.FieldDescriptor UniversalType
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor UniversalType
      in
        Data.Map.fromList
          [(Data.ProtoLens.Tag 3, typeParameters__field_descriptor),
           (Data.ProtoLens.Tag 2, tpe__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _UniversalType'_unknownFields
        (\ x__ y__ -> x__ {_UniversalType'_unknownFields = y__})
  defMessage
    = UniversalType'_constructor
        {_UniversalType'typeParameters = Prelude.Nothing,
         _UniversalType'tpe = Prelude.Nothing,
         _UniversalType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          UniversalType -> Data.ProtoLens.Encoding.Bytes.Parser UniversalType
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        26
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "type_parameters"
                                loop
                                  (Lens.Family2.set
                                     (Data.ProtoLens.Field.field @"typeParameters") y x)
                        18
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "UniversalType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view
                    (Data.ProtoLens.Field.field @"maybe'typeParameters") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 26)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             ((Data.Monoid.<>)
                (case
                     Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
                 of
                   Prelude.Nothing -> Data.Monoid.mempty
                   (Prelude.Just _v)
                     -> (Data.Monoid.<>)
                          (Data.ProtoLens.Encoding.Bytes.putVarInt 18)
                          ((Prelude..)
                             (\ bs
                                -> (Data.Monoid.<>)
                                     (Data.ProtoLens.Encoding.Bytes.putVarInt
                                        (Prelude.fromIntegral (Data.ByteString.length bs)))
                                     (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                             Data.ProtoLens.encodeMessage _v))
                (Data.ProtoLens.Encoding.Wire.buildFieldSet
                   (Lens.Family2.view Data.ProtoLens.unknownFields _x)))
instance Control.DeepSeq.NFData UniversalType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_UniversalType'_unknownFields x__)
             (Control.DeepSeq.deepseq
                (_UniversalType'typeParameters x__)
                (Control.DeepSeq.deepseq (_UniversalType'tpe x__) ()))
{- | Fields :
     
         * 'Proto.Scip_Fields.tpe' @:: Lens' ValueSignature Type@
         * 'Proto.Scip_Fields.maybe'tpe' @:: Lens' ValueSignature (Prelude.Maybe Type)@ -}
data ValueSignature
  = ValueSignature'_constructor {_ValueSignature'tpe :: !(Prelude.Maybe Type),
                                 _ValueSignature'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show ValueSignature where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField ValueSignature "tpe" Type where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ValueSignature'tpe (\ x__ y__ -> x__ {_ValueSignature'tpe = y__}))
        (Data.ProtoLens.maybeLens Data.ProtoLens.defMessage)
instance Data.ProtoLens.Field.HasField ValueSignature "maybe'tpe" (Prelude.Maybe Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _ValueSignature'tpe (\ x__ y__ -> x__ {_ValueSignature'tpe = y__}))
        Prelude.id
instance Data.ProtoLens.Message ValueSignature where
  messageName _ = Data.Text.pack "scip.ValueSignature"
  packedMessageDescriptor _
    = "\n\
      \\SOValueSignature\DC2\FS\n\
      \\ETXtpe\CAN\SOH \SOH(\v2\n\
      \.scip.TypeR\ETXtpe"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        tpe__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "tpe"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.OptionalField
                 (Data.ProtoLens.Field.field @"maybe'tpe")) ::
              Data.ProtoLens.FieldDescriptor ValueSignature
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, tpe__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _ValueSignature'_unknownFields
        (\ x__ y__ -> x__ {_ValueSignature'_unknownFields = y__})
  defMessage
    = ValueSignature'_constructor
        {_ValueSignature'tpe = Prelude.Nothing,
         _ValueSignature'_unknownFields = []}
  parseMessage
    = let
        loop ::
          ValueSignature
          -> Data.ProtoLens.Encoding.Bytes.Parser ValueSignature
        loop x
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t) x)
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                       (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                           Data.ProtoLens.Encoding.Bytes.isolate
                                             (Prelude.fromIntegral len) Data.ProtoLens.parseMessage)
                                       "tpe"
                                loop (Lens.Family2.set (Data.ProtoLens.Field.field @"tpe") y x)
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do loop Data.ProtoLens.defMessage) "ValueSignature"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (case
                  Lens.Family2.view (Data.ProtoLens.Field.field @"maybe'tpe") _x
              of
                Prelude.Nothing -> Data.Monoid.mempty
                (Prelude.Just _v)
                  -> (Data.Monoid.<>)
                       (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                       ((Prelude..)
                          (\ bs
                             -> (Data.Monoid.<>)
                                  (Data.ProtoLens.Encoding.Bytes.putVarInt
                                     (Prelude.fromIntegral (Data.ByteString.length bs)))
                                  (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                          Data.ProtoLens.encodeMessage _v))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData ValueSignature where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_ValueSignature'_unknownFields x__)
             (Control.DeepSeq.deepseq (_ValueSignature'tpe x__) ())
{- | Fields :
     
         * 'Proto.Scip_Fields.types' @:: Lens' WithType [Type]@
         * 'Proto.Scip_Fields.vec'types' @:: Lens' WithType (Data.Vector.Vector Type)@ -}
data WithType
  = WithType'_constructor {_WithType'types :: !(Data.Vector.Vector Type),
                           _WithType'_unknownFields :: !Data.ProtoLens.FieldSet}
  deriving stock (Prelude.Eq, Prelude.Ord)
instance Prelude.Show WithType where
  showsPrec _ __x __s
    = Prelude.showChar
        '{'
        (Prelude.showString
           (Data.ProtoLens.showMessageShort __x) (Prelude.showChar '}' __s))
instance Data.ProtoLens.Field.HasField WithType "types" [Type] where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _WithType'types (\ x__ y__ -> x__ {_WithType'types = y__}))
        (Lens.Family2.Unchecked.lens
           Data.Vector.Generic.toList
           (\ _ y__ -> Data.Vector.Generic.fromList y__))
instance Data.ProtoLens.Field.HasField WithType "vec'types" (Data.Vector.Vector Type) where
  fieldOf _
    = (Prelude..)
        (Lens.Family2.Unchecked.lens
           _WithType'types (\ x__ y__ -> x__ {_WithType'types = y__}))
        Prelude.id
instance Data.ProtoLens.Message WithType where
  messageName _ = Data.Text.pack "scip.WithType"
  packedMessageDescriptor _
    = "\n\
      \\bWithType\DC2 \n\
      \\ENQtypes\CAN\SOH \ETX(\v2\n\
      \.scip.TypeR\ENQtypes"
  packedFileDescriptor _ = packedFileDescriptor
  fieldsByTag
    = let
        types__field_descriptor
          = Data.ProtoLens.FieldDescriptor
              "types"
              (Data.ProtoLens.MessageField Data.ProtoLens.MessageType ::
                 Data.ProtoLens.FieldTypeDescriptor Type)
              (Data.ProtoLens.RepeatedField
                 Data.ProtoLens.Unpacked (Data.ProtoLens.Field.field @"types")) ::
              Data.ProtoLens.FieldDescriptor WithType
      in
        Data.Map.fromList [(Data.ProtoLens.Tag 1, types__field_descriptor)]
  unknownFields
    = Lens.Family2.Unchecked.lens
        _WithType'_unknownFields
        (\ x__ y__ -> x__ {_WithType'_unknownFields = y__})
  defMessage
    = WithType'_constructor
        {_WithType'types = Data.Vector.Generic.empty,
         _WithType'_unknownFields = []}
  parseMessage
    = let
        loop ::
          WithType
          -> Data.ProtoLens.Encoding.Growing.Growing Data.Vector.Vector Data.ProtoLens.Encoding.Growing.RealWorld Type
             -> Data.ProtoLens.Encoding.Bytes.Parser WithType
        loop x mutable'types
          = do end <- Data.ProtoLens.Encoding.Bytes.atEnd
               if end then
                   do frozen'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                        (Data.ProtoLens.Encoding.Growing.unsafeFreeze mutable'types)
                      (let missing = []
                       in
                         if Prelude.null missing then
                             Prelude.return ()
                         else
                             Prelude.fail
                               ((Prelude.++)
                                  "Missing required fields: "
                                  (Prelude.show (missing :: [Prelude.String]))))
                      Prelude.return
                        (Lens.Family2.over
                           Data.ProtoLens.unknownFields (\ !t -> Prelude.reverse t)
                           (Lens.Family2.set
                              (Data.ProtoLens.Field.field @"vec'types") frozen'types x))
               else
                   do tag <- Data.ProtoLens.Encoding.Bytes.getVarInt
                      case tag of
                        10
                          -> do !y <- (Data.ProtoLens.Encoding.Bytes.<?>)
                                        (do len <- Data.ProtoLens.Encoding.Bytes.getVarInt
                                            Data.ProtoLens.Encoding.Bytes.isolate
                                              (Prelude.fromIntegral len)
                                              Data.ProtoLens.parseMessage)
                                        "types"
                                v <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                       (Data.ProtoLens.Encoding.Growing.append mutable'types y)
                                loop x v
                        wire
                          -> do !y <- Data.ProtoLens.Encoding.Wire.parseTaggedValueFromWire
                                        wire
                                loop
                                  (Lens.Family2.over
                                     Data.ProtoLens.unknownFields (\ !t -> (:) y t) x)
                                  mutable'types
      in
        (Data.ProtoLens.Encoding.Bytes.<?>)
          (do mutable'types <- Data.ProtoLens.Encoding.Parser.Unsafe.unsafeLiftIO
                                 Data.ProtoLens.Encoding.Growing.new
              loop Data.ProtoLens.defMessage mutable'types)
          "WithType"
  buildMessage
    = \ _x
        -> (Data.Monoid.<>)
             (Data.ProtoLens.Encoding.Bytes.foldMapBuilder
                (\ _v
                   -> (Data.Monoid.<>)
                        (Data.ProtoLens.Encoding.Bytes.putVarInt 10)
                        ((Prelude..)
                           (\ bs
                              -> (Data.Monoid.<>)
                                   (Data.ProtoLens.Encoding.Bytes.putVarInt
                                      (Prelude.fromIntegral (Data.ByteString.length bs)))
                                   (Data.ProtoLens.Encoding.Bytes.putBytes bs))
                           Data.ProtoLens.encodeMessage _v))
                (Lens.Family2.view (Data.ProtoLens.Field.field @"vec'types") _x))
             (Data.ProtoLens.Encoding.Wire.buildFieldSet
                (Lens.Family2.view Data.ProtoLens.unknownFields _x))
instance Control.DeepSeq.NFData WithType where
  rnf
    = \ x__
        -> Control.DeepSeq.deepseq
             (_WithType'_unknownFields x__)
             (Control.DeepSeq.deepseq (_WithType'types x__) ())
packedFileDescriptor :: Data.ByteString.ByteString
packedFileDescriptor
  = "\n\
    \\n\
    \scip.proto\DC2\EOTscip\"\165\SOH\n\
    \\ENQIndex\DC2*\n\
    \\bmetadata\CAN\SOH \SOH(\v2\SO.scip.MetadataR\bmetadata\DC2,\n\
    \\tdocuments\CAN\STX \ETX(\v2\SO.scip.DocumentR\tdocuments\DC2B\n\
    \\DLEexternal_symbols\CAN\ETX \ETX(\v2\ETB.scip.SymbolInformationR\SIexternalSymbols\"\213\SOH\n\
    \\bMetadata\DC2/\n\
    \\aversion\CAN\SOH \SOH(\SO2\NAK.scip.ProtocolVersionR\aversion\DC2+\n\
    \\ttool_info\CAN\STX \SOH(\v2\SO.scip.ToolInfoR\btoolInfo\DC2!\n\
    \\fproject_root\CAN\ETX \SOH(\tR\vprojectRoot\DC2H\n\
    \\SYNtext_document_encoding\CAN\EOT \SOH(\SO2\DC2.scip.TextEncodingR\DC4textDocumentEncoding\"V\n\
    \\bToolInfo\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2\CAN\n\
    \\aversion\CAN\STX \SOH(\tR\aversion\DC2\FS\n\
    \\targuments\CAN\ETX \ETX(\tR\targuments\"\139\STX\n\
    \\bDocument\DC2\SUB\n\
    \\blanguage\CAN\EOT \SOH(\tR\blanguage\DC2#\n\
    \\rrelative_path\CAN\SOH \SOH(\tR\frelativePath\DC22\n\
    \\voccurrences\CAN\STX \ETX(\v2\DLE.scip.OccurrenceR\voccurrences\DC21\n\
    \\asymbols\CAN\ETX \ETX(\v2\ETB.scip.SymbolInformationR\asymbols\DC2\DC2\n\
    \\EOTtext\CAN\ENQ \SOH(\tR\EOTtext\DC2C\n\
    \\DC1position_encoding\CAN\ACK \SOH(\SO2\SYN.scip.PositionEncodingR\DLEpositionEncoding\"}\n\
    \\ACKSymbol\DC2\SYN\n\
    \\ACKscheme\CAN\SOH \SOH(\tR\ACKscheme\DC2'\n\
    \\apackage\CAN\STX \SOH(\v2\r.scip.PackageR\apackage\DC22\n\
    \\vdescriptors\CAN\ETX \ETX(\v2\DLE.scip.DescriptorR\vdescriptors\"Q\n\
    \\aPackage\DC2\CAN\n\
    \\amanager\CAN\SOH \SOH(\tR\amanager\DC2\DC2\n\
    \\EOTname\CAN\STX \SOH(\tR\EOTname\DC2\CAN\n\
    \\aversion\CAN\ETX \SOH(\tR\aversion\"\159\STX\n\
    \\n\
    \Descriptor\DC2\DC2\n\
    \\EOTname\CAN\SOH \SOH(\tR\EOTname\DC2$\n\
    \\rdisambiguator\CAN\STX \SOH(\tR\rdisambiguator\DC2/\n\
    \\ACKsuffix\CAN\ETX \SOH(\SO2\ETB.scip.Descriptor.SuffixR\ACKsuffix\"\165\SOH\n\
    \\ACKSuffix\DC2\NAK\n\
    \\DC1UnspecifiedSuffix\DLE\NUL\DC2\r\n\
    \\tNamespace\DLE\SOH\DC2\SI\n\
    \\aPackage\DLE\SOH\SUB\STX\b\SOH\DC2\b\n\
    \\EOTType\DLE\STX\DC2\b\n\
    \\EOTTerm\DLE\ETX\DC2\n\
    \\n\
    \\ACKMethod\DLE\EOT\DC2\DC1\n\
    \\rTypeParameter\DLE\ENQ\DC2\r\n\
    \\tParameter\DLE\ACK\DC2\b\n\
    \\EOTMeta\DLE\a\DC2\t\n\
    \\ENQLocal\DLE\b\DC2\t\n\
    \\ENQMacro\DLE\t\SUB\STX\DLE\SOH\"\218\f\n\
    \\DC1SymbolInformation\DC2\SYN\n\
    \\ACKsymbol\CAN\SOH \SOH(\tR\ACKsymbol\DC2$\n\
    \\rdocumentation\CAN\ETX \ETX(\tR\rdocumentation\DC28\n\
    \\rrelationships\CAN\EOT \ETX(\v2\DC2.scip.RelationshipR\rrelationships\DC20\n\
    \\EOTkind\CAN\ENQ \SOH(\SO2\FS.scip.SymbolInformation.KindR\EOTkind\DC2!\n\
    \\fdisplay_name\CAN\ACK \SOH(\tR\vdisplayName\DC2G\n\
    \\ETBsignature_documentation\CAN\a \SOH(\v2\SO.scip.DocumentR\SYNsignatureDocumentation\DC2)\n\
    \\DLEenclosing_symbol\CAN\b \SOH(\tR\SIenclosingSymbol\DC2-\n\
    \\tsignature\CAN\t \SOH(\v2\SI.scip.SignatureR\tsignature\"\212\t\n\
    \\EOTKind\DC2\DC3\n\
    \\SIUnspecifiedKind\DLE\NUL\DC2\DC2\n\
    \\SOAbstractMethod\DLEB\DC2\f\n\
    \\bAccessor\DLEH\DC2\t\n\
    \\ENQArray\DLE\SOH\DC2\r\n\
    \\tAssertion\DLE\STX\DC2\DC2\n\
    \\SOAssociatedType\DLE\ETX\DC2\r\n\
    \\tAttribute\DLE\EOT\DC2\t\n\
    \\ENQAxiom\DLE\ENQ\DC2\v\n\
    \\aBoolean\DLE\ACK\DC2\t\n\
    \\ENQClass\DLE\a\DC2\f\n\
    \\bConstant\DLE\b\DC2\SI\n\
    \\vConstructor\DLE\t\DC2\f\n\
    \\bContract\DLE>\DC2\SO\n\
    \\n\
    \DataFamily\DLE\n\
    \\DC2\f\n\
    \\bDelegate\DLEI\DC2\b\n\
    \\EOTEnum\DLE\v\DC2\SO\n\
    \\n\
    \EnumMember\DLE\f\DC2\t\n\
    \\ENQError\DLE?\DC2\t\n\
    \\ENQEvent\DLE\r\DC2\b\n\
    \\EOTFact\DLE\SO\DC2\t\n\
    \\ENQField\DLE\SI\DC2\b\n\
    \\EOTFile\DLE\DLE\DC2\f\n\
    \\bFunction\DLE\DC1\DC2\n\
    \\n\
    \\ACKGetter\DLE\DC2\DC2\v\n\
    \\aGrammar\DLE\DC3\DC2\f\n\
    \\bInstance\DLE\DC4\DC2\r\n\
    \\tInterface\DLE\NAK\DC2\a\n\
    \\ETXKey\DLE\SYN\DC2\b\n\
    \\EOTLang\DLE\ETB\DC2\t\n\
    \\ENQLemma\DLE\CAN\DC2\v\n\
    \\aLibrary\DLE@\DC2\t\n\
    \\ENQMacro\DLE\EM\DC2\n\
    \\n\
    \\ACKMethod\DLE\SUB\DC2\SI\n\
    \\vMethodAlias\DLEJ\DC2\DC2\n\
    \\SOMethodReceiver\DLE\ESC\DC2\ETB\n\
    \\DC3MethodSpecification\DLEC\DC2\v\n\
    \\aMessage\DLE\FS\DC2\f\n\
    \\bModifier\DLEA\DC2\n\
    \\n\
    \\ACKModule\DLE\GS\DC2\r\n\
    \\tNamespace\DLE\RS\DC2\b\n\
    \\EOTNull\DLE\US\DC2\n\
    \\n\
    \\ACKNumber\DLE \DC2\n\
    \\n\
    \\ACKObject\DLE!\DC2\f\n\
    \\bOperator\DLE\"\DC2\v\n\
    \\aPackage\DLE#\DC2\DC1\n\
    \\rPackageObject\DLE$\DC2\r\n\
    \\tParameter\DLE%\DC2\DC2\n\
    \\SOParameterLabel\DLE&\DC2\v\n\
    \\aPattern\DLE'\DC2\r\n\
    \\tPredicate\DLE(\DC2\f\n\
    \\bProperty\DLE)\DC2\f\n\
    \\bProtocol\DLE*\DC2\DC2\n\
    \\SOProtocolMethod\DLED\DC2\NAK\n\
    \\DC1PureVirtualMethod\DLEE\DC2\SI\n\
    \\vQuasiquoter\DLE+\DC2\DC1\n\
    \\rSelfParameter\DLE,\DC2\n\
    \\n\
    \\ACKSetter\DLE-\DC2\r\n\
    \\tSignature\DLE.\DC2\DC2\n\
    \\SOSingletonClass\DLEK\DC2\DC3\n\
    \\SISingletonMethod\DLEL\DC2\DC4\n\
    \\DLEStaticDataMember\DLEM\DC2\SI\n\
    \\vStaticEvent\DLEN\DC2\SI\n\
    \\vStaticField\DLEO\DC2\DLE\n\
    \\fStaticMethod\DLEP\DC2\DC2\n\
    \\SOStaticProperty\DLEQ\DC2\DC2\n\
    \\SOStaticVariable\DLER\DC2\n\
    \\n\
    \\ACKString\DLE0\DC2\n\
    \\n\
    \\ACKStruct\DLE1\DC2\r\n\
    \\tSubscript\DLE/\DC2\n\
    \\n\
    \\ACKTactic\DLE2\DC2\v\n\
    \\aTheorem\DLE3\DC2\DC1\n\
    \\rThisParameter\DLE4\DC2\t\n\
    \\ENQTrait\DLE5\DC2\SI\n\
    \\vTraitMethod\DLEF\DC2\b\n\
    \\EOTType\DLE6\DC2\r\n\
    \\tTypeAlias\DLE7\DC2\r\n\
    \\tTypeClass\DLE8\DC2\DC3\n\
    \\SITypeClassMethod\DLEG\DC2\SO\n\
    \\n\
    \TypeFamily\DLE9\DC2\DC1\n\
    \\rTypeParameter\DLE:\DC2\t\n\
    \\ENQUnion\DLE;\DC2\t\n\
    \\ENQValue\DLE<\DC2\f\n\
    \\bVariable\DLE=\"\201\SOH\n\
    \\fRelationship\DC2\SYN\n\
    \\ACKsymbol\CAN\SOH \SOH(\tR\ACKsymbol\DC2!\n\
    \\fis_reference\CAN\STX \SOH(\bR\visReference\DC2+\n\
    \\DC1is_implementation\CAN\ETX \SOH(\bR\DLEisImplementation\DC2,\n\
    \\DC2is_type_definition\CAN\EOT \SOH(\bR\DLEisTypeDefinition\DC2#\n\
    \\ris_definition\CAN\ENQ \SOH(\bR\fisDefinition\"\164\STX\n\
    \\n\
    \Occurrence\DC2\DC4\n\
    \\ENQrange\CAN\SOH \ETX(\ENQR\ENQrange\DC2\SYN\n\
    \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol\DC2!\n\
    \\fsymbol_roles\CAN\ETX \SOH(\ENQR\vsymbolRoles\DC25\n\
    \\SYNoverride_documentation\CAN\EOT \ETX(\tR\NAKoverrideDocumentation\DC21\n\
    \\vsyntax_kind\CAN\ENQ \SOH(\SO2\DLE.scip.SyntaxKindR\n\
    \syntaxKind\DC22\n\
    \\vdiagnostics\CAN\ACK \ETX(\v2\DLE.scip.DiagnosticR\vdiagnostics\DC2'\n\
    \\SIenclosing_range\CAN\a \ETX(\ENQR\SOenclosingRange\"\167\SOH\n\
    \\n\
    \Diagnostic\DC2*\n\
    \\bseverity\CAN\SOH \SOH(\SO2\SO.scip.SeverityR\bseverity\DC2\DC2\n\
    \\EOTcode\CAN\STX \SOH(\tR\EOTcode\DC2\CAN\n\
    \\amessage\CAN\ETX \SOH(\tR\amessage\DC2\SYN\n\
    \\ACKsource\CAN\EOT \SOH(\tR\ACKsource\DC2'\n\
    \\EOTtags\CAN\ENQ \ETX(\SO2\DC3.scip.DiagnosticTagR\EOTtags\"*\n\
    \\n\
    \Annotation\DC2\FS\n\
    \\ETXtpe\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXtpe\"Z\n\
    \\ENQScope\DC2\SUB\n\
    \\bsymlinks\CAN\SOH \ETX(\tR\bsymlinks\DC25\n\
    \\thardlinks\CAN\STX \ETX(\v2\ETB.scip.SymbolInformationR\thardlinks\"\202\a\n\
    \\EOTType\DC2*\n\
    \\btype_ref\CAN\STX \SOH(\v2\r.scip.TypeRefH\NULR\atypeRef\DC23\n\
    \\vsingle_type\CAN\DC4 \SOH(\v2\DLE.scip.SingleTypeH\NULR\n\
    \singleType\DC2-\n\
    \\tthis_type\CAN\NAK \SOH(\v2\SO.scip.ThisTypeH\NULR\bthisType\DC20\n\
    \\n\
    \super_type\CAN\SYN \SOH(\v2\SI.scip.SuperTypeH\NULR\tsuperType\DC29\n\
    \\rconstant_type\CAN\ETB \SOH(\v2\DC2.scip.ConstantTypeH\NULR\fconstantType\DC2E\n\
    \\DC1intersection_type\CAN\DC1 \SOH(\v2\SYN.scip.IntersectionTypeH\NULR\DLEintersectionType\DC20\n\
    \\n\
    \union_type\CAN\DC2 \SOH(\v2\SI.scip.UnionTypeH\NULR\tunionType\DC2-\n\
    \\twith_type\CAN\DC3 \SOH(\v2\SO.scip.WithTypeH\NULR\bwithType\DC2?\n\
    \\SIstructural_type\CAN\a \SOH(\v2\DC4.scip.StructuralTypeH\NULR\SOstructuralType\DC2<\n\
    \\SOannotated_type\CAN\b \SOH(\v2\DC3.scip.AnnotatedTypeH\NULR\rannotatedType\DC2B\n\
    \\DLEexistential_type\CAN\t \SOH(\v2\NAK.scip.ExistentialTypeH\NULR\SIexistentialType\DC2<\n\
    \\SOuniversal_type\CAN\n\
    \ \SOH(\v2\DC3.scip.UniversalTypeH\NULR\runiversalType\DC24\n\
    \\fby_name_type\CAN\r \SOH(\v2\DLE.scip.ByNameTypeH\NULR\n\
    \byNameType\DC29\n\
    \\rrepeated_type\CAN\SO \SOH(\v2\DC2.scip.RepeatedTypeH\NULR\frepeatedType\DC20\n\
    \\n\
    \match_type\CAN\EM \SOH(\v2\SI.scip.MatchTypeH\NULR\tmatchType\DC23\n\
    \\vlambda_type\CAN\SUB \SOH(\v2\DLE.scip.LambdaTypeH\NULR\n\
    \lambdaTypeB\SO\n\
    \\fsealed_valueJ\EOT\b\SOH\DLE\STXJ\EOT\b\ETX\DLE\EOTJ\EOT\b\EOT\DLE\ENQJ\EOT\b\ENQ\DLE\ACKJ\EOT\b\ACK\DLE\aJ\EOT\b\v\DLE\fJ\EOT\b\f\DLE\rJ\EOT\b\SI\DLE\DLEJ\EOT\b\DLE\DLE\DC1\"f\n\
    \\n\
    \LambdaType\DC2+\n\
    \\n\
    \parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\n\
    \parameters\DC2+\n\
    \\vreturn_type\CAN\STX \SOH(\v2\n\
    \.scip.TypeR\n\
    \returnType\"x\n\
    \\aTypeRef\DC2\"\n\
    \\ACKprefix\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ACKprefix\DC2\SYN\n\
    \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol\DC21\n\
    \\SOtype_arguments\CAN\ETX \ETX(\v2\n\
    \.scip.TypeR\rtypeArguments\"H\n\
    \\n\
    \SingleType\DC2\"\n\
    \\ACKprefix\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ACKprefix\DC2\SYN\n\
    \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol\"\"\n\
    \\bThisType\DC2\SYN\n\
    \\ACKsymbol\CAN\SOH \SOH(\tR\ACKsymbol\"G\n\
    \\tSuperType\DC2\"\n\
    \\ACKprefix\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ACKprefix\DC2\SYN\n\
    \\ACKsymbol\CAN\STX \SOH(\tR\ACKsymbol\":\n\
    \\fConstantType\DC2*\n\
    \\bconstant\CAN\SOH \SOH(\v2\SO.scip.ConstantR\bconstant\"4\n\
    \\DLEIntersectionType\DC2 \n\
    \\ENQtypes\CAN\SOH \ETX(\v2\n\
    \.scip.TypeR\ENQtypes\"-\n\
    \\tUnionType\DC2 \n\
    \\ENQtypes\CAN\SOH \ETX(\v2\n\
    \.scip.TypeR\ENQtypes\",\n\
    \\bWithType\DC2 \n\
    \\ENQtypes\CAN\SOH \ETX(\v2\n\
    \.scip.TypeR\ENQtypes\"q\n\
    \\SOStructuralType\DC2\FS\n\
    \\ETXtpe\CAN\EOT \SOH(\v2\n\
    \.scip.TypeR\ETXtpe\DC2/\n\
    \\fdeclarations\CAN\ENQ \SOH(\v2\v.scip.ScopeR\fdeclarationsJ\EOT\b\SOH\DLE\STXJ\EOT\b\STX\DLE\ETXJ\EOT\b\ETX\DLE\EOT\"g\n\
    \\rAnnotatedType\DC22\n\
    \\vannotations\CAN\ETX \ETX(\v2\DLE.scip.AnnotationR\vannotations\DC2\FS\n\
    \\ETXtpe\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXtpeJ\EOT\b\STX\DLE\ETX\"f\n\
    \\SIExistentialType\DC2\FS\n\
    \\ETXtpe\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXtpe\DC2/\n\
    \\fdeclarations\CAN\ETX \SOH(\v2\v.scip.ScopeR\fdeclarationsJ\EOT\b\STX\DLE\ETX\"i\n\
    \\rUniversalType\DC24\n\
    \\SItype_parameters\CAN\ETX \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC2\FS\n\
    \\ETXtpe\CAN\STX \SOH(\v2\n\
    \.scip.TypeR\ETXtpeJ\EOT\b\SOH\DLE\STX\"*\n\
    \\n\
    \ByNameType\DC2\FS\n\
    \\ETXtpe\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXtpe\",\n\
    \\fRepeatedType\DC2\FS\n\
    \\ETXtpe\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXtpe\"\175\SOH\n\
    \\tMatchType\DC2(\n\
    \\tscrutinee\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\tscrutinee\DC2.\n\
    \\ENQcases\CAN\STX \ETX(\v2\CAN.scip.MatchType.CaseTypeR\ENQcases\SUBH\n\
    \\bCaseType\DC2\FS\n\
    \\ETXkey\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXkey\DC2\RS\n\
    \\EOTbody\CAN\STX \SOH(\v2\n\
    \.scip.TypeR\EOTbody\"\187\ENQ\n\
    \\bConstant\DC29\n\
    \\runit_constant\CAN\SOH \SOH(\v2\DC2.scip.UnitConstantH\NULR\funitConstant\DC2B\n\
    \\DLEboolean_constant\CAN\STX \SOH(\v2\NAK.scip.BooleanConstantH\NULR\SIbooleanConstant\DC29\n\
    \\rbyte_constant\CAN\ETX \SOH(\v2\DC2.scip.ByteConstantH\NULR\fbyteConstant\DC2<\n\
    \\SOshort_constant\CAN\EOT \SOH(\v2\DC3.scip.ShortConstantH\NULR\rshortConstant\DC29\n\
    \\rchar_constant\CAN\ENQ \SOH(\v2\DC2.scip.CharConstantH\NULR\fcharConstant\DC26\n\
    \\fint_constant\CAN\ACK \SOH(\v2\DC1.scip.IntConstantH\NULR\vintConstant\DC29\n\
    \\rlong_constant\CAN\a \SOH(\v2\DC2.scip.LongConstantH\NULR\flongConstant\DC2<\n\
    \\SOfloat_constant\CAN\b \SOH(\v2\DC3.scip.FloatConstantH\NULR\rfloatConstant\DC2?\n\
    \\SIdouble_constant\CAN\t \SOH(\v2\DC4.scip.DoubleConstantH\NULR\SOdoubleConstant\DC2?\n\
    \\SIstring_constant\CAN\n\
    \ \SOH(\v2\DC4.scip.StringConstantH\NULR\SOstringConstant\DC29\n\
    \\rnull_constant\CAN\v \SOH(\v2\DC2.scip.NullConstantH\NULR\fnullConstantB\SO\n\
    \\fsealed_value\"\SO\n\
    \\fUnitConstant\"'\n\
    \\SIBooleanConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\bR\ENQvalue\"$\n\
    \\fByteConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue\"%\n\
    \\rShortConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue\"$\n\
    \\fCharConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue\"#\n\
    \\vIntConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ENQR\ENQvalue\"$\n\
    \\fLongConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\ETXR\ENQvalue\"%\n\
    \\rFloatConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\STXR\ENQvalue\"&\n\
    \\SODoubleConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\SOHR\ENQvalue\"&\n\
    \\SOStringConstant\DC2\DC4\n\
    \\ENQvalue\CAN\SOH \SOH(\tR\ENQvalue\"\SO\n\
    \\fNullConstant\"\159\STX\n\
    \\tSignature\DC2?\n\
    \\SIclass_signature\CAN\SOH \SOH(\v2\DC4.scip.ClassSignatureH\NULR\SOclassSignature\DC2B\n\
    \\DLEmethod_signature\CAN\STX \SOH(\v2\NAK.scip.MethodSignatureH\NULR\SImethodSignature\DC2<\n\
    \\SOtype_signature\CAN\ETX \SOH(\v2\DC3.scip.TypeSignatureH\NULR\rtypeSignature\DC2?\n\
    \\SIvalue_signature\CAN\EOT \SOH(\v2\DC4.scip.ValueSignatureH\NULR\SOvalueSignatureB\SO\n\
    \\fsealed_value\"\189\SOH\n\
    \\SOClassSignature\DC24\n\
    \\SItype_parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC2$\n\
    \\aparents\CAN\STX \ETX(\v2\n\
    \.scip.TypeR\aparents\DC2\RS\n\
    \\EOTself\CAN\ETX \SOH(\v2\n\
    \.scip.TypeR\EOTself\DC2/\n\
    \\fdeclarations\CAN\EOT \SOH(\v2\v.scip.ScopeR\fdeclarations\"\170\SOH\n\
    \\SIMethodSignature\DC24\n\
    \\SItype_parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC24\n\
    \\SIparameter_lists\CAN\STX \ETX(\v2\v.scip.ScopeR\SOparameterLists\DC2+\n\
    \\vreturn_type\CAN\ETX \SOH(\v2\n\
    \.scip.TypeR\n\
    \returnType\"\159\SOH\n\
    \\rTypeSignature\DC24\n\
    \\SItype_parameters\CAN\SOH \SOH(\v2\v.scip.ScopeR\SOtypeParameters\DC2+\n\
    \\vlower_bound\CAN\STX \SOH(\v2\n\
    \.scip.TypeR\n\
    \lowerBound\DC2+\n\
    \\vupper_bound\CAN\ETX \SOH(\v2\n\
    \.scip.TypeR\n\
    \upperBound\".\n\
    \\SOValueSignature\DC2\FS\n\
    \\ETXtpe\CAN\SOH \SOH(\v2\n\
    \.scip.TypeR\ETXtpe*1\n\
    \\SIProtocolVersion\DC2\RS\n\
    \\SUBUnspecifiedProtocolVersion\DLE\NUL*@\n\
    \\fTextEncoding\DC2\ESC\n\
    \\ETBUnspecifiedTextEncoding\DLE\NUL\DC2\b\n\
    \\EOTUTF8\DLE\SOH\DC2\t\n\
    \\ENQUTF16\DLE\STX*\164\SOH\n\
    \\DLEPositionEncoding\DC2\US\n\
    \\ESCUnspecifiedPositionEncoding\DLE\NUL\DC2#\n\
    \\USUTF8CodeUnitOffsetFromLineStart\DLE\SOH\DC2$\n\
    \ UTF16CodeUnitOffsetFromLineStart\DLE\STX\DC2$\n\
    \ UTF32CodeUnitOffsetFromLineStart\DLE\ETX*\148\SOH\n\
    \\n\
    \SymbolRole\DC2\EM\n\
    \\NAKUnspecifiedSymbolRole\DLE\NUL\DC2\SO\n\
    \\n\
    \Definition\DLE\SOH\DC2\n\
    \\n\
    \\ACKImport\DLE\STX\DC2\SI\n\
    \\vWriteAccess\DLE\EOT\DC2\SO\n\
    \\n\
    \ReadAccess\DLE\b\DC2\r\n\
    \\tGenerated\DLE\DLE\DC2\b\n\
    \\EOTTest\DLE \DC2\NAK\n\
    \\DC1ForwardDefinition\DLE@*\234\ACK\n\
    \\n\
    \SyntaxKind\DC2\EM\n\
    \\NAKUnspecifiedSyntaxKind\DLE\NUL\DC2\v\n\
    \\aComment\DLE\SOH\DC2\CAN\n\
    \\DC4PunctuationDelimiter\DLE\STX\DC2\SYN\n\
    \\DC2PunctuationBracket\DLE\ETX\DC2\v\n\
    \\aKeyword\DLE\EOT\DC2\EM\n\
    \\DC1IdentifierKeyword\DLE\EOT\SUB\STX\b\SOH\DC2\SYN\n\
    \\DC2IdentifierOperator\DLE\ENQ\DC2\SO\n\
    \\n\
    \Identifier\DLE\ACK\DC2\NAK\n\
    \\DC1IdentifierBuiltin\DLE\a\DC2\DC2\n\
    \\SOIdentifierNull\DLE\b\DC2\SYN\n\
    \\DC2IdentifierConstant\DLE\t\DC2\ESC\n\
    \\ETBIdentifierMutableGlobal\DLE\n\
    \\DC2\ETB\n\
    \\DC3IdentifierParameter\DLE\v\DC2\DC3\n\
    \\SIIdentifierLocal\DLE\f\DC2\SYN\n\
    \\DC2IdentifierShadowed\DLE\r\DC2\ETB\n\
    \\DC3IdentifierNamespace\DLE\SO\DC2\CAN\n\
    \\DLEIdentifierModule\DLE\SO\SUB\STX\b\SOH\DC2\SYN\n\
    \\DC2IdentifierFunction\DLE\SI\DC2 \n\
    \\FSIdentifierFunctionDefinition\DLE\DLE\DC2\DC3\n\
    \\SIIdentifierMacro\DLE\DC1\DC2\GS\n\
    \\EMIdentifierMacroDefinition\DLE\DC2\DC2\DC2\n\
    \\SOIdentifierType\DLE\DC3\DC2\EM\n\
    \\NAKIdentifierBuiltinType\DLE\DC4\DC2\ETB\n\
    \\DC3IdentifierAttribute\DLE\NAK\DC2\SI\n\
    \\vRegexEscape\DLE\SYN\DC2\DC1\n\
    \\rRegexRepeated\DLE\ETB\DC2\DC1\n\
    \\rRegexWildcard\DLE\CAN\DC2\DC2\n\
    \\SORegexDelimiter\DLE\EM\DC2\r\n\
    \\tRegexJoin\DLE\SUB\DC2\DC1\n\
    \\rStringLiteral\DLE\ESC\DC2\ETB\n\
    \\DC3StringLiteralEscape\DLE\FS\DC2\CAN\n\
    \\DC4StringLiteralSpecial\DLE\GS\DC2\DC4\n\
    \\DLEStringLiteralKey\DLE\RS\DC2\DC4\n\
    \\DLECharacterLiteral\DLE\US\DC2\DC2\n\
    \\SONumericLiteral\DLE \DC2\DC2\n\
    \\SOBooleanLiteral\DLE!\DC2\a\n\
    \\ETXTag\DLE\"\DC2\DLE\n\
    \\fTagAttribute\DLE#\DC2\DLE\n\
    \\fTagDelimiter\DLE$\SUB\STX\DLE\SOH*V\n\
    \\bSeverity\DC2\ETB\n\
    \\DC3UnspecifiedSeverity\DLE\NUL\DC2\t\n\
    \\ENQError\DLE\SOH\DC2\v\n\
    \\aWarning\DLE\STX\DC2\SI\n\
    \\vInformation\DLE\ETX\DC2\b\n\
    \\EOTHint\DLE\EOT*N\n\
    \\rDiagnosticTag\DC2\FS\n\
    \\CANUnspecifiedDiagnosticTag\DLE\NUL\DC2\SI\n\
    \\vUnnecessary\DLE\SOH\DC2\SO\n\
    \\n\
    \Deprecated\DLE\STX*\155\n\
    \\n\
    \\bLanguage\DC2\ETB\n\
    \\DC3UnspecifiedLanguage\DLE\NUL\DC2\b\n\
    \\EOTABAP\DLE<\DC2\b\n\
    \\EOTApex\DLE`\DC2\a\n\
    \\ETXAPL\DLE1\DC2\a\n\
    \\ETXAda\DLE'\DC2\b\n\
    \\EOTAgda\DLE-\DC2\f\n\
    \\bAsciiDoc\DLEV\DC2\f\n\
    \\bAssembly\DLE:\DC2\a\n\
    \\ETXAwk\DLEB\DC2\a\n\
    \\ETXBat\DLED\DC2\n\
    \\n\
    \\ACKBibTeX\DLEQ\DC2\ENQ\n\
    \\SOHC\DLE\"\DC2\t\n\
    \\ENQCOBOL\DLE;\DC2\a\n\
    \\ETXCPP\DLE#\DC2\a\n\
    \\ETXCSS\DLE\SUB\DC2\n\
    \\n\
    \\ACKCSharp\DLE\SOH\DC2\v\n\
    \\aClojure\DLE\b\DC2\DLE\n\
    \\fCoffeescript\DLE\NAK\DC2\SO\n\
    \\n\
    \CommonLisp\DLE\t\DC2\a\n\
    \\ETXCoq\DLE/\DC2\b\n\
    \\EOTCUDA\DLEa\DC2\b\n\
    \\EOTDart\DLE\ETX\DC2\n\
    \\n\
    \\ACKDelphi\DLE9\DC2\b\n\
    \\EOTDiff\DLEX\DC2\SO\n\
    \\n\
    \Dockerfile\DLEP\DC2\n\
    \\n\
    \\ACKDyalog\DLE2\DC2\n\
    \\n\
    \\ACKElixir\DLE\DC1\DC2\n\
    \\n\
    \\ACKErlang\DLE\DC2\DC2\n\
    \\n\
    \\ACKFSharp\DLE*\DC2\b\n\
    \\EOTFish\DLEA\DC2\b\n\
    \\EOTFlow\DLE\CAN\DC2\v\n\
    \\aFortran\DLE8\DC2\SO\n\
    \\n\
    \Git_Commit\DLE[\DC2\SO\n\
    \\n\
    \Git_Config\DLEY\DC2\SO\n\
    \\n\
    \Git_Rebase\DLE\\\DC2\ACK\n\
    \\STXGo\DLE!\DC2\v\n\
    \\aGraphQL\DLEb\DC2\n\
    \\n\
    \\ACKGroovy\DLE\a\DC2\b\n\
    \\EOTHTML\DLE\RS\DC2\b\n\
    \\EOTHack\DLE\DC4\DC2\SO\n\
    \\n\
    \Handlebars\DLEZ\DC2\v\n\
    \\aHaskell\DLE,\DC2\t\n\
    \\ENQIdris\DLE.\DC2\a\n\
    \\ETXIni\DLEH\DC2\ENQ\n\
    \\SOHJ\DLE3\DC2\b\n\
    \\EOTJSON\DLEK\DC2\b\n\
    \\EOTJava\DLE\ACK\DC2\SO\n\
    \\n\
    \JavaScript\DLE\SYN\DC2\DC3\n\
    \\SIJavaScriptReact\DLE]\DC2\v\n\
    \\aJsonnet\DLEL\DC2\t\n\
    \\ENQJulia\DLE7\DC2\f\n\
    \\bJustfile\DLEm\DC2\n\
    \\n\
    \\ACKKotlin\DLE\EOT\DC2\t\n\
    \\ENQLaTeX\DLES\DC2\b\n\
    \\EOTLean\DLE0\DC2\b\n\
    \\EOTLess\DLE\ESC\DC2\a\n\
    \\ETXLua\DLE\f\DC2\b\n\
    \\EOTLuau\DLEl\DC2\f\n\
    \\bMakefile\DLEO\DC2\f\n\
    \\bMarkdown\DLET\DC2\n\
    \\n\
    \\ACKMatlab\DLE4\DC2\n\
    \\n\
    \\ACKNickel\DLEn\DC2\a\n\
    \\ETXNix\DLEM\DC2\t\n\
    \\ENQOCaml\DLE)\DC2\SI\n\
    \\vObjective_C\DLE$\DC2\DC1\n\
    \\rObjective_CPP\DLE%\DC2\n\
    \\n\
    \\ACKPascal\DLEc\DC2\a\n\
    \\ETXPHP\DLE\DC3\DC2\t\n\
    \\ENQPLSQL\DLEF\DC2\b\n\
    \\EOTPerl\DLE\r\DC2\SO\n\
    \\n\
    \PowerShell\DLEC\DC2\n\
    \\n\
    \\ACKProlog\DLEG\DC2\f\n\
    \\bProtobuf\DLEd\DC2\n\
    \\n\
    \\ACKPython\DLE\SI\DC2\ENQ\n\
    \\SOHR\DLE6\DC2\n\
    \\n\
    \\ACKRacket\DLE\v\DC2\b\n\
    \\EOTRaku\DLE\SO\DC2\t\n\
    \\ENQRazor\DLE>\DC2\t\n\
    \\ENQRepro\DLEf\DC2\b\n\
    \\EOTReST\DLEU\DC2\b\n\
    \\EOTRuby\DLE\DLE\DC2\b\n\
    \\EOTRust\DLE(\DC2\a\n\
    \\ETXSAS\DLE=\DC2\b\n\
    \\EOTSCSS\DLE\GS\DC2\a\n\
    \\ETXSML\DLE+\DC2\a\n\
    \\ETXSQL\DLEE\DC2\b\n\
    \\EOTSass\DLE\FS\DC2\t\n\
    \\ENQScala\DLE\ENQ\DC2\n\
    \\n\
    \\ACKScheme\DLE\n\
    \\DC2\SI\n\
    \\vShellScript\DLE@\DC2\v\n\
    \\aSkylark\DLEN\DC2\t\n\
    \\ENQSlang\DLEk\DC2\f\n\
    \\bSolidity\DLE_\DC2\n\
    \\n\
    \\ACKSvelte\DLEj\DC2\t\n\
    \\ENQSwift\DLE\STX\DC2\a\n\
    \\ETXTcl\DLEe\DC2\b\n\
    \\EOTTOML\DLEI\DC2\a\n\
    \\ETXTeX\DLER\DC2\n\
    \\n\
    \\ACKThrift\DLEg\DC2\SO\n\
    \\n\
    \TypeScript\DLE\ETB\DC2\DC3\n\
    \\SITypeScriptReact\DLE^\DC2\v\n\
    \\aVerilog\DLEh\DC2\b\n\
    \\EOTVHDL\DLEi\DC2\SI\n\
    \\vVisualBasic\DLE?\DC2\a\n\
    \\ETXVue\DLE\EM\DC2\v\n\
    \\aWolfram\DLE5\DC2\a\n\
    \\ETXXML\DLE\US\DC2\a\n\
    \\ETXXSL\DLE \DC2\b\n\
    \\EOTYAML\DLEJ\DC2\a\n\
    \\ETXZig\DLE&B/Z-github.com/sourcegraph/scip/bindings/go/scip/J\134\235\STX\n\
    \\a\DC2\ENQ\n\
    \\NUL\184\b\SOH\n\
    \\130\EOT\n\
    \\SOH\f\DC2\ETX\n\
    \\NUL\DC22\247\ETX An index contains one or more pieces of information about a given piece of\n\
    \ source code or software artifact. Complementary information can be merged\n\
    \ together from multiple sources to provide a unified code intelligence\n\
    \ experience.\n\
    \\n\
    \ Programs producing a file of this format is an \"indexer\" and may operate\n\
    \ somewhere on the spectrum between precision, such as indexes produced by\n\
    \ compiler-backed indexers, and heurstics, such as indexes produced by local\n\
    \ syntax-directed analysis for scope rules.\n\
    \\n\
    \\b\n\
    \\SOH\STX\DC2\ETX\f\NUL\r\n\
    \\b\n\
    \\SOH\b\DC2\ETX\SO\NULD\n\
    \\t\n\
    \\STX\b\v\DC2\ETX\SO\NULD\n\
    \\208\ETX\n\
    \\STX\EOT\NUL\DC2\EOT\SYN\NUL#\SOH\SUB\195\ETX Index represents a complete SCIP index for a workspace this is rooted at a\n\
    \ single directory. An Index message payload can have a large memory footprint\n\
    \ and it's therefore recommended to emit and consume an Index payload one field\n\
    \ value at a time. To permit streaming consumption of an Index payload, the\n\
    \ `metadata` field must appear at the start of the stream and must only appear\n\
    \ once in the stream. Other field values may appear in any order.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\NUL\SOH\DC2\ETX\SYN\b\r\n\
    \)\n\
    \\EOT\EOT\NUL\STX\NUL\DC2\ETX\CAN\STX\CAN\SUB\FS Metadata about this index.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ACK\DC2\ETX\CAN\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\SOH\DC2\ETX\CAN\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\NUL\ETX\DC2\ETX\CAN\SYN\ETB\n\
    \3\n\
    \\EOT\EOT\NUL\STX\SOH\DC2\ETX\SUB\STX\"\SUB& Documents that belong to this index.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\EOT\DC2\ETX\SUB\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ACK\DC2\ETX\SUB\v\DC3\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\SOH\DC2\ETX\SUB\DC4\GS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\SOH\ETX\DC2\ETX\SUB !\n\
    \\246\ETX\n\
    \\EOT\EOT\NUL\STX\STX\DC2\ETX \STX2\SUB\233\STX (optional) Symbols that are referenced from this index but are defined in\n\
    \ an external package (a separate `Index` message). Leave this field empty\n\
    \ if you assume the external package will get indexed separately. If the\n\
    \ external package won't get indexed for some reason then you can use this\n\
    \ field to provide hover documentation for those external symbols.\n\
    \\"} IMPORTANT: When adding a new field to `Index` here, add a matching\n\
    \ function in `IndexVisitor` and update `ParseStreaming`.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\EOT\DC2\ETX \STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ACK\DC2\ETX \v\FS\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\SOH\DC2\ETX \GS-\n\
    \\f\n\
    \\ENQ\EOT\NUL\STX\STX\ETX\DC2\ETX 01\n\
    \\n\
    \\n\
    \\STX\EOT\SOH\DC2\EOT%\NUL2\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\SOH\SOH\DC2\ETX%\b\DLE\n\
    \N\n\
    \\EOT\EOT\SOH\STX\NUL\DC2\ETX'\STX\RS\SUBA Which version of this protocol was used to generate this index?\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ACK\DC2\ETX'\STX\DC1\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\SOH\DC2\ETX'\DC2\EM\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\NUL\ETX\DC2\ETX'\FS\GS\n\
    \C\n\
    \\EOT\EOT\SOH\STX\SOH\DC2\ETX)\STX\EM\SUB6 Information about the tool that produced this index.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ACK\DC2\ETX)\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\SOH\DC2\ETX)\v\DC4\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\SOH\ETX\DC2\ETX)\ETB\CAN\n\
    \\162\SOH\n\
    \\EOT\EOT\SOH\STX\STX\DC2\ETX-\STX\SUB\SUB\148\SOH URI-encoded absolute path to the root directory of this index. All\n\
    \ documents in this index must appear in a subdirectory of this root\n\
    \ directory.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ENQ\DC2\ETX-\STX\b\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\SOH\DC2\ETX-\t\NAK\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\STX\ETX\DC2\ETX-\CAN\EM\n\
    \\224\SOH\n\
    \\EOT\EOT\SOH\STX\ETX\DC2\ETX1\STX*\SUB\210\SOH Text encoding of the source files on disk that are referenced from\n\
    \ `Document.relative_path`. This value is unrelated to the `Document.text`\n\
    \ field, which is a Protobuf string and hence must be UTF-8 encoded.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ACK\DC2\ETX1\STX\SO\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\SOH\DC2\ETX1\SI%\n\
    \\f\n\
    \\ENQ\EOT\SOH\STX\ETX\ETX\DC2\ETX1()\n\
    \\n\
    \\n\
    \\STX\ENQ\NUL\DC2\EOT4\NUL6\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\NUL\SOH\DC2\ETX4\ENQ\DC4\n\
    \\v\n\
    \\EOT\ENQ\NUL\STX\NUL\DC2\ETX5\STX!\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\SOH\DC2\ETX5\STX\FS\n\
    \\f\n\
    \\ENQ\ENQ\NUL\STX\NUL\STX\DC2\ETX5\US \n\
    \\n\
    \\n\
    \\STX\ENQ\SOH\DC2\EOT8\NUL<\SOH\n\
    \\n\
    \\n\
    \\ETX\ENQ\SOH\SOH\DC2\ETX8\ENQ\DC1\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\NUL\DC2\ETX9\STX\RS\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\SOH\DC2\ETX9\STX\EM\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\NUL\STX\DC2\ETX9\FS\GS\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\SOH\DC2\ETX:\STX\v\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\SOH\DC2\ETX:\STX\ACK\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\SOH\STX\DC2\ETX:\t\n\
    \\n\
    \\v\n\
    \\EOT\ENQ\SOH\STX\STX\DC2\ETX;\STX\f\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\STX\SOH\DC2\ETX;\STX\a\n\
    \\f\n\
    \\ENQ\ENQ\SOH\STX\STX\STX\DC2\ETX;\n\
    \\v\n\
    \\n\
    \\n\
    \\STX\EOT\STX\DC2\EOT>\NULE\SOH\n\
    \\n\
    \\n\
    \\ETX\EOT\STX\SOH\DC2\ETX>\b\DLE\n\
    \<\n\
    \\EOT\EOT\STX\STX\NUL\DC2\ETX@\STX\DC2\SUB/ Name of the indexer that produced this index.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ENQ\DC2\ETX@\STX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\SOH\DC2\ETX@\t\r\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\NUL\ETX\DC2\ETX@\DLE\DC1\n\
    \?\n\
    \\EOT\EOT\STX\STX\SOH\DC2\ETXB\STX\NAK\SUB2 Version of the indexer that produced this index.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ENQ\DC2\ETXB\STX\b\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\SOH\DC2\ETXB\t\DLE\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\SOH\ETX\DC2\ETXB\DC3\DC4\n\
    \L\n\
    \\EOT\EOT\STX\STX\STX\DC2\ETXD\STX \SUB? Command-line arguments that were used to invoke this indexer.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\EOT\DC2\ETXD\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ENQ\DC2\ETXD\v\DC1\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\SOH\DC2\ETXD\DC2\ESC\n\
    \\f\n\
    \\ENQ\EOT\STX\STX\STX\ETX\DC2\ETXD\RS\US\n\
    \H\n\
    \\STX\EOT\ETX\DC2\EOTH\NULu\SOH\SUB< Document defines the metadata about a source file on disk.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\EOT\ETX\SOH\DC2\ETXH\b\DLE\n\
    \\165\STX\n\
    \\EOT\EOT\ETX\STX\NUL\DC2\ETXM\STX\SYN\SUB\151\STX The string ID for the programming language this file is written in.\n\
    \ The `Language` enum contains the names of most common programming languages.\n\
    \ This field is typed as a string to permit any programming language, including\n\
    \ ones that are not specified by the `Language` enum.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ENQ\DC2\ETXM\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\SOH\DC2\ETXM\t\DC1\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\NUL\ETX\DC2\ETXM\DC4\NAK\n\
    \\181\ETX\n\
    \\EOT\EOT\ETX\STX\SOH\DC2\ETXW\STX\ESC\SUB\167\ETX (Required) Unique path to the text document.\n\
    \\n\
    \ 1. The path must be relative to the directory supplied in the associated\n\
    \    `Metadata.project_root`.\n\
    \ 2. The path must not begin with a leading '/'.\n\
    \ 3. The path must point to a regular file, not a symbolic link.\n\
    \ 4. The path must use '/' as the separator, including on Windows.\n\
    \ 5. The path must be canonical; it cannot include empty components ('//'),\n\
    \    or '.' or '..'.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ENQ\DC2\ETXW\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\SOH\DC2\ETXW\t\SYN\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\SOH\ETX\DC2\ETXW\EM\SUB\n\
    \4\n\
    \\EOT\EOT\ETX\STX\STX\DC2\ETXY\STX&\SUB' Occurrences that appear in this file.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\EOT\DC2\ETXY\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\ACK\DC2\ETXY\v\NAK\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\SOH\DC2\ETXY\SYN!\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\STX\ETX\DC2\ETXY$%\n\
    \\234\SOH\n\
    \\EOT\EOT\ETX\STX\ETX\DC2\ETX_\STX)\SUB\220\SOH Symbols that are \"defined\" within this document.\n\
    \\n\
    \ This should include symbols which technically do not have any definition,\n\
    \ but have a reference and are defined by some other symbol (see\n\
    \ Relationship.is_definition).\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\EOT\DC2\ETX_\STX\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\ACK\DC2\ETX_\v\FS\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\SOH\DC2\ETX_\GS$\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ETX\ETX\DC2\ETX_'(\n\
    \\247\ETX\n\
    \\EOT\EOT\ETX\STX\EOT\DC2\ETXh\STX\DC2\SUB\233\ETX (optional) Text contents of the this document. Indexers are not expected to\n\
    \ include the text by default. It's preferrable that clients read the text\n\
    \ contents from the file system by resolving the absolute path from joining\n\
    \ `Index.metadata.project_root` and `Document.relative_path`. This field was\n\
    \ introduced to support `SymbolInformation.signature_documentation`, but it\n\
    \ can be used for other purposes as well, for example testing or when working\n\
    \ with virtual/in-memory documents.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\EOT\ENQ\DC2\ETXh\STX\b\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\EOT\SOH\DC2\ETXh\t\r\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\EOT\ETX\DC2\ETXh\DLE\DC1\n\
    \\231\ETX\n\
    \\EOT\EOT\ETX\STX\ENQ\DC2\ETXt\STX)\SUB\217\ETX Specifies the encoding used for source ranges in this Document.\n\
    \\n\
    \ Usually, this will match the type used to index the string type\n\
    \ in the indexer's implementation language in O(1) time.\n\
    \ - For an indexer implemented in JVM/.NET language or JavaScript/TypeScript,\n\
    \   use UTF16CodeUnitOffsetFromLineStart.\n\
    \ - For an indexer implemented in Python,\n\
    \   use UTF32CodeUnitOffsetFromLineStart.\n\
    \ - For an indexer implemented in Go, Rust or C++,\n\
    \   use UTF8ByteOffsetFromLineStart.\n\
    \\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ENQ\ACK\DC2\ETXt\STX\DC2\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ENQ\SOH\DC2\ETXt\DC3$\n\
    \\f\n\
    \\ENQ\EOT\ETX\STX\ENQ\ETX\DC2\ETXt'(\n\
    \Q\n\
    \\STX\ENQ\STX\DC2\ENQx\NUL\144\SOH\SOH\SUBD Encoding used to interpret the 'character' value in source ranges.\n\
    \\n\
    \\n\
    \\n\
    \\ETX\ENQ\STX\SOH\DC2\ETXx\ENQ\NAK\n\
    \\147\SOH\n\
    \\EOT\ENQ\STX\STX\NUL\DC2\ETX{\STX\"\SUB\133\SOH Default value. This value should not be used by new SCIP indexers\n\
    \ so that a consumer can process the SCIP index without ambiguity.\n\
    \\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\NUL\SOH\DC2\ETX{\STX\GS\n\
    \\f\n\
    \\ENQ\ENQ\STX\STX\NUL\STX\DC2\ETX{ !\n\
    \\248\SOH\n\
    \\EOT\ENQ\STX\STX\SOH\DC2\EOT\130\SOH\STX&\SUB\233\SOH The 'character' value is interpreted as an offset in terms\n\
    \ of UTF-8 code units (i.e. bytes).\n\
    \\n\
    \ Example: For the string \"\240\159\154\128 Woo\" in UTF-8, the bytes are \n\
    \ [240, 159, 154, 128, 32, 87, 111, 111], so the offset for 'W'\n\
    \ would be 5.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\SOH\SOH\DC2\EOT\130\SOH\STX!\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\SOH\STX\DC2\EOT\130\SOH$%\n\
    \\130\STX\n\
    \\EOT\ENQ\STX\STX\STX\DC2\EOT\137\SOH\STX'\SUB\243\SOH The 'character' value is interpreted as an offset in terms\n\
    \ of UTF-16 code units (each is 2 bytes).\n\
    \\n\
    \ Example: For the string \"\240\159\154\128 Woo\", the UTF-16 code units are\n\
    \ ['\\ud83d', '\\ude80', ' ', 'W', 'o', 'o'], so the offset for 'W'\n\
    \ would be 3.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\STX\SOH\DC2\EOT\137\SOH\STX\"\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\STX\STX\DC2\EOT\137\SOH%&\n\
    \\245\SOH\n\
    \\EOT\ENQ\STX\STX\ETX\DC2\EOT\143\SOH\STX'\SUB\230\SOH The 'character' value is interpreted as an offset in terms\n\
    \ of UTF-32 code units (each is 4 bytes).\n\
    \\n\
    \ Example: For the string \"\240\159\154\128 Woo\", the UTF-32 code units are\n\
    \ ['\240\159\154\128', ' ', 'W', 'o', 'o'], so the offset for 'W' would be 2.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\ETX\SOH\DC2\EOT\143\SOH\STX\"\n\
    \\r\n\
    \\ENQ\ENQ\STX\STX\ETX\STX\DC2\EOT\143\SOH%&\n\
    \\164\DC1\n\
    \\STX\EOT\EOT\DC2\ACK\187\SOH\NUL\191\SOH\SOH\SUB\149\DC1 Symbol is similar to a URI, it identifies a class, method, or a local\n\
    \ variable. `SymbolInformation` contains rich metadata about symbols such as\n\
    \ the docstring.\n\
    \\n\
    \ Symbol has a standardized string representation, which can be used\n\
    \ interchangeably with `Symbol`. The syntax for Symbol is the following:\n\
    \ ```\n\
    \ # (<x>)+ stands for one or more repetitions of <x>\n\
    \ <symbol>               ::= <scheme> ' ' <package> ' ' (<descriptor>)+ | 'local ' <local-id>\n\
    \ <package>              ::= <manager> ' ' <package-name> ' ' <version>\n\
    \ <scheme>               ::= any UTF-8, escape spaces with double space.\n\
    \ <manager>              ::= same as above, use the placeholder '.' to indicate an empty value\n\
    \ <package-name>         ::= same as above\n\
    \ <version>              ::= same as above\n\
    \ <descriptor>           ::= <namespace> | <type> | <term> | <method> | <type-parameter> | <parameter> | <meta> | <macro>\n\
    \ <namespace>            ::= <name> '/'\n\
    \ <type>                 ::= <name> '#'\n\
    \ <term>                 ::= <name> '.'\n\
    \ <meta>                 ::= <name> ':'\n\
    \ <macro>                ::= <name> '!'\n\
    \ <method>               ::= <name> '(' <method-disambiguator> ').'\n\
    \ <type-parameter>       ::= '[' <name> ']'\n\
    \ <parameter>            ::= '(' <name> ')'\n\
    \ <name>                 ::= <identifier>\n\
    \ <method-disambiguator> ::= <simple-identifier>\n\
    \ <identifier>           ::= <simple-identifier> | <escaped-identifier>\n\
    \ <simple-identifier>    ::= (<identifier-character>)+\n\
    \ <identifier-character> ::= '_' | '+' | '-' | '$' | ASCII letter or digit\n\
    \ <escaped-identifier>   ::= '`' (<escaped-character>)+ '`'\n\
    \ <escaped-characters>   ::= any UTF-8 character, escape backticks with double backtick.\n\
    \ <local-id>             ::= <simple-identifier>\n\
    \ ```\n\
    \\n\
    \ The list of descriptors for a symbol should together form a fully\n\
    \ qualified name for the symbol. That is, it should serve as a unique\n\
    \ identifier across the package. Typically, it will include one descriptor\n\
    \ for every node in the AST (along the ancestry path) between the root of\n\
    \ the file and the node corresponding to the symbol.\n\
    \\n\
    \ Local symbols MUST only be used for entities which are local to a Document,\n\
    \ and cannot be accessed from outside the Document.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\EOT\SOH\DC2\EOT\187\SOH\b\SO\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\NUL\DC2\EOT\188\SOH\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ENQ\DC2\EOT\188\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\SOH\DC2\EOT\188\SOH\t\SI\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\NUL\ETX\DC2\EOT\188\SOH\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\SOH\DC2\EOT\189\SOH\STX\SYN\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ACK\DC2\EOT\189\SOH\STX\t\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\SOH\DC2\EOT\189\SOH\n\
    \\DC1\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\SOH\ETX\DC2\EOT\189\SOH\DC4\NAK\n\
    \\f\n\
    \\EOT\EOT\EOT\STX\STX\DC2\EOT\190\SOH\STX&\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\EOT\DC2\EOT\190\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ACK\DC2\EOT\190\SOH\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\SOH\DC2\EOT\190\SOH\SYN!\n\
    \\r\n\
    \\ENQ\EOT\EOT\STX\STX\ETX\DC2\EOT\190\SOH$%\n\
    \q\n\
    \\STX\EOT\ENQ\DC2\ACK\196\SOH\NUL\200\SOH\SOH\SUBc Unit of packaging and distribution.\n\
    \\n\
    \ NOTE: This corresponds to a module in Go and JVM languages.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\ENQ\SOH\DC2\EOT\196\SOH\b\SI\n\
    \\f\n\
    \\EOT\EOT\ENQ\STX\NUL\DC2\EOT\197\SOH\STX\NAK\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ENQ\DC2\EOT\197\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\SOH\DC2\EOT\197\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\NUL\ETX\DC2\EOT\197\SOH\DC3\DC4\n\
    \\f\n\
    \\EOT\EOT\ENQ\STX\SOH\DC2\EOT\198\SOH\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ENQ\DC2\EOT\198\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\SOH\DC2\EOT\198\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\SOH\ETX\DC2\EOT\198\SOH\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\ENQ\STX\STX\DC2\EOT\199\SOH\STX\NAK\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\ENQ\DC2\EOT\199\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\SOH\DC2\EOT\199\SOH\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\ENQ\STX\STX\ETX\DC2\EOT\199\SOH\DC3\DC4\n\
    \\f\n\
    \\STX\EOT\ACK\DC2\ACK\202\SOH\NUL\225\SOH\SOH\n\
    \\v\n\
    \\ETX\EOT\ACK\SOH\DC2\EOT\202\SOH\b\DC2\n\
    \\SO\n\
    \\EOT\EOT\ACK\EOT\NUL\DC2\ACK\203\SOH\STX\221\SOH\ETX\n\
    \\r\n\
    \\ENQ\EOT\ACK\EOT\NUL\SOH\DC2\EOT\203\SOH\a\r\n\
    \\r\n\
    \\ENQ\EOT\ACK\EOT\NUL\ETX\DC2\EOT\204\SOH\EOT\RS\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\ETX\STX\DC2\EOT\204\SOH\EOT\RS\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\NUL\DC2\EOT\205\SOH\EOT\SUB\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\NUL\SOH\DC2\EOT\205\SOH\EOT\NAK\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\NUL\STX\DC2\EOT\205\SOH\CAN\EM\n\
    \}\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\SOH\DC2\EOT\209\SOH\EOT\DC2\SUBm Unit of code abstraction and/or namespacing.\n\
    \\n\
    \ NOTE: This corresponds to a package in Go and JVM languages.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\SOH\SOH\DC2\EOT\209\SOH\EOT\r\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\SOH\STX\DC2\EOT\209\SOH\DLE\DC1\n\
    \(\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\STX\DC2\EOT\211\SOH\EOT\"\SUB\CAN Use Namespace instead.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\STX\SOH\DC2\EOT\211\SOH\EOT\v\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\STX\STX\DC2\EOT\211\SOH\SO\SI\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\STX\ETX\DC2\EOT\211\SOH\DLE!\n\
    \\DLE\n\
    \\b\EOT\ACK\EOT\NUL\STX\STX\ETX\SOH\DC2\EOT\211\SOH\DC1 \n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\ETX\DC2\EOT\212\SOH\EOT\r\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\ETX\SOH\DC2\EOT\212\SOH\EOT\b\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\ETX\STX\DC2\EOT\212\SOH\v\f\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\EOT\DC2\EOT\213\SOH\EOT\r\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\EOT\SOH\DC2\EOT\213\SOH\EOT\b\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\EOT\STX\DC2\EOT\213\SOH\v\f\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\ENQ\DC2\EOT\214\SOH\EOT\SI\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\ENQ\SOH\DC2\EOT\214\SOH\EOT\n\
    \\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\ENQ\STX\DC2\EOT\214\SOH\r\SO\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\ACK\DC2\EOT\215\SOH\EOT\SYN\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\ACK\SOH\DC2\EOT\215\SOH\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\ACK\STX\DC2\EOT\215\SOH\DC4\NAK\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\a\DC2\EOT\216\SOH\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\a\SOH\DC2\EOT\216\SOH\EOT\r\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\a\STX\DC2\EOT\216\SOH\DLE\DC1\n\
    \.\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\b\DC2\EOT\218\SOH\EOT\r\SUB\RS Can be used for any purpose.\n\
    \\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\b\SOH\DC2\EOT\218\SOH\EOT\b\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\b\STX\DC2\EOT\218\SOH\v\f\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\t\DC2\EOT\219\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\t\SOH\DC2\EOT\219\SOH\EOT\t\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\t\STX\DC2\EOT\219\SOH\f\r\n\
    \\SO\n\
    \\ACK\EOT\ACK\EOT\NUL\STX\n\
    \\DC2\EOT\220\SOH\EOT\SO\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\n\
    \\SOH\DC2\EOT\220\SOH\EOT\t\n\
    \\SI\n\
    \\a\EOT\ACK\EOT\NUL\STX\n\
    \\STX\DC2\EOT\220\SOH\f\r\n\
    \\f\n\
    \\EOT\EOT\ACK\STX\NUL\DC2\EOT\222\SOH\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ENQ\DC2\EOT\222\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\SOH\DC2\EOT\222\SOH\t\r\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\NUL\ETX\DC2\EOT\222\SOH\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\ACK\STX\SOH\DC2\EOT\223\SOH\STX\ESC\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ENQ\DC2\EOT\223\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\SOH\DC2\EOT\223\SOH\t\SYN\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\SOH\ETX\DC2\EOT\223\SOH\EM\SUB\n\
    \\f\n\
    \\EOT\EOT\ACK\STX\STX\DC2\EOT\224\SOH\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ACK\DC2\EOT\224\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\SOH\DC2\EOT\224\SOH\t\SI\n\
    \\r\n\
    \\ENQ\EOT\ACK\STX\STX\ETX\DC2\EOT\224\SOH\DC2\DC3\n\
    \\131\SOH\n\
    \\STX\EOT\a\DC2\ACK\229\SOH\NUL\180\ETX\SOH\SUBu SymbolInformation defines metadata about a symbol, such as the symbol's\n\
    \ docstring or what package it's defined it.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\a\SOH\DC2\EOT\229\SOH\b\EM\n\
    \\160\SOH\n\
    \\EOT\EOT\a\STX\NUL\DC2\EOT\232\SOH\STX\DC4\SUB\145\SOH Identifier of this symbol, which can be referenced from `Occurence.symbol`.\n\
    \ The string must be formatted according to the grammar in `Symbol`.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ENQ\DC2\EOT\232\SOH\STX\b\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\SOH\DC2\EOT\232\SOH\t\SI\n\
    \\r\n\
    \\ENQ\EOT\a\STX\NUL\ETX\DC2\EOT\232\SOH\DC2\DC3\n\
    \\180\ETX\n\
    \\EOT\EOT\a\STX\SOH\DC2\EOT\239\SOH\STX$\SUB\165\ETX (optional, but strongly recommended) The markdown-formatted documentation\n\
    \ for this symbol. Use `SymbolInformation.signature_documentation` to\n\
    \ document the method/class/type signature of this symbol.\n\
    \ Due to historical reasons, indexers may include signature documentation in\n\
    \ this field by rendering markdown code blocks. New indexers should only\n\
    \ include non-code documentation in this field, for example docstrings.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\EOT\DC2\EOT\239\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ENQ\DC2\EOT\239\SOH\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\SOH\DC2\EOT\239\SOH\DC2\US\n\
    \\r\n\
    \\ENQ\EOT\a\STX\SOH\ETX\DC2\EOT\239\SOH\"#\n\
    \^\n\
    \\EOT\EOT\a\STX\STX\DC2\EOT\241\SOH\STX*\SUBP (optional) Relationships to other symbols (e.g., implements, type definition).\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\EOT\DC2\EOT\241\SOH\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ACK\DC2\EOT\241\SOH\v\ETB\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\SOH\DC2\EOT\241\SOH\CAN%\n\
    \\r\n\
    \\ENQ\EOT\a\STX\STX\ETX\DC2\EOT\241\SOH()\n\
    \\164\SOH\n\
    \\EOT\EOT\a\STX\ETX\DC2\EOT\245\SOH\STX\DLE\SUB\149\SOH The kind of this symbol. Use this field instead of\n\
    \ `SymbolDescriptor.Suffix` to determine whether something is, for example, a\n\
    \ class or a method.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\ACK\DC2\EOT\245\SOH\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\SOH\DC2\EOT\245\SOH\a\v\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ETX\ETX\DC2\EOT\245\SOH\SO\SI\n\
    \\245\ENQ\n\
    \\EOT\EOT\a\EOT\NUL\DC2\ACK\132\STX\STX\141\ETX\ETX\SUB\228\ENQ (optional) Kind represents the fine-grained category of a symbol, suitable for presenting\n\
    \ information about the symbol's meaning in the language.\n\
    \\n\
    \ For example:\n\
    \ - A Java method would have the kind `Method` while a Go function would\n\
    \   have the kind `Function`, even if the symbols for these use the same\n\
    \   syntax for the descriptor `SymbolDescriptor.Suffix.Method`.\n\
    \ - A Go struct has the symbol kind `Struct` while a Java class has\n\
    \   the symbol kind `Class` even if they both have the same descriptor:\n\
    \   `SymbolDescriptor.Suffix.Type`.\n\
    \\n\
    \ Since Kind is more fine-grained than Suffix:\n\
    \ - If two symbols have the same Kind, they should share the same Suffix.\n\
    \ - If two symbols have different Suffixes, they should have different Kinds.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\EOT\NUL\SOH\DC2\EOT\132\STX\a\v\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\NUL\DC2\EOT\133\STX\ACK\SUB\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\NUL\SOH\DC2\EOT\133\STX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\NUL\STX\DC2\EOT\133\STX\CAN\EM\n\
    \R\n\
    \\ACK\EOT\a\EOT\NUL\STX\SOH\DC2\EOT\135\STX\ACK\SUB\SUBB A method which may or may not have a body. For Java, Kotlin etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SOH\SOH\DC2\EOT\135\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SOH\STX\DC2\EOT\135\STX\ETB\EM\n\
    \*\n\
    \\ACK\EOT\a\EOT\NUL\STX\STX\DC2\EOT\137\STX\ACK\DC4\SUB\SUB For Ruby's attr_accessor\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\STX\SOH\DC2\EOT\137\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\STX\STX\DC2\EOT\137\STX\DC1\DC3\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\ETX\DC2\EOT\138\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ETX\SOH\DC2\EOT\138\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ETX\STX\DC2\EOT\138\STX\SO\SI\n\
    \\ESC\n\
    \\ACK\EOT\a\EOT\NUL\STX\EOT\DC2\EOT\140\STX\ACK\DC4\SUB\v For Alloy\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\EOT\SOH\DC2\EOT\140\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\EOT\STX\DC2\EOT\140\STX\DC2\DC3\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\ENQ\DC2\EOT\141\STX\ACK\EM\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ENQ\SOH\DC2\EOT\141\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ENQ\STX\DC2\EOT\141\STX\ETB\CAN\n\
    \\EM\n\
    \\ACK\EOT\a\EOT\NUL\STX\ACK\DC2\EOT\143\STX\ACK\DC4\SUB\t For C++\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ACK\SOH\DC2\EOT\143\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ACK\STX\DC2\EOT\143\STX\DC2\DC3\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STX\a\DC2\EOT\145\STX\ACK\DLE\SUB\n\
    \ For Lean\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\a\SOH\DC2\EOT\145\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\a\STX\DC2\EOT\145\STX\SO\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\b\DC2\EOT\146\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\b\SOH\DC2\EOT\146\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\b\STX\DC2\EOT\146\STX\DLE\DC1\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\t\DC2\EOT\147\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\t\SOH\DC2\EOT\147\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\t\STX\DC2\EOT\147\STX\SO\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\n\
    \\DC2\EOT\148\STX\ACK\DC3\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\n\
    \\SOH\DC2\EOT\148\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\n\
    \\STX\DC2\EOT\148\STX\DC1\DC2\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\v\DC2\EOT\149\STX\ACK\SYN\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\v\SOH\DC2\EOT\149\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\v\STX\DC2\EOT\149\STX\DC4\NAK\n\
    \\RS\n\
    \\ACK\EOT\a\EOT\NUL\STX\f\DC2\EOT\151\STX\ACK\DC4\SUB\SO For Solidity\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\f\SOH\DC2\EOT\151\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\f\STX\DC2\EOT\151\STX\DC1\DC3\n\
    \\GS\n\
    \\ACK\EOT\a\EOT\NUL\STX\r\DC2\EOT\153\STX\ACK\SYN\SUB\r For Haskell\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\r\SOH\DC2\EOT\153\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\r\STX\DC2\EOT\153\STX\DC3\NAK\n\
    \\US\n\
    \\ACK\EOT\a\EOT\NUL\STX\SO\DC2\EOT\155\STX\ACK\DC4\SUB\SI For C# and F#\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SO\SOH\DC2\EOT\155\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SO\STX\DC2\EOT\155\STX\DC1\DC3\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\SI\DC2\EOT\156\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SI\SOH\DC2\EOT\156\STX\ACK\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SI\STX\DC2\EOT\156\STX\r\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\DLE\DC2\EOT\157\STX\ACK\SYN\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DLE\SOH\DC2\EOT\157\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DLE\STX\DC2\EOT\157\STX\DC3\NAK\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\DC1\DC2\EOT\158\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC1\SOH\DC2\EOT\158\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC1\STX\DC2\EOT\158\STX\SO\DLE\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\DC2\DC2\EOT\159\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC2\SOH\DC2\EOT\159\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC2\STX\DC2\EOT\159\STX\SO\DLE\n\
    \\ESC\n\
    \\ACK\EOT\a\EOT\NUL\STX\DC3\DC2\EOT\161\STX\ACK\DLE\SUB\v For Alloy\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC3\SOH\DC2\EOT\161\STX\ACK\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC3\STX\DC2\EOT\161\STX\r\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\DC4\DC2\EOT\162\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC4\SOH\DC2\EOT\162\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\DC4\STX\DC2\EOT\162\STX\SO\DLE\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\NAK\DC2\EOT\163\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\NAK\SOH\DC2\EOT\163\STX\ACK\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\NAK\STX\DC2\EOT\163\STX\r\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\SYN\DC2\EOT\164\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SYN\SOH\DC2\EOT\164\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SYN\STX\DC2\EOT\164\STX\DC1\DC3\n\
    \;\n\
    \\ACK\EOT\a\EOT\NUL\STX\ETB\DC2\EOT\166\STX\ACK\DC2\SUB+ For 'get' in Swift, 'attr_reader' in Ruby\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ETB\SOH\DC2\EOT\166\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ETB\STX\DC2\EOT\166\STX\SI\DC1\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STX\CAN\DC2\EOT\168\STX\ACK\DC3\SUB\n\
    \ For Raku\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\CAN\SOH\DC2\EOT\168\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\CAN\STX\DC2\EOT\168\STX\DLE\DC2\n\
    \)\n\
    \\ACK\EOT\a\EOT\NUL\STX\EM\DC2\EOT\170\STX\ACK\DC4\SUB\EM For Purescript and Lean\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\EM\SOH\DC2\EOT\170\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\EM\STX\DC2\EOT\170\STX\DC1\DC3\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\SUB\DC2\EOT\171\STX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SUB\SOH\DC2\EOT\171\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\SUB\STX\DC2\EOT\171\STX\DC2\DC4\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\ESC\DC2\EOT\172\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ESC\SOH\DC2\EOT\172\STX\ACK\t\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\ESC\STX\DC2\EOT\172\STX\f\SO\n\
    \\FS\n\
    \\ACK\EOT\a\EOT\NUL\STX\FS\DC2\EOT\174\STX\ACK\DLE\SUB\f For Racket\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\FS\SOH\DC2\EOT\174\STX\ACK\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\FS\STX\DC2\EOT\174\STX\r\SI\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STX\GS\DC2\EOT\176\STX\ACK\DC1\SUB\n\
    \ For Lean\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\GS\SOH\DC2\EOT\176\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\GS\STX\DC2\EOT\176\STX\SO\DLE\n\
    \\RS\n\
    \\ACK\EOT\a\EOT\NUL\STX\RS\DC2\EOT\178\STX\ACK\DC3\SUB\SO For solidity\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\RS\SOH\DC2\EOT\178\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\RS\STX\DC2\EOT\178\STX\DLE\DC2\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX\US\DC2\EOT\179\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\US\SOH\DC2\EOT\179\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\US\STX\DC2\EOT\179\STX\SO\DLE\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX \DC2\EOT\180\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX \SOH\DC2\EOT\180\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX \STX\DC2\EOT\180\STX\SI\DC1\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STX!\DC2\EOT\182\STX\ACK\ETB\SUB\n\
    \ For Ruby\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX!\SOH\DC2\EOT\182\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX!\STX\DC2\EOT\182\STX\DC4\SYN\n\
    \\148\SOH\n\
    \\ACK\EOT\a\EOT\NUL\STX\"\DC2\EOT\185\STX\ACK\SUB\SUB\131\SOH Analogous to 'ThisParameter' and 'SelfParameter', but for languages\n\
    \ like Go where the receiver doesn't have a conventional name.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\"\SOH\DC2\EOT\185\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX\"\STX\DC2\EOT\185\STX\ETB\EM\n\
    \8\n\
    \\ACK\EOT\a\EOT\NUL\STX#\DC2\EOT\187\STX\ACK\US\SUB( Analogous to 'AbstractMethod', for Go.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX#\SOH\DC2\EOT\187\STX\ACK\EM\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX#\STX\DC2\EOT\187\STX\FS\RS\n\
    \\RS\n\
    \\ACK\EOT\a\EOT\NUL\STX$\DC2\EOT\189\STX\ACK\DC3\SUB\SO For Protobuf\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX$\SOH\DC2\EOT\189\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX$\STX\DC2\EOT\189\STX\DLE\DC2\n\
    \\RS\n\
    \\ACK\EOT\a\EOT\NUL\STX%\DC2\EOT\191\STX\ACK\DC4\SUB\SO For Solidity\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX%\SOH\DC2\EOT\191\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX%\STX\DC2\EOT\191\STX\DC1\DC3\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX&\DC2\EOT\192\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX&\SOH\DC2\EOT\192\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX&\STX\DC2\EOT\192\STX\SI\DC1\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX'\DC2\EOT\193\STX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX'\SOH\DC2\EOT\193\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX'\STX\DC2\EOT\193\STX\DC2\DC4\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX(\DC2\EOT\194\STX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX(\SOH\DC2\EOT\194\STX\ACK\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX(\STX\DC2\EOT\194\STX\r\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX)\DC2\EOT\195\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX)\SOH\DC2\EOT\195\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX)\STX\DC2\EOT\195\STX\SI\DC1\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX*\DC2\EOT\196\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX*\SOH\DC2\EOT\196\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX*\STX\DC2\EOT\196\STX\SI\DC1\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX+\DC2\EOT\197\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX+\SOH\DC2\EOT\197\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX+\STX\DC2\EOT\197\STX\DC1\DC3\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX,\DC2\EOT\198\STX\ACK\DC3\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX,\SOH\DC2\EOT\198\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX,\STX\DC2\EOT\198\STX\DLE\DC2\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX-\DC2\EOT\199\STX\ACK\EM\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX-\SOH\DC2\EOT\199\STX\ACK\DC3\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX-\STX\DC2\EOT\199\STX\SYN\CAN\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX.\DC2\EOT\200\STX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX.\SOH\DC2\EOT\200\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX.\STX\DC2\EOT\200\STX\DC2\DC4\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX/\DC2\EOT\201\STX\ACK\SUB\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX/\SOH\DC2\EOT\201\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX/\STX\DC2\EOT\201\STX\ETB\EM\n\
    \/\n\
    \\ACK\EOT\a\EOT\NUL\STX0\DC2\EOT\203\STX\ACK\DC3\SUB\US For Haskell's PatternSynonyms\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX0\SOH\DC2\EOT\203\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX0\STX\DC2\EOT\203\STX\DLE\DC2\n\
    \\ESC\n\
    \\ACK\EOT\a\EOT\NUL\STX1\DC2\EOT\205\STX\ACK\NAK\SUB\v For Alloy\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX1\SOH\DC2\EOT\205\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX1\STX\DC2\EOT\205\STX\DC2\DC4\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STX2\DC2\EOT\206\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX2\SOH\DC2\EOT\206\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX2\STX\DC2\EOT\206\STX\DC1\DC3\n\
    \Q\n\
    \\ACK\EOT\a\EOT\NUL\STX3\DC2\EOT\208\STX\ACK\DC4\SUBA Analogous to 'Trait' and 'TypeClass', for Swift and Objective-C\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX3\SOH\DC2\EOT\208\STX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX3\STX\DC2\EOT\208\STX\DC1\DC3\n\
    \K\n\
    \\ACK\EOT\a\EOT\NUL\STX4\DC2\EOT\210\STX\ACK\SUB\SUB; Analogous to 'AbstractMethod', for Swift and Objective-C.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX4\SOH\DC2\EOT\210\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX4\STX\DC2\EOT\210\STX\ETB\EM\n\
    \9\n\
    \\ACK\EOT\a\EOT\NUL\STX5\DC2\EOT\212\STX\ACK\GS\SUB) Analogous to 'AbstractMethod', for C++.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX5\SOH\DC2\EOT\212\STX\ACK\ETB\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX5\STX\DC2\EOT\212\STX\SUB\FS\n\
    \\GS\n\
    \\ACK\EOT\a\EOT\NUL\STX6\DC2\EOT\214\STX\ACK\ETB\SUB\r For Haskell\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX6\SOH\DC2\EOT\214\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX6\STX\DC2\EOT\214\STX\DC4\SYN\n\
    \4\n\
    \\ACK\EOT\a\EOT\NUL\STX7\DC2\EOT\216\STX\ACK\EM\SUB$ 'self' in Python, Rust, Swift etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX7\SOH\DC2\EOT\216\STX\ACK\DC3\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX7\STX\DC2\EOT\216\STX\SYN\CAN\n\
    \;\n\
    \\ACK\EOT\a\EOT\NUL\STX8\DC2\EOT\218\STX\ACK\DC2\SUB+ For 'set' in Swift, 'attr_writer' in Ruby\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX8\SOH\DC2\EOT\218\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX8\STX\DC2\EOT\218\STX\SI\DC1\n\
    \3\n\
    \\ACK\EOT\a\EOT\NUL\STX9\DC2\EOT\220\STX\ACK\NAK\SUB# For Alloy, analogous to 'Struct'.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX9\SOH\DC2\EOT\220\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX9\STX\DC2\EOT\220\STX\DC2\DC4\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STX:\DC2\EOT\222\STX\ACK\SUB\SUB\n\
    \ For Ruby\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX:\SOH\DC2\EOT\222\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX:\STX\DC2\EOT\222\STX\ETB\EM\n\
    \8\n\
    \\ACK\EOT\a\EOT\NUL\STX;\DC2\EOT\224\STX\ACK\ESC\SUB( Analogous to 'StaticMethod', for Ruby.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX;\SOH\DC2\EOT\224\STX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX;\STX\DC2\EOT\224\STX\CAN\SUB\n\
    \5\n\
    \\ACK\EOT\a\EOT\NUL\STX<\DC2\EOT\226\STX\ACK\FS\SUB% Analogous to 'StaticField', for C++\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX<\SOH\DC2\EOT\226\STX\ACK\SYN\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX<\STX\DC2\EOT\226\STX\EM\ESC\n\
    \\CAN\n\
    \\ACK\EOT\a\EOT\NUL\STX=\DC2\EOT\228\STX\ACK\ETB\SUB\b For C#\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX=\SOH\DC2\EOT\228\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX=\STX\DC2\EOT\228\STX\DC4\SYN\n\
    \\CAN\n\
    \\ACK\EOT\a\EOT\NUL\STX>\DC2\EOT\230\STX\ACK\ETB\SUB\b For C#\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX>\SOH\DC2\EOT\230\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX>\STX\DC2\EOT\230\STX\DC4\SYN\n\
    \(\n\
    \\ACK\EOT\a\EOT\NUL\STX?\DC2\EOT\232\STX\ACK\CAN\SUB\CAN For Java, C#, C++ etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX?\SOH\DC2\EOT\232\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX?\STX\DC2\EOT\232\STX\NAK\ETB\n\
    \)\n\
    \\ACK\EOT\a\EOT\NUL\STX@\DC2\EOT\234\STX\ACK\SUB\SUB\EM For C#, TypeScript etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX@\SOH\DC2\EOT\234\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STX@\STX\DC2\EOT\234\STX\ETB\EM\n\
    \\FS\n\
    \\ACK\EOT\a\EOT\NUL\STXA\DC2\EOT\236\STX\ACK\SUB\SUB\f For C, C++\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXA\SOH\DC2\EOT\236\STX\ACK\DC4\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXA\STX\DC2\EOT\236\STX\ETB\EM\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STXB\DC2\EOT\237\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXB\SOH\DC2\EOT\237\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXB\STX\DC2\EOT\237\STX\SI\DC1\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STXC\DC2\EOT\238\STX\ACK\DC2\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXC\SOH\DC2\EOT\238\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXC\STX\DC2\EOT\238\STX\SI\DC1\n\
    \\ESC\n\
    \\ACK\EOT\a\EOT\NUL\STXD\DC2\EOT\240\STX\ACK\NAK\SUB\v For Swift\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXD\SOH\DC2\EOT\240\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXD\STX\DC2\EOT\240\STX\DC2\DC4\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STXE\DC2\EOT\242\STX\ACK\DC2\SUB\n\
    \ For Lean\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXE\SOH\DC2\EOT\242\STX\ACK\f\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXE\STX\DC2\EOT\242\STX\SI\DC1\n\
    \\SUB\n\
    \\ACK\EOT\a\EOT\NUL\STXF\DC2\EOT\244\STX\ACK\DC3\SUB\n\
    \ For Lean\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXF\SOH\DC2\EOT\244\STX\ACK\r\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXF\STX\DC2\EOT\244\STX\DLE\DC2\n\
    \U\n\
    \\ACK\EOT\a\EOT\NUL\STXG\DC2\EOT\247\STX\ACK\EM\SUBE Method receiver for languages\n\
    \ 'this' in JavaScript, C++, Java etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXG\SOH\DC2\EOT\247\STX\ACK\DC3\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXG\STX\DC2\EOT\247\STX\SYN\CAN\n\
    \O\n\
    \\ACK\EOT\a\EOT\NUL\STXH\DC2\EOT\249\STX\ACK\DC1\SUB? Analogous to 'Protocol' and 'TypeClass', for Rust, Scala etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXH\SOH\DC2\EOT\249\STX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXH\STX\DC2\EOT\249\STX\SO\DLE\n\
    \E\n\
    \\ACK\EOT\a\EOT\NUL\STXI\DC2\EOT\251\STX\ACK\ETB\SUB5 Analogous to 'AbstractMethod', for Rust, Scala etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXI\SOH\DC2\EOT\251\STX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXI\STX\DC2\EOT\251\STX\DC4\SYN\n\
    \\137\SOH\n\
    \\ACK\EOT\a\EOT\NUL\STXJ\DC2\EOT\254\STX\ACK\DLE\SUBy Data type definition for languages like OCaml which use `type`\n\
    \ rather than separate keywords like `struct` and `enum`.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXJ\SOH\DC2\EOT\254\STX\ACK\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXJ\STX\DC2\EOT\254\STX\r\SI\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STXK\DC2\EOT\255\STX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXK\SOH\DC2\EOT\255\STX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXK\STX\DC2\EOT\255\STX\DC2\DC4\n\
    \S\n\
    \\ACK\EOT\a\EOT\NUL\STXL\DC2\EOT\129\ETX\ACK\NAK\SUBC Analogous to 'Trait' and 'Protocol', for Haskell, Purescript etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXL\SOH\DC2\EOT\129\ETX\ACK\SI\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXL\STX\DC2\EOT\129\ETX\DC2\DC4\n\
    \M\n\
    \\ACK\EOT\a\EOT\NUL\STXM\DC2\EOT\131\ETX\ACK\ESC\SUB= Analogous to 'AbstractMethod', for Haskell, Purescript etc.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXM\SOH\DC2\EOT\131\ETX\ACK\NAK\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXM\STX\DC2\EOT\131\ETX\CAN\SUB\n\
    \\GS\n\
    \\ACK\EOT\a\EOT\NUL\STXN\DC2\EOT\133\ETX\ACK\SYN\SUB\r For Haskell\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXN\SOH\DC2\EOT\133\ETX\ACK\DLE\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXN\STX\DC2\EOT\133\ETX\DC3\NAK\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STXO\DC2\EOT\134\ETX\ACK\EM\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXO\SOH\DC2\EOT\134\ETX\ACK\DC3\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXO\STX\DC2\EOT\134\ETX\SYN\CAN\n\
    \(\n\
    \\ACK\EOT\a\EOT\NUL\STXP\DC2\EOT\136\ETX\ACK\DC1\SUB\CAN For C, C++, Capn Proto\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXP\SOH\DC2\EOT\136\ETX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXP\STX\DC2\EOT\136\ETX\SO\DLE\n\
    \\SO\n\
    \\ACK\EOT\a\EOT\NUL\STXQ\DC2\EOT\137\ETX\ACK\DC1\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXQ\SOH\DC2\EOT\137\ETX\ACK\v\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXQ\STX\DC2\EOT\137\ETX\SO\DLE\n\
    \[\n\
    \\ACK\EOT\a\EOT\NUL\STXR\DC2\EOT\138\ETX\ACK\DC4\"K Next = 83;\n\
    \ Feel free to open a PR proposing new language-specific kinds.\n\
    \\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXR\SOH\DC2\EOT\138\ETX\ACK\SO\n\
    \\SI\n\
    \\a\EOT\a\EOT\NUL\STXR\STX\DC2\EOT\138\ETX\DC1\DC3\n\
    \\243\ETX\n\
    \\EOT\EOT\a\STX\EOT\DC2\EOT\151\ETX\STX\SUB\SUB\228\ETX (optional) The name of this symbol as it should be displayed to the user.\n\
    \ For example, the symbol \"com/example/MyClass#myMethod(+1).\" should have the\n\
    \ display name \"myMethod\". The `symbol` field is not a reliable source of\n\
    \ the display name for several reasons:\n\
    \\n\
    \ - Local symbols don't encode the name.\n\
    \ - Some languages have case-insensitive names, so the symbol is all-lowercase.\n\
    \ - The symbol may encode names with special characters that should not be\n\
    \   displayed to the user.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\EOT\ENQ\DC2\EOT\151\ETX\STX\b\n\
    \\r\n\
    \\ENQ\EOT\a\STX\EOT\SOH\DC2\EOT\151\ETX\t\NAK\n\
    \\r\n\
    \\ENQ\EOT\a\STX\EOT\ETX\DC2\EOT\151\ETX\CAN\EM\n\
    \\196\ETX\n\
    \\EOT\EOT\a\STX\ENQ\DC2\EOT\158\ETX\STX'\SUB\181\ETX (optional) The signature of this symbol as it's displayed in API\n\
    \ documentation or in hover tooltips. For example, a Java method that adds\n\
    \ two numbers this would have `Document.language = \"java\"` and `Document.text\n\
    \ = \"void add(int a, int b)\". The `language` and `text` fields are required\n\
    \ while other fields such as `Documentation.occurrences` can be optionally\n\
    \ included to support hyperlinking referenced symbols in the signature.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ENQ\ACK\DC2\EOT\158\ETX\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ENQ\SOH\DC2\EOT\158\ETX\v\"\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ENQ\ETX\DC2\EOT\158\ETX%&\n\
    \\201\b\n\
    \\EOT\EOT\a\STX\ACK\DC2\EOT\176\ETX\STX\RS\SUB\186\b (optional) The enclosing symbol if this is a local symbol.  For non-local\n\
    \ symbols, the enclosing symbol should be parsed from the `symbol` field\n\
    \ using the `Descriptor` grammar.\n\
    \\n\
    \ The primary use-case for this field is to allow local symbol to be displayed\n\
    \ in a symbol hierarchy for API documentation. It's OK to leave this field\n\
    \ empty for local variables since local variables usually don't belong in API\n\
    \ documentation. However, in the situation that you wish to include a local\n\
    \ symbol in the hierarchy, then you can use `enclosing_symbol` to locate the\n\
    \ \"parent\" or \"owner\" of this local symbol. For example, a Java indexer may\n\
    \ choose to use local symbols for private class fields while providing an\n\
    \ `enclosing_symbol` to reference the enclosing class to allow the field to\n\
    \ be part of the class documentation hierarchy. From the perspective of an\n\
    \ author of an indexer, the decision to use a local symbol or global symbol\n\
    \ should exclusively be determined whether the local symbol is accessible\n\
    \ outside the document, not by the capability to find the enclosing\n\
    \ symbol.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ACK\ENQ\DC2\EOT\176\ETX\STX\b\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ACK\SOH\DC2\EOT\176\ETX\t\EM\n\
    \\r\n\
    \\ENQ\EOT\a\STX\ACK\ETX\DC2\EOT\176\ETX\FS\GS\n\
    \J\n\
    \\EOT\EOT\a\STX\a\DC2\EOT\179\ETX\STX\SUB\SUB< (optional) Experimental support for structured signatures.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\a\STX\a\ACK\DC2\EOT\179\ETX\STX\v\n\
    \\r\n\
    \\ENQ\EOT\a\STX\a\SOH\DC2\EOT\179\ETX\f\NAK\n\
    \\r\n\
    \\ENQ\EOT\a\STX\a\ETX\DC2\EOT\179\ETX\CAN\EM\n\
    \\f\n\
    \\STX\EOT\b\DC2\ACK\183\ETX\NUL\239\ETX\SOH\n\
    \\v\n\
    \\ETX\EOT\b\SOH\DC2\EOT\183\ETX\b\DC4\n\
    \\f\n\
    \\EOT\EOT\b\STX\NUL\DC2\EOT\184\ETX\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ENQ\DC2\EOT\184\ETX\STX\b\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\SOH\DC2\EOT\184\ETX\t\SI\n\
    \\r\n\
    \\ENQ\EOT\b\STX\NUL\ETX\DC2\EOT\184\ETX\DC2\DC3\n\
    \\222\b\n\
    \\EOT\EOT\b\STX\SOH\DC2\EOT\209\ETX\STX\CAN\SUB\207\b When resolving \"Find references\", this field documents what other symbols\n\
    \ should be included together with this symbol. For example, consider the\n\
    \ following TypeScript code that defines two symbols `Animal#sound()` and\n\
    \ `Dog#sound()`:\n\
    \ ```ts\n\
    \ interface Animal {\n\
    \           ^^^^^^ definition Animal#\n\
    \   sound(): string\n\
    \   ^^^^^ definition Animal#sound()\n\
    \ }\n\
    \ class Dog implements Animal {\n\
    \       ^^^ definition Dog#, relationships = [{symbol: \"Animal#\", is_implementation: true}]\n\
    \   public sound(): string { return \"woof\" }\n\
    \          ^^^^^ definition Dog#sound(), references_symbols = Animal#sound(), relationships = [{symbol: \"Animal#sound()\", is_implementation:true, is_reference: true}]\n\
    \ }\n\
    \ const animal: Animal = new Dog()\n\
    \               ^^^^^^ reference Animal#\n\
    \ console.log(animal.sound())\n\
    \                    ^^^^^ reference Animal#sound()\n\
    \ ```\n\
    \ Doing \"Find references\" on the symbol `Animal#sound()` should return\n\
    \ references to the `Dog#sound()` method as well. Vice-versa, doing \"Find\n\
    \ references\" on the `Dog#sound()` method should include references to the\n\
    \ `Animal#sound()` method as well.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ENQ\DC2\EOT\209\ETX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\SOH\DC2\EOT\209\ETX\a\DC3\n\
    \\r\n\
    \\ENQ\EOT\b\STX\SOH\ETX\DC2\EOT\209\ETX\SYN\ETB\n\
    \\238\ETX\n\
    \\EOT\EOT\b\STX\STX\DC2\EOT\218\ETX\STX\GS\SUB\223\ETX Similar to `is_reference` but for \"Find implementations\".\n\
    \ It's common for `is_implementation` and `is_reference` to both be true but\n\
    \ it's not always the case.\n\
    \ In the TypeScript example above, observe that `Dog#` has an\n\
    \ `is_implementation` relationship with `\"Animal#\"` but not `is_reference`.\n\
    \ This is because \"Find references\" on the \"Animal#\" symbol should not return\n\
    \ \"Dog#\". We only want \"Dog#\" to return as a result for \"Find\n\
    \ implementations\" on the \"Animal#\" symbol.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\ENQ\DC2\EOT\218\ETX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\SOH\DC2\EOT\218\ETX\a\CAN\n\
    \\r\n\
    \\ENQ\EOT\b\STX\STX\ETX\DC2\EOT\218\ETX\ESC\FS\n\
    \P\n\
    \\EOT\EOT\b\STX\ETX\DC2\EOT\220\ETX\STX\RS\SUBB Similar to `references_symbols` but for \"Go to type definition\".\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\ETX\ENQ\DC2\EOT\220\ETX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\b\STX\ETX\SOH\DC2\EOT\220\ETX\a\EM\n\
    \\r\n\
    \\ENQ\EOT\b\STX\ETX\ETX\DC2\EOT\220\ETX\FS\GS\n\
    \\167\a\n\
    \\EOT\EOT\b\STX\EOT\DC2\EOT\237\ETX\STX\EM\SUB\213\ACK Allows overriding the behavior of \"Go to definition\" and \"Find references\"\n\
    \ for symbols which do not have a definition of their own or could\n\
    \ potentially have multiple definitions.\n\
    \\n\
    \ For example, in a language with single inheritance and no field overriding,\n\
    \ inherited fields can reuse the same symbol as the ancestor which declares\n\
    \ the field. In such a situation, is_definition is not needed.\n\
    \\n\
    \ On the other hand, in languages with single inheritance and some form\n\
    \ of mixins, you can use is_definition to relate the symbol to the\n\
    \ matching symbol in ancestor classes, and is_reference to relate the\n\
    \ symbol to the matching symbol in mixins.\n\
    \\n\
    \ NOTE: At the moment, due to limitations of the SCIP to LSIF conversion,\n\
    \ only global symbols in an index are allowed to use is_definition.\n\
    \ The relationship may not get recorded if either symbol is local.\n\
    \\"A Update registerInverseRelationships on adding a new field here.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\b\STX\EOT\ENQ\DC2\EOT\237\ETX\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\b\STX\EOT\SOH\DC2\EOT\237\ETX\a\DC4\n\
    \\r\n\
    \\ENQ\EOT\b\STX\EOT\ETX\DC2\EOT\237\ETX\ETB\CAN\n\
    \\136\ETX\n\
    \\STX\ENQ\ETX\DC2\ACK\246\ETX\NUL\140\EOT\SOH\SUB\249\STX SymbolRole declares what \"role\" a symbol has in an occurrence. A role is\n\
    \ encoded as a bitset where each bit represents a different role. For example,\n\
    \ to determine if the `Import` role is set, test whether the second bit of the\n\
    \ enum value is defined. In pseudocode, this can be implemented with the\n\
    \ logic: `const isImportRole = (role.value & SymbolRole.Import.value) > 0`.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\ETX\SOH\DC2\EOT\246\ETX\ENQ\SI\n\
    \v\n\
    \\EOT\ENQ\ETX\STX\NUL\DC2\EOT\249\ETX\STX\FS\SUBh This case is not meant to be used; it only exists to avoid an error\n\
    \ from the Protobuf code generator.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\NUL\SOH\DC2\EOT\249\ETX\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\NUL\STX\DC2\EOT\249\ETX\SUB\ESC\n\
    \T\n\
    \\EOT\ENQ\ETX\STX\SOH\DC2\EOT\251\ETX\STX\DC3\SUBF Is the symbol defined here? If not, then this is a symbol reference.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\SOH\SOH\DC2\EOT\251\ETX\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\SOH\STX\DC2\EOT\251\ETX\SI\DC2\n\
    \,\n\
    \\EOT\ENQ\ETX\STX\STX\DC2\EOT\253\ETX\STX\SI\SUB\RS Is the symbol imported here?\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\STX\SOH\DC2\EOT\253\ETX\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\STX\STX\DC2\EOT\253\ETX\v\SO\n\
    \+\n\
    \\EOT\ENQ\ETX\STX\ETX\DC2\EOT\255\ETX\STX\DC4\SUB\GS Is the symbol written here?\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ETX\SOH\DC2\EOT\255\ETX\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ETX\STX\DC2\EOT\255\ETX\DLE\DC3\n\
    \(\n\
    \\EOT\ENQ\ETX\STX\EOT\DC2\EOT\129\EOT\STX\DC3\SUB\SUB Is the symbol read here?\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\EOT\SOH\DC2\EOT\129\EOT\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\EOT\STX\DC2\EOT\129\EOT\SI\DC2\n\
    \0\n\
    \\EOT\ENQ\ETX\STX\ENQ\DC2\EOT\131\EOT\STX\DC3\SUB\" Is the symbol in generated code?\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ENQ\SOH\DC2\EOT\131\EOT\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ENQ\STX\DC2\EOT\131\EOT\SO\DC2\n\
    \+\n\
    \\EOT\ENQ\ETX\STX\ACK\DC2\EOT\133\EOT\STX\SO\SUB\GS Is the symbol in test code?\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ACK\SOH\DC2\EOT\133\EOT\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\ACK\STX\DC2\EOT\133\EOT\t\r\n\
    \\237\SOH\n\
    \\EOT\ENQ\ETX\STX\a\DC2\EOT\139\EOT\STX\ESC\SUB\222\SOH Is this a signature for a symbol that is defined elsewhere?\n\
    \\n\
    \ Applies to forward declarations for languages like C, C++\n\
    \ and Objective-C, as well as `val` declarations in interface\n\
    \ files in languages like SML and OCaml.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\a\SOH\DC2\EOT\139\EOT\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\ETX\STX\a\STX\DC2\EOT\139\EOT\SYN\SUB\n\
    \\f\n\
    \\STX\ENQ\EOT\DC2\ACK\142\EOT\NUL\235\EOT\SOH\n\
    \\v\n\
    \\ETX\ENQ\EOT\SOH\DC2\EOT\142\EOT\ENQ\SI\n\
    \\v\n\
    \\ETX\ENQ\EOT\ETX\DC2\EOT\143\EOT\STX\FS\n\
    \\f\n\
    \\EOT\ENQ\EOT\ETX\STX\DC2\EOT\143\EOT\STX\FS\n\
    \\f\n\
    \\EOT\ENQ\EOT\STX\NUL\DC2\EOT\145\EOT\STX\FS\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\NUL\SOH\DC2\EOT\145\EOT\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\NUL\STX\DC2\EOT\145\EOT\SUB\ESC\n\
    \;\n\
    \\EOT\ENQ\EOT\STX\SOH\DC2\EOT\148\EOT\STX\SO\SUB- Comment, including comment markers and text\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SOH\SOH\DC2\EOT\148\EOT\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SOH\STX\DC2\EOT\148\EOT\f\r\n\
    \\ESC\n\
    \\EOT\ENQ\EOT\STX\STX\DC2\EOT\151\EOT\STX\ESC\SUB\r `;` `.` `,`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\STX\SOH\DC2\EOT\151\EOT\STX\SYN\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\STX\STX\DC2\EOT\151\EOT\EM\SUB\n\
    \2\n\
    \\EOT\ENQ\EOT\STX\ETX\DC2\EOT\153\EOT\STX\EM\SUB$ (), {}, [] when used syntactically\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ETX\SOH\DC2\EOT\153\EOT\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ETX\STX\DC2\EOT\153\EOT\ETB\CAN\n\
    \5\n\
    \\EOT\ENQ\EOT\STX\EOT\DC2\EOT\156\EOT\STX\SO\SUB' `if`, `else`, `return`, `class`, etc.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\EOT\SOH\DC2\EOT\156\EOT\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\EOT\STX\DC2\EOT\156\EOT\f\r\n\
    \\f\n\
    \\EOT\ENQ\EOT\STX\ENQ\DC2\EOT\157\EOT\STX*\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ENQ\SOH\DC2\EOT\157\EOT\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ENQ\STX\DC2\EOT\157\EOT\SYN\ETB\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ENQ\ETX\DC2\EOT\157\EOT\CAN)\n\
    \\SO\n\
    \\ACK\ENQ\EOT\STX\ENQ\ETX\SOH\DC2\EOT\157\EOT\EM(\n\
    \\RS\n\
    \\EOT\ENQ\EOT\STX\ACK\DC2\EOT\160\EOT\STX\EM\SUB\DLE `+`, `*`, etc.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ACK\SOH\DC2\EOT\160\EOT\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ACK\STX\DC2\EOT\160\EOT\ETB\CAN\n\
    \X\n\
    \\EOT\ENQ\EOT\STX\a\DC2\EOT\163\EOT\STX\DC1\SUBJ non-specific catch-all for any identifier not better described elsewhere\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\a\SOH\DC2\EOT\163\EOT\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\a\STX\DC2\EOT\163\EOT\SI\DLE\n\
    \N\n\
    \\EOT\ENQ\EOT\STX\b\DC2\EOT\165\EOT\STX\CAN\SUB@ Identifiers builtin to the language: `min`, `print` in Python.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\b\SOH\DC2\EOT\165\EOT\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\b\STX\DC2\EOT\165\EOT\SYN\ETB\n\
    \[\n\
    \\EOT\ENQ\EOT\STX\t\DC2\EOT\167\EOT\STX\NAK\SUBM Identifiers representing `null`-like values: `None` in Python, `nil` in Go.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\t\SOH\DC2\EOT\167\EOT\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\t\STX\DC2\EOT\167\EOT\DC3\DC4\n\
    \.\n\
    \\EOT\ENQ\EOT\STX\n\
    \\DC2\EOT\169\EOT\STX\EM\SUB  `xyz` in `const xyz = \"hello\"`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\n\
    \\SOH\DC2\EOT\169\EOT\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\n\
    \\STX\DC2\EOT\169\EOT\ETB\CAN\n\
    \'\n\
    \\EOT\ENQ\EOT\STX\v\DC2\EOT\171\EOT\STX\US\SUB\EM `var X = \"hello\"` in Go\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\v\SOH\DC2\EOT\171\EOT\STX\EM\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\v\STX\DC2\EOT\171\EOT\FS\RS\n\
    \3\n\
    \\EOT\ENQ\EOT\STX\f\DC2\EOT\173\EOT\STX\ESC\SUB% Parameter definition and references\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\f\SOH\DC2\EOT\173\EOT\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\f\STX\DC2\EOT\173\EOT\CAN\SUB\n\
    \X\n\
    \\EOT\ENQ\EOT\STX\r\DC2\EOT\175\EOT\STX\ETB\SUBJ Identifiers for variable definitions and references within a local scope\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\r\SOH\DC2\EOT\175\EOT\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\r\STX\DC2\EOT\175\EOT\DC4\SYN\n\
    \K\n\
    \\EOT\ENQ\EOT\STX\SO\DC2\EOT\177\EOT\STX\SUB\SUB= Identifiers that shadow other identifiers in an outer scope\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SO\SOH\DC2\EOT\177\EOT\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SO\STX\DC2\EOT\177\EOT\ETB\EM\n\
    \\205\SOH\n\
    \\EOT\ENQ\EOT\STX\SI\DC2\EOT\182\EOT\STX\ESC\SUB\190\SOH Identifier representing a unit of code abstraction and/or namespacing.\n\
    \\n\
    \ NOTE: This corresponds to a package in Go and JVM languages,\n\
    \ and a module in languages like Python and JavaScript.\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SI\SOH\DC2\EOT\182\EOT\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SI\STX\DC2\EOT\182\EOT\CAN\SUB\n\
    \\f\n\
    \\EOT\ENQ\EOT\STX\DLE\DC2\EOT\183\EOT\STX*\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DLE\SOH\DC2\EOT\183\EOT\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DLE\STX\DC2\EOT\183\EOT\NAK\ETB\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DLE\ETX\DC2\EOT\183\EOT\CAN)\n\
    \\SO\n\
    \\ACK\ENQ\EOT\STX\DLE\ETX\SOH\DC2\EOT\183\EOT\EM(\n\
    \4\n\
    \\EOT\ENQ\EOT\STX\DC1\DC2\EOT\186\EOT\STX\SUB\SUB& Function references, including calls\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC1\SOH\DC2\EOT\186\EOT\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC1\STX\DC2\EOT\186\EOT\ETB\EM\n\
    \(\n\
    \\EOT\ENQ\EOT\STX\DC2\DC2\EOT\188\EOT\STX$\SUB\SUB Function definition only\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC2\SOH\DC2\EOT\188\EOT\STX\RS\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC2\STX\DC2\EOT\188\EOT!#\n\
    \7\n\
    \\EOT\ENQ\EOT\STX\DC3\DC2\EOT\191\EOT\STX\ETB\SUB) Macro references, including invocations\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC3\SOH\DC2\EOT\191\EOT\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC3\STX\DC2\EOT\191\EOT\DC4\SYN\n\
    \%\n\
    \\EOT\ENQ\EOT\STX\DC4\DC2\EOT\193\EOT\STX!\SUB\ETB Macro definition only\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC4\SOH\DC2\EOT\193\EOT\STX\ESC\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\DC4\STX\DC2\EOT\193\EOT\RS \n\
    \!\n\
    \\EOT\ENQ\EOT\STX\NAK\DC2\EOT\196\EOT\STX\SYN\SUB\DC3 non-builtin types\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\NAK\SOH\DC2\EOT\196\EOT\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\NAK\STX\DC2\EOT\196\EOT\DC3\NAK\n\
    \K\n\
    \\EOT\ENQ\EOT\STX\SYN\DC2\EOT\198\EOT\STX\GS\SUB= builtin types only, such as `str` for Python or `int` in Go\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SYN\SOH\DC2\EOT\198\EOT\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SYN\STX\DC2\EOT\198\EOT\SUB\FS\n\
    \7\n\
    \\EOT\ENQ\EOT\STX\ETB\DC2\EOT\201\EOT\STX\ESC\SUB) Python decorators, c-like __attribute__\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ETB\SOH\DC2\EOT\201\EOT\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ETB\STX\DC2\EOT\201\EOT\CAN\SUB\n\
    \\DC4\n\
    \\EOT\ENQ\EOT\STX\CAN\DC2\EOT\204\EOT\STX\DC3\SUB\ACK `\\b`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\CAN\SOH\DC2\EOT\204\EOT\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\CAN\STX\DC2\EOT\204\EOT\DLE\DC2\n\
    \\CAN\n\
    \\EOT\ENQ\EOT\STX\EM\DC2\EOT\206\EOT\STX\NAK\SUB\n\
    \ `*`, `+`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\EM\SOH\DC2\EOT\206\EOT\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\EM\STX\DC2\EOT\206\EOT\DC2\DC4\n\
    \\DC3\n\
    \\EOT\ENQ\EOT\STX\SUB\DC2\EOT\208\EOT\STX\NAK\SUB\ENQ `.`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SUB\SOH\DC2\EOT\208\EOT\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\SUB\STX\DC2\EOT\208\EOT\DC2\DC4\n\
    \\"\n\
    \\EOT\ENQ\EOT\STX\ESC\DC2\EOT\210\EOT\STX\SYN\SUB\DC4 `(`, `)`, `[`, `]`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ESC\SOH\DC2\EOT\210\EOT\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\ESC\STX\DC2\EOT\210\EOT\DC3\NAK\n\
    \\CAN\n\
    \\EOT\ENQ\EOT\STX\FS\DC2\EOT\212\EOT\STX\DC1\SUB\n\
    \ `|`, `-`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\FS\SOH\DC2\EOT\212\EOT\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\FS\STX\DC2\EOT\212\EOT\SO\DLE\n\
    \0\n\
    \\EOT\ENQ\EOT\STX\GS\DC2\EOT\215\EOT\STX\NAK\SUB\" Literal strings: \"Hello, world!\"\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\GS\SOH\DC2\EOT\215\EOT\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\GS\STX\DC2\EOT\215\EOT\DC2\DC4\n\
    \-\n\
    \\EOT\ENQ\EOT\STX\RS\DC2\EOT\217\EOT\STX\ESC\SUB\US non-regex escapes: \"\\t\", \"\\n\"\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\RS\SOH\DC2\EOT\217\EOT\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\RS\STX\DC2\EOT\217\EOT\CAN\SUB\n\
    \_\n\
    \\EOT\ENQ\EOT\STX\US\DC2\EOT\219\EOT\STX\FS\SUBQ datetimes within strings, special words within a string, `{}` in format strings\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\US\SOH\DC2\EOT\219\EOT\STX\SYN\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\US\STX\DC2\EOT\219\EOT\EM\ESC\n\
    \G\n\
    \\EOT\ENQ\EOT\STX \DC2\EOT\221\EOT\STX\CAN\SUB9 \"key\" in { \"key\": \"value\" }, useful for example in JSON\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX \SOH\DC2\EOT\221\EOT\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX \STX\DC2\EOT\221\EOT\NAK\ETB\n\
    \V\n\
    \\EOT\ENQ\EOT\STX!\DC2\EOT\223\EOT\STX\CAN\SUBH 'c' or similar, in languages that differentiate strings and characters\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX!\SOH\DC2\EOT\223\EOT\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX!\STX\DC2\EOT\223\EOT\NAK\ETB\n\
    \9\n\
    \\EOT\ENQ\EOT\STX\"\DC2\EOT\225\EOT\STX\SYN\SUB+ Literal numbers, both floats and integers\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\"\SOH\DC2\EOT\225\EOT\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX\"\STX\DC2\EOT\225\EOT\DC3\NAK\n\
    \\US\n\
    \\EOT\ENQ\EOT\STX#\DC2\EOT\227\EOT\STX\SYN\SUB\DC1 `true`, `false`\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX#\SOH\DC2\EOT\227\EOT\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX#\STX\DC2\EOT\227\EOT\DC3\NAK\n\
    \&\n\
    \\EOT\ENQ\EOT\STX$\DC2\EOT\230\EOT\STX\v\SUB\CAN Used for XML-like tags\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX$\SOH\DC2\EOT\230\EOT\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX$\STX\DC2\EOT\230\EOT\b\n\
    \\n\
    \/\n\
    \\EOT\ENQ\EOT\STX%\DC2\EOT\232\EOT\STX\DC4\SUB! Attribute name in XML-like tags\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX%\SOH\DC2\EOT\232\EOT\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX%\STX\DC2\EOT\232\EOT\DC1\DC3\n\
    \,\n\
    \\EOT\ENQ\EOT\STX&\DC2\EOT\234\EOT\STX\DC4\SUB\RS Delimiters for XML-like tags\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX&\SOH\DC2\EOT\234\EOT\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\EOT\STX&\STX\DC2\EOT\234\EOT\DC1\DC3\n\
    \\249\SOH\n\
    \\STX\EOT\t\DC2\ACK\242\EOT\NUL\209\ENQ\SOH\SUB\234\SOH Occurrence associates a source position with a symbol and/or highlighting\n\
    \ information.\n\
    \\n\
    \ If possible, indexers should try to bundle logically related information\n\
    \ across occurrences into a single occurrence to reduce payload sizes.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\t\SOH\DC2\EOT\242\EOT\b\DC2\n\
    \\158\b\n\
    \\EOT\EOT\t\STX\NUL\DC2\EOT\136\ENQ\STX\ESC\SUB\143\b Source position of this occurrence. Must be exactly three or four\n\
    \ elements:\n\
    \\n\
    \ - Four elements: `[startLine, startCharacter, endLine, endCharacter]`\n\
    \ - Three elements: `[startLine, startCharacter, endCharacter]`. The end line\n\
    \   is inferred to have the same value as the start line.\n\
    \\n\
    \ Line numbers and characters are always 0-based. Make sure to increment the\n\
    \ line/character values before displaying them in an editor-like UI because\n\
    \ editors conventionally use 1-based numbers.\n\
    \\n\
    \ The 'character' value is interpreted based on the PositionEncoding for\n\
    \ the Document.\n\
    \\n\
    \ Historical note: the original draft of this schema had a `Range` message\n\
    \ type with `start` and `end` fields of type `Position`, mirroring LSP.\n\
    \ Benchmarks revealed that this encoding was inefficient and that we could\n\
    \ reduce the total payload size of an index by 50% by using `repeated int32`\n\
    \ instead. The `repeated int32` encoding is admittedly more embarrassing to\n\
    \ work with in some programming languages but we hope the performance\n\
    \ improvements make up for it.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\EOT\DC2\EOT\136\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ENQ\DC2\EOT\136\ENQ\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\SOH\DC2\EOT\136\ENQ\DC1\SYN\n\
    \\r\n\
    \\ENQ\EOT\t\STX\NUL\ETX\DC2\EOT\136\ENQ\EM\SUB\n\
    \\138\SOH\n\
    \\EOT\EOT\t\STX\SOH\DC2\EOT\139\ENQ\STX\DC4\SUB| (optional) The symbol that appears at this position. See\n\
    \ `SymbolInformation.symbol` for how to format symbols as strings.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ENQ\DC2\EOT\139\ENQ\STX\b\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\SOH\DC2\EOT\139\ENQ\t\SI\n\
    \\r\n\
    \\ENQ\EOT\t\STX\SOH\ETX\DC2\EOT\139\ENQ\DC2\DC3\n\
    \\151\SOH\n\
    \\EOT\EOT\t\STX\STX\DC2\EOT\142\ENQ\STX\EM\SUB\136\SOH (optional) Bitset containing `SymbolRole`s in this occurrence.\n\
    \ See `SymbolRole`'s documentation for how to read and write this field.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\ENQ\DC2\EOT\142\ENQ\STX\a\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\SOH\DC2\EOT\142\ENQ\b\DC4\n\
    \\r\n\
    \\ENQ\EOT\t\STX\STX\ETX\DC2\EOT\142\ENQ\ETB\CAN\n\
    \\241\ETX\n\
    \\EOT\EOT\t\STX\ETX\DC2\EOT\151\ENQ\STX-\SUB\226\ETX (optional) CommonMark-formatted documentation for this specific range. If\n\
    \ empty, the `Symbol.documentation` field is used instead. One example\n\
    \ where this field might be useful is when the symbol represents a generic\n\
    \ function (with abstract type parameters such as `List<T>`) and at this\n\
    \ occurrence we know the exact values (such as `List<String>`).\n\
    \\n\
    \ This field can also be used for dynamically or gradually typed languages,\n\
    \ which commonly allow for type-changing assignment.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\EOT\DC2\EOT\151\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\ENQ\DC2\EOT\151\ENQ\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\SOH\DC2\EOT\151\ENQ\DC2(\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ETX\ETX\DC2\EOT\151\ENQ+,\n\
    \X\n\
    \\EOT\EOT\t\STX\EOT\DC2\EOT\153\ENQ\STX\GS\SUBJ (optional) What syntax highlighting class should be used for this range?\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\ACK\DC2\EOT\153\ENQ\STX\f\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\SOH\DC2\EOT\153\ENQ\r\CAN\n\
    \\r\n\
    \\ENQ\EOT\t\STX\EOT\ETX\DC2\EOT\153\ENQ\ESC\FS\n\
    \W\n\
    \\EOT\EOT\t\STX\ENQ\DC2\EOT\155\ENQ\STX&\SUBI (optional) Diagnostics that have been reported for this specific range.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\EOT\DC2\EOT\155\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\ACK\DC2\EOT\155\ENQ\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\SOH\DC2\EOT\155\ENQ\SYN!\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ENQ\ETX\DC2\EOT\155\ENQ$%\n\
    \\177\SO\n\
    \\EOT\EOT\t\STX\ACK\DC2\EOT\208\ENQ\STX%\SUB\162\SO (optional) Using the same encoding as the sibling `range` field, source\n\
    \ position of the nearest non-trivial enclosing AST node. This range must\n\
    \ enclose the `range` field. Example applications that make use of the\n\
    \ enclosing_range field:\n\
    \\n\
    \ - Call hierarchies: to determine what symbols are references from the body\n\
    \   of a function\n\
    \ - Symbol outline: to display breadcrumbs from the cursor position to the\n\
    \   root of the file\n\
    \ - Expand selection: to select the nearest enclosing AST node.\n\
    \ - Highlight range: to indicate the AST expression that is associated with a\n\
    \   hover popover\n\
    \\n\
    \ For definition occurrences, the enclosing range should indicate the\n\
    \ start/end bounds of the entire definition AST node, including\n\
    \ documentation.\n\
    \ ```\n\
    \ const n = 3\n\
    \       ^ range\n\
    \ ^^^^^^^^^^^ enclosing_range\n\
    \\n\
    \ /** Parses the string into something */\n\
    \ ^ enclosing_range start --------------------------------------|\n\
    \ function parse(input string): string {                        |\n\
    \          ^^^^^ range                                          |\n\
    \     return input.slice(n)                                     |\n\
    \ }                                                             |\n\
    \ ^ enclosing_range end <---------------------------------------|\n\
    \ ```\n\
    \\n\
    \ Any attributes/decorators/attached macros should also be part of the\n\
    \ enclosing range.\n\
    \\n\
    \ ```python\n\
    \ @cache\n\
    \ ^ enclosing_range start---------------------|\n\
    \ def factorial(n):                           |\n\
    \     return n * factorial(n-1) if n else 1   |\n\
    \ < enclosing_range end-----------------------|\n\
    \ \n\
    \ ```\n\
    \\n\
    \ For reference occurrences, the enclosing range should indicate the start/end\n\
    \ bounds of the parent expression.\n\
    \ ```\n\
    \ const a = a.b\n\
    \             ^ range\n\
    \           ^^^ enclosing_range\n\
    \ const b = a.b(41).f(42).g(43)\n\
    \                   ^ range\n\
    \           ^^^^^^^^^^^^^ enclosing_range\n\
    \ ```\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\EOT\DC2\EOT\208\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\ENQ\DC2\EOT\208\ENQ\v\DLE\n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\SOH\DC2\EOT\208\ENQ\DC1 \n\
    \\r\n\
    \\ENQ\EOT\t\STX\ACK\ETX\DC2\EOT\208\ENQ#$\n\
    \w\n\
    \\STX\EOT\n\
    \\DC2\ACK\213\ENQ\NUL\224\ENQ\SOH\SUBi Represents a diagnostic, such as a compiler error or warning, which should be\n\
    \ reported for a document.\n\
    \\n\
    \\v\n\
    \\ETX\EOT\n\
    \\SOH\DC2\EOT\213\ENQ\b\DC2\n\
    \W\n\
    \\EOT\EOT\n\
    \\STX\NUL\DC2\EOT\215\ENQ\STX\CAN\SUBI Should this diagnostic be reported as an error, warning, info, or hint?\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ACK\DC2\EOT\215\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\SOH\DC2\EOT\215\ENQ\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\NUL\ETX\DC2\EOT\215\ENQ\SYN\ETB\n\
    \]\n\
    \\EOT\EOT\n\
    \\STX\SOH\DC2\EOT\217\ENQ\STX\DC2\SUBO (optional) Code of this diagnostic, which might appear in the user interface.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ENQ\DC2\EOT\217\ENQ\STX\b\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\SOH\DC2\EOT\217\ENQ\t\r\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\SOH\ETX\DC2\EOT\217\ENQ\DLE\DC1\n\
    \+\n\
    \\EOT\EOT\n\
    \\STX\STX\DC2\EOT\219\ENQ\STX\NAK\SUB\GS Message of this diagnostic.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ENQ\DC2\EOT\219\ENQ\STX\b\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\SOH\DC2\EOT\219\ENQ\t\DLE\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\STX\ETX\DC2\EOT\219\ENQ\DC3\DC4\n\
    \~\n\
    \\EOT\EOT\n\
    \\STX\ETX\DC2\EOT\222\ENQ\STX\DC4\SUBp (optional) Human-readable string describing the source of this diagnostic, e.g.\n\
    \ 'typescript' or 'super lint'.\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\ENQ\DC2\EOT\222\ENQ\STX\b\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\SOH\DC2\EOT\222\ENQ\t\SI\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\ETX\ETX\DC2\EOT\222\ENQ\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\n\
    \\STX\EOT\DC2\EOT\223\ENQ\STX\"\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\EOT\DC2\EOT\223\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\ACK\DC2\EOT\223\ENQ\v\CAN\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\SOH\DC2\EOT\223\ENQ\EM\GS\n\
    \\r\n\
    \\ENQ\EOT\n\
    \\STX\EOT\ETX\DC2\EOT\223\ENQ !\n\
    \\f\n\
    \\STX\ENQ\ENQ\DC2\ACK\226\ENQ\NUL\232\ENQ\SOH\n\
    \\v\n\
    \\ETX\ENQ\ENQ\SOH\DC2\EOT\226\ENQ\ENQ\r\n\
    \\f\n\
    \\EOT\ENQ\ENQ\STX\NUL\DC2\EOT\227\ENQ\STX\SUB\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\NUL\SOH\DC2\EOT\227\ENQ\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\NUL\STX\DC2\EOT\227\ENQ\CAN\EM\n\
    \\f\n\
    \\EOT\ENQ\ENQ\STX\SOH\DC2\EOT\228\ENQ\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\SOH\SOH\DC2\EOT\228\ENQ\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\SOH\STX\DC2\EOT\228\ENQ\n\
    \\v\n\
    \\f\n\
    \\EOT\ENQ\ENQ\STX\STX\DC2\EOT\229\ENQ\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\STX\SOH\DC2\EOT\229\ENQ\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\STX\STX\DC2\EOT\229\ENQ\f\r\n\
    \\f\n\
    \\EOT\ENQ\ENQ\STX\ETX\DC2\EOT\230\ENQ\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\ETX\SOH\DC2\EOT\230\ENQ\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\ETX\STX\DC2\EOT\230\ENQ\DLE\DC1\n\
    \\f\n\
    \\EOT\ENQ\ENQ\STX\EOT\DC2\EOT\231\ENQ\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\EOT\SOH\DC2\EOT\231\ENQ\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\ENQ\STX\EOT\STX\DC2\EOT\231\ENQ\t\n\
    \\n\
    \\f\n\
    \\STX\ENQ\ACK\DC2\ACK\234\ENQ\NUL\238\ENQ\SOH\n\
    \\v\n\
    \\ETX\ENQ\ACK\SOH\DC2\EOT\234\ENQ\ENQ\DC2\n\
    \\f\n\
    \\EOT\ENQ\ACK\STX\NUL\DC2\EOT\235\ENQ\STX\US\n\
    \\r\n\
    \\ENQ\ENQ\ACK\STX\NUL\SOH\DC2\EOT\235\ENQ\STX\SUB\n\
    \\r\n\
    \\ENQ\ENQ\ACK\STX\NUL\STX\DC2\EOT\235\ENQ\GS\RS\n\
    \\f\n\
    \\EOT\ENQ\ACK\STX\SOH\DC2\EOT\236\ENQ\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\ACK\STX\SOH\SOH\DC2\EOT\236\ENQ\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\ACK\STX\SOH\STX\DC2\EOT\236\ENQ\DLE\DC1\n\
    \\f\n\
    \\EOT\ENQ\ACK\STX\STX\DC2\EOT\237\ENQ\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\ACK\STX\STX\SOH\DC2\EOT\237\ENQ\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\ACK\STX\STX\STX\DC2\EOT\237\ENQ\SI\DLE\n\
    \\208\ETX\n\
    \\STX\ENQ\a\DC2\ACK\246\ENQ\NUL\236\ACK\SOH\SUB\193\ETX Language standardises names of common programming languages that can be used\n\
    \ for the `Document.language` field. The primary purpose of this enum is to\n\
    \ prevent a situation where we have a single programming language ends up with\n\
    \ multiple string representations. For example, the C++ language uses the name\n\
    \ \"CPP\" in this enum and other names such as \"cpp\" are incompatible.\n\
    \ Feel free to send a pull-request to add missing programming languages.\n\
    \\n\
    \\v\n\
    \\ETX\ENQ\a\SOH\DC2\EOT\246\ENQ\ENQ\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\NUL\DC2\EOT\247\ENQ\STX\SUB\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\NUL\SOH\DC2\EOT\247\ENQ\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\NUL\STX\DC2\EOT\247\ENQ\CAN\EM\n\
    \\f\n\
    \\EOT\ENQ\a\STX\SOH\DC2\EOT\248\ENQ\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SOH\SOH\DC2\EOT\248\ENQ\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SOH\STX\DC2\EOT\248\ENQ\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\STX\DC2\EOT\249\ENQ\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\STX\SOH\DC2\EOT\249\ENQ\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\STX\STX\DC2\EOT\249\ENQ\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\ETX\DC2\EOT\250\ENQ\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ETX\SOH\DC2\EOT\250\ENQ\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ETX\STX\DC2\EOT\250\ENQ\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\EOT\DC2\EOT\251\ENQ\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\EOT\SOH\DC2\EOT\251\ENQ\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\EOT\STX\DC2\EOT\251\ENQ\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\ENQ\DC2\EOT\252\ENQ\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ENQ\SOH\DC2\EOT\252\ENQ\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ENQ\STX\DC2\EOT\252\ENQ\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\ACK\DC2\EOT\253\ENQ\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ACK\SOH\DC2\EOT\253\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ACK\STX\DC2\EOT\253\ENQ\r\SI\n\
    \\f\n\
    \\EOT\ENQ\a\STX\a\DC2\EOT\254\ENQ\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\a\SOH\DC2\EOT\254\ENQ\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\a\STX\DC2\EOT\254\ENQ\r\SI\n\
    \\f\n\
    \\EOT\ENQ\a\STX\b\DC2\EOT\255\ENQ\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\b\SOH\DC2\EOT\255\ENQ\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\b\STX\DC2\EOT\255\ENQ\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\t\DC2\EOT\128\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\t\SOH\DC2\EOT\128\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\t\STX\DC2\EOT\128\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\n\
    \\DC2\EOT\129\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\n\
    \\SOH\DC2\EOT\129\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\n\
    \\STX\DC2\EOT\129\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\v\DC2\EOT\130\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\v\SOH\DC2\EOT\130\ACK\STX\ETX\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\v\STX\DC2\EOT\130\ACK\ACK\b\n\
    \\f\n\
    \\EOT\ENQ\a\STX\f\DC2\EOT\131\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\f\SOH\DC2\EOT\131\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\f\STX\DC2\EOT\131\ACK\n\
    \\f\n\
    \H\n\
    \\EOT\ENQ\a\STX\r\DC2\EOT\132\ACK\STX\v\": C++ (the name \"CPP\" was chosen for consistency with LSP)\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\r\SOH\DC2\EOT\132\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\r\STX\DC2\EOT\132\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\SO\DC2\EOT\133\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SO\SOH\DC2\EOT\133\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SO\STX\DC2\EOT\133\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\SI\DC2\EOT\134\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SI\SOH\DC2\EOT\134\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SI\STX\DC2\EOT\134\ACK\v\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX\DLE\DC2\EOT\135\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DLE\SOH\DC2\EOT\135\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DLE\STX\DC2\EOT\135\ACK\f\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\DC1\DC2\EOT\136\ACK\STX\DC4\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC1\SOH\DC2\EOT\136\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC1\STX\DC2\EOT\136\ACK\DC1\DC3\n\
    \\f\n\
    \\EOT\ENQ\a\STX\DC2\DC2\EOT\137\ACK\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC2\SOH\DC2\EOT\137\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC2\STX\DC2\EOT\137\ACK\SI\DLE\n\
    \\f\n\
    \\EOT\ENQ\a\STX\DC3\DC2\EOT\138\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC3\SOH\DC2\EOT\138\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC3\STX\DC2\EOT\138\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\DC4\DC2\EOT\139\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC4\SOH\DC2\EOT\139\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\DC4\STX\DC2\EOT\139\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\NAK\DC2\EOT\140\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\NAK\SOH\DC2\EOT\140\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\NAK\STX\DC2\EOT\140\ACK\t\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX\SYN\DC2\EOT\141\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SYN\SOH\DC2\EOT\141\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SYN\STX\DC2\EOT\141\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\ETB\DC2\EOT\142\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ETB\SOH\DC2\EOT\142\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ETB\STX\DC2\EOT\142\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\CAN\DC2\EOT\143\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\CAN\SOH\DC2\EOT\143\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\CAN\STX\DC2\EOT\143\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STX\EM\DC2\EOT\144\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\EM\SOH\DC2\EOT\144\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\EM\STX\DC2\EOT\144\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\SUB\DC2\EOT\145\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SUB\SOH\DC2\EOT\145\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\SUB\STX\DC2\EOT\145\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\ESC\DC2\EOT\146\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ESC\SOH\DC2\EOT\146\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\ESC\STX\DC2\EOT\146\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\FS\DC2\EOT\147\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\FS\SOH\DC2\EOT\147\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\FS\STX\DC2\EOT\147\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\GS\DC2\EOT\148\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\GS\SOH\DC2\EOT\148\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\GS\STX\DC2\EOT\148\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\RS\DC2\EOT\149\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\RS\SOH\DC2\EOT\149\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\RS\STX\DC2\EOT\149\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX\US\DC2\EOT\150\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\US\SOH\DC2\EOT\150\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\US\STX\DC2\EOT\150\ACK\f\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX \DC2\EOT\151\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STX \SOH\DC2\EOT\151\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX \STX\DC2\EOT\151\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STX!\DC2\EOT\152\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STX!\SOH\DC2\EOT\152\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX!\STX\DC2\EOT\152\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STX\"\DC2\EOT\153\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\"\SOH\DC2\EOT\153\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\"\STX\DC2\EOT\153\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STX#\DC2\EOT\154\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX#\SOH\DC2\EOT\154\ACK\STX\EOT\n\
    \\r\n\
    \\ENQ\ENQ\a\STX#\STX\DC2\EOT\154\ACK\a\t\n\
    \\f\n\
    \\EOT\ENQ\a\STX$\DC2\EOT\155\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STX$\SOH\DC2\EOT\155\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX$\STX\DC2\EOT\155\ACK\f\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX%\DC2\EOT\156\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX%\SOH\DC2\EOT\156\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX%\STX\DC2\EOT\156\ACK\v\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX&\DC2\EOT\157\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX&\SOH\DC2\EOT\157\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX&\STX\DC2\EOT\157\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX'\DC2\EOT\158\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX'\SOH\DC2\EOT\158\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX'\STX\DC2\EOT\158\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX(\DC2\EOT\159\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STX(\SOH\DC2\EOT\159\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX(\STX\DC2\EOT\159\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STX)\DC2\EOT\160\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STX)\SOH\DC2\EOT\160\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX)\STX\DC2\EOT\160\ACK\f\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX*\DC2\EOT\161\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX*\SOH\DC2\EOT\161\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX*\STX\DC2\EOT\161\ACK\n\
    \\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX+\DC2\EOT\162\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX+\SOH\DC2\EOT\162\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX+\STX\DC2\EOT\162\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX,\DC2\EOT\163\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX,\SOH\DC2\EOT\163\ACK\STX\ETX\n\
    \\r\n\
    \\ENQ\ENQ\a\STX,\STX\DC2\EOT\163\ACK\ACK\b\n\
    \\f\n\
    \\EOT\ENQ\a\STX-\DC2\EOT\164\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX-\SOH\DC2\EOT\164\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX-\STX\DC2\EOT\164\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX.\DC2\EOT\165\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX.\SOH\DC2\EOT\165\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX.\STX\DC2\EOT\165\ACK\t\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX/\DC2\EOT\166\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STX/\SOH\DC2\EOT\166\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX/\STX\DC2\EOT\166\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STX0\DC2\EOT\167\ACK\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\a\STX0\SOH\DC2\EOT\167\ACK\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\a\STX0\STX\DC2\EOT\167\ACK\DC4\SYN\n\
    \\f\n\
    \\EOT\ENQ\a\STX1\DC2\EOT\168\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STX1\SOH\DC2\EOT\168\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STX1\STX\DC2\EOT\168\ACK\f\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX2\DC2\EOT\169\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX2\SOH\DC2\EOT\169\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX2\STX\DC2\EOT\169\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX3\DC2\EOT\170\ACK\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\a\STX3\SOH\DC2\EOT\170\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX3\STX\DC2\EOT\170\ACK\r\DLE\n\
    \\f\n\
    \\EOT\ENQ\a\STX4\DC2\EOT\171\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX4\SOH\DC2\EOT\171\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX4\STX\DC2\EOT\171\ACK\v\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX5\DC2\EOT\172\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX5\SOH\DC2\EOT\172\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX5\STX\DC2\EOT\172\ACK\n\
    \\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX6\DC2\EOT\173\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX6\SOH\DC2\EOT\173\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX6\STX\DC2\EOT\173\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX7\DC2\EOT\174\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX7\SOH\DC2\EOT\174\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX7\STX\DC2\EOT\174\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX8\DC2\EOT\175\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX8\SOH\DC2\EOT\175\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX8\STX\DC2\EOT\175\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX9\DC2\EOT\176\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX9\SOH\DC2\EOT\176\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX9\STX\DC2\EOT\176\ACK\t\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX:\DC2\EOT\177\ACK\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\a\STX:\SOH\DC2\EOT\177\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX:\STX\DC2\EOT\177\ACK\r\SI\n\
    \\f\n\
    \\EOT\ENQ\a\STX;\DC2\EOT\178\ACK\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\a\STX;\SOH\DC2\EOT\178\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX;\STX\DC2\EOT\178\ACK\r\SI\n\
    \\f\n\
    \\EOT\ENQ\a\STX<\DC2\EOT\179\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX<\SOH\DC2\EOT\179\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX<\STX\DC2\EOT\179\ACK\v\r\n\
    \(\n\
    \\EOT\ENQ\a\STX=\DC2\EOT\180\ACK\STX\SI\"\SUB https://nickel-lang.org/\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX=\SOH\DC2\EOT\180\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX=\STX\DC2\EOT\180\ACK\v\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX>\DC2\EOT\181\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STX>\SOH\DC2\EOT\181\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX>\STX\DC2\EOT\181\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STX?\DC2\EOT\182\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX?\SOH\DC2\EOT\182\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX?\STX\DC2\EOT\182\ACK\n\
    \\f\n\
    \\f\n\
    \\EOT\ENQ\a\STX@\DC2\EOT\183\ACK\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\a\STX@\SOH\DC2\EOT\183\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STX@\STX\DC2\EOT\183\ACK\DLE\DC2\n\
    \\f\n\
    \\EOT\ENQ\a\STXA\DC2\EOT\184\ACK\STX\NAK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXA\SOH\DC2\EOT\184\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STXA\STX\DC2\EOT\184\ACK\DC2\DC4\n\
    \\f\n\
    \\EOT\ENQ\a\STXB\DC2\EOT\185\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STXB\SOH\DC2\EOT\185\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STXB\STX\DC2\EOT\185\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STXC\DC2\EOT\186\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXC\SOH\DC2\EOT\186\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXC\STX\DC2\EOT\186\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXD\DC2\EOT\187\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STXD\SOH\DC2\EOT\187\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STXD\STX\DC2\EOT\187\ACK\n\
    \\f\n\
    \\f\n\
    \\EOT\ENQ\a\STXE\DC2\EOT\188\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXE\SOH\DC2\EOT\188\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXE\STX\DC2\EOT\188\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXF\DC2\EOT\189\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STXF\SOH\DC2\EOT\189\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXF\STX\DC2\EOT\189\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STXG\DC2\EOT\190\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STXG\SOH\DC2\EOT\190\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STXG\STX\DC2\EOT\190\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STXH\DC2\EOT\191\ACK\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\a\STXH\SOH\DC2\EOT\191\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STXH\STX\DC2\EOT\191\ACK\r\DLE\n\
    \\f\n\
    \\EOT\ENQ\a\STXI\DC2\EOT\192\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STXI\SOH\DC2\EOT\192\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STXI\STX\DC2\EOT\192\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STXJ\DC2\EOT\193\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STXJ\SOH\DC2\EOT\193\ACK\STX\ETX\n\
    \\r\n\
    \\ENQ\ENQ\a\STXJ\STX\DC2\EOT\193\ACK\ACK\b\n\
    \\f\n\
    \\EOT\ENQ\a\STXK\DC2\EOT\194\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STXK\SOH\DC2\EOT\194\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STXK\STX\DC2\EOT\194\ACK\v\r\n\
    \\f\n\
    \\EOT\ENQ\a\STXL\DC2\EOT\195\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXL\SOH\DC2\EOT\195\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXL\STX\DC2\EOT\195\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXM\DC2\EOT\196\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STXM\SOH\DC2\EOT\196\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STXM\STX\DC2\EOT\196\ACK\n\
    \\f\n\
    \2\n\
    \\EOT\ENQ\a\STXN\DC2\EOT\197\ACK\STX\SO\"$ Internal language for testing SCIP\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STXN\SOH\DC2\EOT\197\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STXN\STX\DC2\EOT\197\ACK\n\
    \\r\n\
    \\f\n\
    \\EOT\ENQ\a\STXO\DC2\EOT\198\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXO\SOH\DC2\EOT\198\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXO\STX\DC2\EOT\198\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXP\DC2\EOT\199\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXP\SOH\DC2\EOT\199\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXP\STX\DC2\EOT\199\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXQ\DC2\EOT\200\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXQ\SOH\DC2\EOT\200\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXQ\STX\DC2\EOT\200\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXR\DC2\EOT\201\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXR\SOH\DC2\EOT\201\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXR\STX\DC2\EOT\201\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXS\DC2\EOT\202\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXS\SOH\DC2\EOT\202\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXS\STX\DC2\EOT\202\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXT\DC2\EOT\203\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXT\SOH\DC2\EOT\203\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXT\STX\DC2\EOT\203\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXU\DC2\EOT\204\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXU\SOH\DC2\EOT\204\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXU\STX\DC2\EOT\204\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXV\DC2\EOT\205\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXV\SOH\DC2\EOT\205\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXV\STX\DC2\EOT\205\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXW\DC2\EOT\206\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXW\SOH\DC2\EOT\206\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STXW\STX\DC2\EOT\206\ACK\n\
    \\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXX\DC2\EOT\207\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STXX\SOH\DC2\EOT\207\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STXX\STX\DC2\EOT\207\ACK\v\r\n\
    \\DC4\n\
    \\EOT\ENQ\a\STXY\DC2\EOT\208\ACK\STX\DC3\"\ACK Bash\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STXY\SOH\DC2\EOT\208\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STXY\STX\DC2\EOT\208\ACK\DLE\DC2\n\
    \\f\n\
    \\EOT\ENQ\a\STXZ\DC2\EOT\209\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STXZ\SOH\DC2\EOT\209\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STXZ\STX\DC2\EOT\209\ACK\f\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX[\DC2\EOT\210\ACK\STX\SO\n\
    \\r\n\
    \\ENQ\ENQ\a\STX[\SOH\DC2\EOT\210\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX[\STX\DC2\EOT\210\ACK\n\
    \\r\n\
    \\f\n\
    \\EOT\ENQ\a\STX\\\DC2\EOT\211\ACK\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\\\SOH\DC2\EOT\211\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STX\\\STX\DC2\EOT\211\ACK\r\SI\n\
    \\f\n\
    \\EOT\ENQ\a\STX]\DC2\EOT\212\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STX]\SOH\DC2\EOT\212\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STX]\STX\DC2\EOT\212\ACK\v\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STX^\DC2\EOT\213\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX^\SOH\DC2\EOT\213\ACK\STX\a\n\
    \\r\n\
    \\ENQ\ENQ\a\STX^\STX\DC2\EOT\213\ACK\n\
    \\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX_\DC2\EOT\214\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX_\SOH\DC2\EOT\214\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STX_\STX\DC2\EOT\214\ACK\b\v\n\
    \\f\n\
    \\EOT\ENQ\a\STX`\DC2\EOT\215\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STX`\SOH\DC2\EOT\215\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STX`\STX\DC2\EOT\215\ACK\t\v\n\
    \\f\n\
    \\EOT\ENQ\a\STXa\DC2\EOT\216\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXa\SOH\DC2\EOT\216\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXa\STX\DC2\EOT\216\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXb\DC2\EOT\217\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STXb\SOH\DC2\EOT\217\ACK\STX\b\n\
    \\r\n\
    \\ENQ\ENQ\a\STXb\STX\DC2\EOT\217\ACK\v\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STXc\DC2\EOT\218\ACK\STX\DC2\n\
    \\r\n\
    \\ENQ\ENQ\a\STXc\SOH\DC2\EOT\218\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXc\STX\DC2\EOT\218\ACK\SI\DC1\n\
    \\f\n\
    \\EOT\ENQ\a\STXd\DC2\EOT\219\ACK\STX\ETB\n\
    \\r\n\
    \\ENQ\ENQ\a\STXd\SOH\DC2\EOT\219\ACK\STX\DC1\n\
    \\r\n\
    \\ENQ\ENQ\a\STXd\STX\DC2\EOT\219\ACK\DC4\SYN\n\
    \\f\n\
    \\EOT\ENQ\a\STXe\DC2\EOT\220\ACK\STX\DLE\n\
    \\r\n\
    \\ENQ\ENQ\a\STXe\SOH\DC2\EOT\220\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STXe\STX\DC2\EOT\220\ACK\f\SI\n\
    \\f\n\
    \\EOT\ENQ\a\STXf\DC2\EOT\221\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STXf\SOH\DC2\EOT\221\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXf\STX\DC2\EOT\221\ACK\t\f\n\
    \\f\n\
    \\EOT\ENQ\a\STXg\DC2\EOT\222\ACK\STX\DC3\n\
    \\r\n\
    \\ENQ\ENQ\a\STXg\SOH\DC2\EOT\222\ACK\STX\r\n\
    \\r\n\
    \\ENQ\ENQ\a\STXg\STX\DC2\EOT\222\ACK\DLE\DC2\n\
    \\f\n\
    \\EOT\ENQ\a\STXh\DC2\EOT\223\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXh\SOH\DC2\EOT\223\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXh\STX\DC2\EOT\223\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXi\DC2\EOT\224\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\ENQ\a\STXi\SOH\DC2\EOT\224\ACK\STX\t\n\
    \\r\n\
    \\ENQ\ENQ\a\STXi\STX\DC2\EOT\224\ACK\f\SO\n\
    \\f\n\
    \\EOT\ENQ\a\STXj\DC2\EOT\225\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXj\SOH\DC2\EOT\225\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXj\STX\DC2\EOT\225\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXk\DC2\EOT\226\ACK\STX\v\n\
    \\r\n\
    \\ENQ\ENQ\a\STXk\SOH\DC2\EOT\226\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXk\STX\DC2\EOT\226\ACK\b\n\
    \\n\
    \\f\n\
    \\EOT\ENQ\a\STXl\DC2\EOT\227\ACK\STX\f\n\
    \\r\n\
    \\ENQ\ENQ\a\STXl\SOH\DC2\EOT\227\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\ENQ\a\STXl\STX\DC2\EOT\227\ACK\t\v\n\
    \\147\ETX\n\
    \\EOT\ENQ\a\STXm\DC2\EOT\228\ACK\STX\v\"\132\ETX NextLanguage = 111;\n\
    \ Steps add a new language:\n\
    \ 1. Copy-paste the \"NextLanguage = N\" line above\n\
    \ 2. Increment \"NextLanguage = N\" to \"NextLanguage = N+1\"\n\
    \ 3. Replace \"NextLanguage = N\" with the name of the new language.\n\
    \ 4. Move the new language to the correct line above using alphabetical order\n\
    \ 5. (optional) Add a brief comment behind the language if the name is not self-explanatory\n\
    \\n\
    \\r\n\
    \\ENQ\ENQ\a\STXm\SOH\DC2\EOT\228\ACK\STX\ENQ\n\
    \\r\n\
    \\ENQ\ENQ\a\STXm\STX\DC2\EOT\228\ACK\b\n\
    \\n\
    \\f\n\
    \\STX\EOT\v\DC2\ACK\239\ACK\NUL\241\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\v\SOH\DC2\EOT\239\ACK\b\DC2\n\
    \\f\n\
    \\EOT\EOT\v\STX\NUL\DC2\EOT\240\ACK\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ACK\DC2\EOT\240\ACK\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\SOH\DC2\EOT\240\ACK\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\v\STX\NUL\ETX\DC2\EOT\240\ACK\r\SO\n\
    \\f\n\
    \\STX\EOT\f\DC2\ACK\243\ACK\NUL\246\ACK\SOH\n\
    \\v\n\
    \\ETX\EOT\f\SOH\DC2\EOT\243\ACK\b\r\n\
    \\f\n\
    \\EOT\EOT\f\STX\NUL\DC2\EOT\244\ACK\STX\US\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\EOT\DC2\EOT\244\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ENQ\DC2\EOT\244\ACK\v\DC1\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\SOH\DC2\EOT\244\ACK\DC2\SUB\n\
    \\r\n\
    \\ENQ\EOT\f\STX\NUL\ETX\DC2\EOT\244\ACK\GS\RS\n\
    \\f\n\
    \\EOT\EOT\f\STX\SOH\DC2\EOT\245\ACK\STX+\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\EOT\DC2\EOT\245\ACK\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ACK\DC2\EOT\245\ACK\v\FS\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\SOH\DC2\EOT\245\ACK\GS&\n\
    \\r\n\
    \\ENQ\EOT\f\STX\SOH\ETX\DC2\EOT\245\ACK)*\n\
    \\f\n\
    \\STX\EOT\r\DC2\ACK\248\ACK\NUL\140\a\SOH\n\
    \\v\n\
    \\ETX\EOT\r\SOH\DC2\EOT\248\ACK\b\f\n\
    \\v\n\
    \\ETX\EOT\r\t\DC2\EOT\249\ACK\STX)\n\
    \\f\n\
    \\EOT\EOT\r\t\NUL\DC2\EOT\249\ACK\v\f\n\
    \\r\n\
    \\ENQ\EOT\r\t\NUL\SOH\DC2\EOT\249\ACK\v\f\n\
    \\r\n\
    \\ENQ\EOT\r\t\NUL\STX\DC2\EOT\249\ACK\v\f\n\
    \\f\n\
    \\EOT\EOT\r\t\SOH\DC2\EOT\249\ACK\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\r\t\SOH\SOH\DC2\EOT\249\ACK\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\r\t\SOH\STX\DC2\EOT\249\ACK\SO\SI\n\
    \\f\n\
    \\EOT\EOT\r\t\STX\DC2\EOT\249\ACK\DC1\DC2\n\
    \\r\n\
    \\ENQ\EOT\r\t\STX\SOH\DC2\EOT\249\ACK\DC1\DC2\n\
    \\r\n\
    \\ENQ\EOT\r\t\STX\STX\DC2\EOT\249\ACK\DC1\DC2\n\
    \\f\n\
    \\EOT\EOT\r\t\ETX\DC2\EOT\249\ACK\DC4\NAK\n\
    \\r\n\
    \\ENQ\EOT\r\t\ETX\SOH\DC2\EOT\249\ACK\DC4\NAK\n\
    \\r\n\
    \\ENQ\EOT\r\t\ETX\STX\DC2\EOT\249\ACK\DC4\NAK\n\
    \\f\n\
    \\EOT\EOT\r\t\EOT\DC2\EOT\249\ACK\ETB\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\t\EOT\SOH\DC2\EOT\249\ACK\ETB\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\t\EOT\STX\DC2\EOT\249\ACK\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\r\t\ENQ\DC2\EOT\249\ACK\SUB\FS\n\
    \\r\n\
    \\ENQ\EOT\r\t\ENQ\SOH\DC2\EOT\249\ACK\SUB\FS\n\
    \\r\n\
    \\ENQ\EOT\r\t\ENQ\STX\DC2\EOT\249\ACK\SUB\FS\n\
    \\f\n\
    \\EOT\EOT\r\t\ACK\DC2\EOT\249\ACK\RS \n\
    \\r\n\
    \\ENQ\EOT\r\t\ACK\SOH\DC2\EOT\249\ACK\RS \n\
    \\r\n\
    \\ENQ\EOT\r\t\ACK\STX\DC2\EOT\249\ACK\RS \n\
    \\f\n\
    \\EOT\EOT\r\t\a\DC2\EOT\249\ACK\"$\n\
    \\r\n\
    \\ENQ\EOT\r\t\a\SOH\DC2\EOT\249\ACK\"$\n\
    \\r\n\
    \\ENQ\EOT\r\t\a\STX\DC2\EOT\249\ACK\"$\n\
    \\f\n\
    \\EOT\EOT\r\t\b\DC2\EOT\249\ACK&(\n\
    \\r\n\
    \\ENQ\EOT\r\t\b\SOH\DC2\EOT\249\ACK&(\n\
    \\r\n\
    \\ENQ\EOT\r\t\b\STX\DC2\EOT\249\ACK&(\n\
    \\SO\n\
    \\EOT\EOT\r\b\NUL\DC2\ACK\250\ACK\STX\139\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\r\b\NUL\SOH\DC2\EOT\250\ACK\b\DC4\n\
    \\f\n\
    \\EOT\EOT\r\STX\NUL\DC2\EOT\251\ACK\EOT\EM\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ACK\DC2\EOT\251\ACK\EOT\v\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\SOH\DC2\EOT\251\ACK\f\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\NUL\ETX\DC2\EOT\251\ACK\ETB\CAN\n\
    \\f\n\
    \\EOT\EOT\r\STX\SOH\DC2\EOT\252\ACK\EOT \n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ACK\DC2\EOT\252\ACK\EOT\SO\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\SOH\DC2\EOT\252\ACK\SI\SUB\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SOH\ETX\DC2\EOT\252\ACK\GS\US\n\
    \\f\n\
    \\EOT\EOT\r\STX\STX\DC2\EOT\253\ACK\EOT\FS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\ACK\DC2\EOT\253\ACK\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\SOH\DC2\EOT\253\ACK\r\SYN\n\
    \\r\n\
    \\ENQ\EOT\r\STX\STX\ETX\DC2\EOT\253\ACK\EM\ESC\n\
    \\f\n\
    \\EOT\EOT\r\STX\ETX\DC2\EOT\254\ACK\EOT\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ETX\ACK\DC2\EOT\254\ACK\EOT\r\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ETX\SOH\DC2\EOT\254\ACK\SO\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ETX\ETX\DC2\EOT\254\ACK\ESC\GS\n\
    \\f\n\
    \\EOT\EOT\r\STX\EOT\DC2\EOT\255\ACK\EOT$\n\
    \\r\n\
    \\ENQ\EOT\r\STX\EOT\ACK\DC2\EOT\255\ACK\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\r\STX\EOT\SOH\DC2\EOT\255\ACK\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\EOT\ETX\DC2\EOT\255\ACK!#\n\
    \\f\n\
    \\EOT\EOT\r\STX\ENQ\DC2\EOT\128\a\EOT,\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ENQ\ACK\DC2\EOT\128\a\EOT\DC4\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ENQ\SOH\DC2\EOT\128\a\NAK&\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ENQ\ETX\DC2\EOT\128\a)+\n\
    \\f\n\
    \\EOT\EOT\r\STX\ACK\DC2\EOT\129\a\EOT\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ACK\ACK\DC2\EOT\129\a\EOT\r\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ACK\SOH\DC2\EOT\129\a\SO\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\STX\ACK\ETX\DC2\EOT\129\a\ESC\GS\n\
    \\f\n\
    \\EOT\EOT\r\STX\a\DC2\EOT\130\a\EOT\FS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\a\ACK\DC2\EOT\130\a\EOT\f\n\
    \\r\n\
    \\ENQ\EOT\r\STX\a\SOH\DC2\EOT\130\a\r\SYN\n\
    \\r\n\
    \\ENQ\EOT\r\STX\a\ETX\DC2\EOT\130\a\EM\ESC\n\
    \\f\n\
    \\EOT\EOT\r\STX\b\DC2\EOT\131\a\EOT'\n\
    \\r\n\
    \\ENQ\EOT\r\STX\b\ACK\DC2\EOT\131\a\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\r\STX\b\SOH\DC2\EOT\131\a\DC3\"\n\
    \\r\n\
    \\ENQ\EOT\r\STX\b\ETX\DC2\EOT\131\a%&\n\
    \\f\n\
    \\EOT\EOT\r\STX\t\DC2\EOT\132\a\EOT%\n\
    \\r\n\
    \\ENQ\EOT\r\STX\t\ACK\DC2\EOT\132\a\EOT\DC1\n\
    \\r\n\
    \\ENQ\EOT\r\STX\t\SOH\DC2\EOT\132\a\DC2 \n\
    \\r\n\
    \\ENQ\EOT\r\STX\t\ETX\DC2\EOT\132\a#$\n\
    \\f\n\
    \\EOT\EOT\r\STX\n\
    \\DC2\EOT\133\a\EOT)\n\
    \\r\n\
    \\ENQ\EOT\r\STX\n\
    \\ACK\DC2\EOT\133\a\EOT\DC3\n\
    \\r\n\
    \\ENQ\EOT\r\STX\n\
    \\SOH\DC2\EOT\133\a\DC4$\n\
    \\r\n\
    \\ENQ\EOT\r\STX\n\
    \\ETX\DC2\EOT\133\a'(\n\
    \\f\n\
    \\EOT\EOT\r\STX\v\DC2\EOT\134\a\EOT&\n\
    \\r\n\
    \\ENQ\EOT\r\STX\v\ACK\DC2\EOT\134\a\EOT\DC1\n\
    \\r\n\
    \\ENQ\EOT\r\STX\v\SOH\DC2\EOT\134\a\DC2 \n\
    \\r\n\
    \\ENQ\EOT\r\STX\v\ETX\DC2\EOT\134\a#%\n\
    \\f\n\
    \\EOT\EOT\r\STX\f\DC2\EOT\135\a\EOT!\n\
    \\r\n\
    \\ENQ\EOT\r\STX\f\ACK\DC2\EOT\135\a\EOT\SO\n\
    \\r\n\
    \\ENQ\EOT\r\STX\f\SOH\DC2\EOT\135\a\SI\ESC\n\
    \\r\n\
    \\ENQ\EOT\r\STX\f\ETX\DC2\EOT\135\a\RS \n\
    \\f\n\
    \\EOT\EOT\r\STX\r\DC2\EOT\136\a\EOT$\n\
    \\r\n\
    \\ENQ\EOT\r\STX\r\ACK\DC2\EOT\136\a\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\r\STX\r\SOH\DC2\EOT\136\a\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\r\ETX\DC2\EOT\136\a!#\n\
    \\f\n\
    \\EOT\EOT\r\STX\SO\DC2\EOT\137\a\EOT\RS\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SO\ACK\DC2\EOT\137\a\EOT\r\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SO\SOH\DC2\EOT\137\a\SO\CAN\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SO\ETX\DC2\EOT\137\a\ESC\GS\n\
    \\f\n\
    \\EOT\EOT\r\STX\SI\DC2\EOT\138\a\EOT \n\
    \\r\n\
    \\ENQ\EOT\r\STX\SI\ACK\DC2\EOT\138\a\EOT\SO\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SI\SOH\DC2\EOT\138\a\SI\SUB\n\
    \\r\n\
    \\ENQ\EOT\r\STX\SI\ETX\DC2\EOT\138\a\GS\US\n\
    \\f\n\
    \\STX\EOT\SO\DC2\ACK\142\a\NUL\145\a\SOH\n\
    \\v\n\
    \\ETX\EOT\SO\SOH\DC2\EOT\142\a\b\DC2\n\
    \\f\n\
    \\EOT\EOT\SO\STX\NUL\DC2\EOT\143\a\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ACK\DC2\EOT\143\a\STX\a\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\SOH\DC2\EOT\143\a\b\DC2\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\NUL\ETX\DC2\EOT\143\a\NAK\SYN\n\
    \\f\n\
    \\EOT\EOT\SO\STX\SOH\DC2\EOT\144\a\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ACK\DC2\EOT\144\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\SOH\DC2\EOT\144\a\a\DC2\n\
    \\r\n\
    \\ENQ\EOT\SO\STX\SOH\ETX\DC2\EOT\144\a\NAK\SYN\n\
    \\f\n\
    \\STX\EOT\SI\DC2\ACK\147\a\NUL\151\a\SOH\n\
    \\v\n\
    \\ETX\EOT\SI\SOH\DC2\EOT\147\a\b\SI\n\
    \\f\n\
    \\EOT\EOT\SI\STX\NUL\DC2\EOT\148\a\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\ACK\DC2\EOT\148\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\SOH\DC2\EOT\148\a\a\r\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\NUL\ETX\DC2\EOT\148\a\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\SI\STX\SOH\DC2\EOT\149\a\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\ENQ\DC2\EOT\149\a\STX\b\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\SOH\DC2\EOT\149\a\t\SI\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\SOH\ETX\DC2\EOT\149\a\DC2\DC3\n\
    \\f\n\
    \\EOT\EOT\SI\STX\STX\DC2\EOT\150\a\STX#\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\EOT\DC2\EOT\150\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\ACK\DC2\EOT\150\a\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\SOH\DC2\EOT\150\a\DLE\RS\n\
    \\r\n\
    \\ENQ\EOT\SI\STX\STX\ETX\DC2\EOT\150\a!\"\n\
    \\f\n\
    \\STX\EOT\DLE\DC2\ACK\153\a\NUL\156\a\SOH\n\
    \\v\n\
    \\ETX\EOT\DLE\SOH\DC2\EOT\153\a\b\DC2\n\
    \\f\n\
    \\EOT\EOT\DLE\STX\NUL\DC2\EOT\154\a\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ACK\DC2\EOT\154\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\SOH\DC2\EOT\154\a\a\r\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\NUL\ETX\DC2\EOT\154\a\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\DLE\STX\SOH\DC2\EOT\155\a\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ENQ\DC2\EOT\155\a\STX\b\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\SOH\DC2\EOT\155\a\t\SI\n\
    \\r\n\
    \\ENQ\EOT\DLE\STX\SOH\ETX\DC2\EOT\155\a\DC2\DC3\n\
    \\f\n\
    \\STX\EOT\DC1\DC2\ACK\158\a\NUL\160\a\SOH\n\
    \\v\n\
    \\ETX\EOT\DC1\SOH\DC2\EOT\158\a\b\DLE\n\
    \\f\n\
    \\EOT\EOT\DC1\STX\NUL\DC2\EOT\159\a\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ENQ\DC2\EOT\159\a\STX\b\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\SOH\DC2\EOT\159\a\t\SI\n\
    \\r\n\
    \\ENQ\EOT\DC1\STX\NUL\ETX\DC2\EOT\159\a\DC2\DC3\n\
    \\f\n\
    \\STX\EOT\DC2\DC2\ACK\162\a\NUL\165\a\SOH\n\
    \\v\n\
    \\ETX\EOT\DC2\SOH\DC2\EOT\162\a\b\DC1\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\NUL\DC2\EOT\163\a\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ACK\DC2\EOT\163\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\SOH\DC2\EOT\163\a\a\r\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\NUL\ETX\DC2\EOT\163\a\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\DC2\STX\SOH\DC2\EOT\164\a\STX\DC4\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ENQ\DC2\EOT\164\a\STX\b\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\SOH\DC2\EOT\164\a\t\SI\n\
    \\r\n\
    \\ENQ\EOT\DC2\STX\SOH\ETX\DC2\EOT\164\a\DC2\DC3\n\
    \\f\n\
    \\STX\EOT\DC3\DC2\ACK\167\a\NUL\169\a\SOH\n\
    \\v\n\
    \\ETX\EOT\DC3\SOH\DC2\EOT\167\a\b\DC4\n\
    \\f\n\
    \\EOT\EOT\DC3\STX\NUL\DC2\EOT\168\a\STX\CAN\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ACK\DC2\EOT\168\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\SOH\DC2\EOT\168\a\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\DC3\STX\NUL\ETX\DC2\EOT\168\a\SYN\ETB\n\
    \\f\n\
    \\STX\EOT\DC4\DC2\ACK\171\a\NUL\173\a\SOH\n\
    \\v\n\
    \\ETX\EOT\DC4\SOH\DC2\EOT\171\a\b\CAN\n\
    \\f\n\
    \\EOT\EOT\DC4\STX\NUL\DC2\EOT\172\a\STX\SUB\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\EOT\DC2\EOT\172\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ACK\DC2\EOT\172\a\v\SI\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\SOH\DC2\EOT\172\a\DLE\NAK\n\
    \\r\n\
    \\ENQ\EOT\DC4\STX\NUL\ETX\DC2\EOT\172\a\CAN\EM\n\
    \\f\n\
    \\STX\EOT\NAK\DC2\ACK\175\a\NUL\177\a\SOH\n\
    \\v\n\
    \\ETX\EOT\NAK\SOH\DC2\EOT\175\a\b\DC1\n\
    \\f\n\
    \\EOT\EOT\NAK\STX\NUL\DC2\EOT\176\a\STX\SUB\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\EOT\DC2\EOT\176\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ACK\DC2\EOT\176\a\v\SI\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\SOH\DC2\EOT\176\a\DLE\NAK\n\
    \\r\n\
    \\ENQ\EOT\NAK\STX\NUL\ETX\DC2\EOT\176\a\CAN\EM\n\
    \\f\n\
    \\STX\EOT\SYN\DC2\ACK\179\a\NUL\181\a\SOH\n\
    \\v\n\
    \\ETX\EOT\SYN\SOH\DC2\EOT\179\a\b\DLE\n\
    \\f\n\
    \\EOT\EOT\SYN\STX\NUL\DC2\EOT\180\a\STX\SUB\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\EOT\DC2\EOT\180\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ACK\DC2\EOT\180\a\v\SI\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\SOH\DC2\EOT\180\a\DLE\NAK\n\
    \\r\n\
    \\ENQ\EOT\SYN\STX\NUL\ETX\DC2\EOT\180\a\CAN\EM\n\
    \\f\n\
    \\STX\EOT\ETB\DC2\ACK\183\a\NUL\187\a\SOH\n\
    \\v\n\
    \\ETX\EOT\ETB\SOH\DC2\EOT\183\a\b\SYN\n\
    \\v\n\
    \\ETX\EOT\ETB\t\DC2\EOT\184\a\STX\DC3\n\
    \\f\n\
    \\EOT\EOT\ETB\t\NUL\DC2\EOT\184\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\ETB\t\NUL\SOH\DC2\EOT\184\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\ETB\t\NUL\STX\DC2\EOT\184\a\v\f\n\
    \\f\n\
    \\EOT\EOT\ETB\t\SOH\DC2\EOT\184\a\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\ETB\t\SOH\SOH\DC2\EOT\184\a\SO\SI\n\
    \\r\n\
    \\ENQ\EOT\ETB\t\SOH\STX\DC2\EOT\184\a\SO\SI\n\
    \\f\n\
    \\EOT\EOT\ETB\t\STX\DC2\EOT\184\a\DC1\DC2\n\
    \\r\n\
    \\ENQ\EOT\ETB\t\STX\SOH\DC2\EOT\184\a\DC1\DC2\n\
    \\r\n\
    \\ENQ\EOT\ETB\t\STX\STX\DC2\EOT\184\a\DC1\DC2\n\
    \\f\n\
    \\EOT\EOT\ETB\STX\NUL\DC2\EOT\185\a\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\NUL\ACK\DC2\EOT\185\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\NUL\SOH\DC2\EOT\185\a\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\NUL\ETX\DC2\EOT\185\a\r\SO\n\
    \\f\n\
    \\EOT\EOT\ETB\STX\SOH\DC2\EOT\186\a\STX\EM\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\SOH\ACK\DC2\EOT\186\a\STX\a\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\SOH\SOH\DC2\EOT\186\a\b\DC4\n\
    \\r\n\
    \\ENQ\EOT\ETB\STX\SOH\ETX\DC2\EOT\186\a\ETB\CAN\n\
    \\f\n\
    \\STX\EOT\CAN\DC2\ACK\189\a\NUL\193\a\SOH\n\
    \\v\n\
    \\ETX\EOT\CAN\SOH\DC2\EOT\189\a\b\NAK\n\
    \\v\n\
    \\ETX\EOT\CAN\t\DC2\EOT\190\a\STX\r\n\
    \\f\n\
    \\EOT\EOT\CAN\t\NUL\DC2\EOT\190\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\CAN\t\NUL\SOH\DC2\EOT\190\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\CAN\t\NUL\STX\DC2\EOT\190\a\v\f\n\
    \\f\n\
    \\EOT\EOT\CAN\STX\NUL\DC2\EOT\191\a\STX&\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\EOT\DC2\EOT\191\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\ACK\DC2\EOT\191\a\v\NAK\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\SOH\DC2\EOT\191\a\SYN!\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\NUL\ETX\DC2\EOT\191\a$%\n\
    \\f\n\
    \\EOT\EOT\CAN\STX\SOH\DC2\EOT\192\a\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\ACK\DC2\EOT\192\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\SOH\DC2\EOT\192\a\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\CAN\STX\SOH\ETX\DC2\EOT\192\a\r\SO\n\
    \\f\n\
    \\STX\EOT\EM\DC2\ACK\195\a\NUL\199\a\SOH\n\
    \\v\n\
    \\ETX\EOT\EM\SOH\DC2\EOT\195\a\b\ETB\n\
    \\v\n\
    \\ETX\EOT\EM\t\DC2\EOT\196\a\STX\r\n\
    \\f\n\
    \\EOT\EOT\EM\t\NUL\DC2\EOT\196\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\EM\t\NUL\SOH\DC2\EOT\196\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\EM\t\NUL\STX\DC2\EOT\196\a\v\f\n\
    \\f\n\
    \\EOT\EOT\EM\STX\NUL\DC2\EOT\197\a\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\ACK\DC2\EOT\197\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\SOH\DC2\EOT\197\a\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\NUL\ETX\DC2\EOT\197\a\r\SO\n\
    \\f\n\
    \\EOT\EOT\EM\STX\SOH\DC2\EOT\198\a\STX\EM\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\ACK\DC2\EOT\198\a\STX\a\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\SOH\DC2\EOT\198\a\b\DC4\n\
    \\r\n\
    \\ENQ\EOT\EM\STX\SOH\ETX\DC2\EOT\198\a\ETB\CAN\n\
    \\f\n\
    \\STX\EOT\SUB\DC2\ACK\201\a\NUL\205\a\SOH\n\
    \\v\n\
    \\ETX\EOT\SUB\SOH\DC2\EOT\201\a\b\NAK\n\
    \\v\n\
    \\ETX\EOT\SUB\t\DC2\EOT\202\a\STX\r\n\
    \\f\n\
    \\EOT\EOT\SUB\t\NUL\DC2\EOT\202\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\SUB\t\NUL\SOH\DC2\EOT\202\a\v\f\n\
    \\r\n\
    \\ENQ\EOT\SUB\t\NUL\STX\DC2\EOT\202\a\v\f\n\
    \\f\n\
    \\EOT\EOT\SUB\STX\NUL\DC2\EOT\203\a\STX\FS\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\NUL\ACK\DC2\EOT\203\a\STX\a\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\NUL\SOH\DC2\EOT\203\a\b\ETB\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\NUL\ETX\DC2\EOT\203\a\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT\SUB\STX\SOH\DC2\EOT\204\a\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\ACK\DC2\EOT\204\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\SOH\DC2\EOT\204\a\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\SUB\STX\SOH\ETX\DC2\EOT\204\a\r\SO\n\
    \\f\n\
    \\STX\EOT\ESC\DC2\ACK\207\a\NUL\209\a\SOH\n\
    \\v\n\
    \\ETX\EOT\ESC\SOH\DC2\EOT\207\a\b\DC2\n\
    \\f\n\
    \\EOT\EOT\ESC\STX\NUL\DC2\EOT\208\a\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\ACK\DC2\EOT\208\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\SOH\DC2\EOT\208\a\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\ESC\STX\NUL\ETX\DC2\EOT\208\a\r\SO\n\
    \\f\n\
    \\STX\EOT\FS\DC2\ACK\211\a\NUL\213\a\SOH\n\
    \\v\n\
    \\ETX\EOT\FS\SOH\DC2\EOT\211\a\b\DC4\n\
    \\f\n\
    \\EOT\EOT\FS\STX\NUL\DC2\EOT\212\a\STX\SI\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\ACK\DC2\EOT\212\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\SOH\DC2\EOT\212\a\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\FS\STX\NUL\ETX\DC2\EOT\212\a\r\SO\n\
    \\f\n\
    \\STX\EOT\GS\DC2\ACK\215\a\NUL\222\a\SOH\n\
    \\v\n\
    \\ETX\EOT\GS\SOH\DC2\EOT\215\a\b\DC1\n\
    \\SO\n\
    \\EOT\EOT\GS\ETX\NUL\DC2\ACK\216\a\STX\219\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\GS\ETX\NUL\SOH\DC2\EOT\216\a\n\
    \\DC2\n\
    \\SO\n\
    \\ACK\EOT\GS\ETX\NUL\STX\NUL\DC2\EOT\217\a\EOT\DC1\n\
    \\SI\n\
    \\a\EOT\GS\ETX\NUL\STX\NUL\ACK\DC2\EOT\217\a\EOT\b\n\
    \\SI\n\
    \\a\EOT\GS\ETX\NUL\STX\NUL\SOH\DC2\EOT\217\a\t\f\n\
    \\SI\n\
    \\a\EOT\GS\ETX\NUL\STX\NUL\ETX\DC2\EOT\217\a\SI\DLE\n\
    \\SO\n\
    \\ACK\EOT\GS\ETX\NUL\STX\SOH\DC2\EOT\218\a\EOT\DC2\n\
    \\SI\n\
    \\a\EOT\GS\ETX\NUL\STX\SOH\ACK\DC2\EOT\218\a\EOT\b\n\
    \\SI\n\
    \\a\EOT\GS\ETX\NUL\STX\SOH\SOH\DC2\EOT\218\a\t\r\n\
    \\SI\n\
    \\a\EOT\GS\ETX\NUL\STX\SOH\ETX\DC2\EOT\218\a\DLE\DC1\n\
    \\f\n\
    \\EOT\EOT\GS\STX\NUL\DC2\EOT\220\a\STX\NAK\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\ACK\DC2\EOT\220\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\SOH\DC2\EOT\220\a\a\DLE\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\NUL\ETX\DC2\EOT\220\a\DC3\DC4\n\
    \\f\n\
    \\EOT\EOT\GS\STX\SOH\DC2\EOT\221\a\STX\RS\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\EOT\DC2\EOT\221\a\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\ACK\DC2\EOT\221\a\v\DC3\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\SOH\DC2\EOT\221\a\DC4\EM\n\
    \\r\n\
    \\ENQ\EOT\GS\STX\SOH\ETX\DC2\EOT\221\a\FS\GS\n\
    \\f\n\
    \\STX\EOT\RS\DC2\ACK\224\a\NUL\238\a\SOH\n\
    \\v\n\
    \\ETX\EOT\RS\SOH\DC2\EOT\224\a\b\DLE\n\
    \\SO\n\
    \\EOT\EOT\RS\b\NUL\DC2\ACK\225\a\STX\237\a\ETX\n\
    \\r\n\
    \\ENQ\EOT\RS\b\NUL\SOH\DC2\EOT\225\a\b\DC4\n\
    \\f\n\
    \\EOT\EOT\RS\STX\NUL\DC2\EOT\226\a\EOT#\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\NUL\ACK\DC2\EOT\226\a\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\NUL\SOH\DC2\EOT\226\a\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\NUL\ETX\DC2\EOT\226\a!\"\n\
    \\f\n\
    \\EOT\EOT\RS\STX\SOH\DC2\EOT\227\a\EOT)\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\SOH\ACK\DC2\EOT\227\a\EOT\DC3\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\SOH\SOH\DC2\EOT\227\a\DC4$\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\SOH\ETX\DC2\EOT\227\a'(\n\
    \\f\n\
    \\EOT\EOT\RS\STX\STX\DC2\EOT\228\a\EOT#\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\STX\ACK\DC2\EOT\228\a\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\STX\SOH\DC2\EOT\228\a\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\STX\ETX\DC2\EOT\228\a!\"\n\
    \\f\n\
    \\EOT\EOT\RS\STX\ETX\DC2\EOT\229\a\EOT%\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ETX\ACK\DC2\EOT\229\a\EOT\DC1\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ETX\SOH\DC2\EOT\229\a\DC2 \n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ETX\ETX\DC2\EOT\229\a#$\n\
    \\f\n\
    \\EOT\EOT\RS\STX\EOT\DC2\EOT\230\a\EOT#\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\EOT\ACK\DC2\EOT\230\a\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\EOT\SOH\DC2\EOT\230\a\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\EOT\ETX\DC2\EOT\230\a!\"\n\
    \\f\n\
    \\EOT\EOT\RS\STX\ENQ\DC2\EOT\231\a\EOT!\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ENQ\ACK\DC2\EOT\231\a\EOT\SI\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ENQ\SOH\DC2\EOT\231\a\DLE\FS\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ENQ\ETX\DC2\EOT\231\a\US \n\
    \\f\n\
    \\EOT\EOT\RS\STX\ACK\DC2\EOT\232\a\EOT#\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ACK\ACK\DC2\EOT\232\a\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ACK\SOH\DC2\EOT\232\a\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\ACK\ETX\DC2\EOT\232\a!\"\n\
    \\f\n\
    \\EOT\EOT\RS\STX\a\DC2\EOT\233\a\EOT%\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\a\ACK\DC2\EOT\233\a\EOT\DC1\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\a\SOH\DC2\EOT\233\a\DC2 \n\
    \\r\n\
    \\ENQ\EOT\RS\STX\a\ETX\DC2\EOT\233\a#$\n\
    \\f\n\
    \\EOT\EOT\RS\STX\b\DC2\EOT\234\a\EOT'\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\b\ACK\DC2\EOT\234\a\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\b\SOH\DC2\EOT\234\a\DC3\"\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\b\ETX\DC2\EOT\234\a%&\n\
    \\f\n\
    \\EOT\EOT\RS\STX\t\DC2\EOT\235\a\EOT(\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\t\ACK\DC2\EOT\235\a\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\t\SOH\DC2\EOT\235\a\DC3\"\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\t\ETX\DC2\EOT\235\a%'\n\
    \\f\n\
    \\EOT\EOT\RS\STX\n\
    \\DC2\EOT\236\a\EOT$\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\n\
    \\ACK\DC2\EOT\236\a\EOT\DLE\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\n\
    \\SOH\DC2\EOT\236\a\DC1\RS\n\
    \\r\n\
    \\ENQ\EOT\RS\STX\n\
    \\ETX\DC2\EOT\236\a!#\n\
    \\f\n\
    \\STX\EOT\US\DC2\ACK\240\a\NUL\241\a\SOH\n\
    \\v\n\
    \\ETX\EOT\US\SOH\DC2\EOT\240\a\b\DC4\n\
    \\f\n\
    \\STX\EOT \DC2\ACK\243\a\NUL\245\a\SOH\n\
    \\v\n\
    \\ETX\EOT \SOH\DC2\EOT\243\a\b\ETB\n\
    \\f\n\
    \\EOT\EOT \STX\NUL\DC2\EOT\244\a\STX\DC1\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\ENQ\DC2\EOT\244\a\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\SOH\DC2\EOT\244\a\a\f\n\
    \\r\n\
    \\ENQ\EOT \STX\NUL\ETX\DC2\EOT\244\a\SI\DLE\n\
    \\f\n\
    \\STX\EOT!\DC2\ACK\247\a\NUL\249\a\SOH\n\
    \\v\n\
    \\ETX\EOT!\SOH\DC2\EOT\247\a\b\DC4\n\
    \\f\n\
    \\EOT\EOT!\STX\NUL\DC2\EOT\248\a\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\ENQ\DC2\EOT\248\a\STX\a\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\SOH\DC2\EOT\248\a\b\r\n\
    \\r\n\
    \\ENQ\EOT!\STX\NUL\ETX\DC2\EOT\248\a\DLE\DC1\n\
    \\f\n\
    \\STX\EOT\"\DC2\ACK\251\a\NUL\253\a\SOH\n\
    \\v\n\
    \\ETX\EOT\"\SOH\DC2\EOT\251\a\b\NAK\n\
    \\f\n\
    \\EOT\EOT\"\STX\NUL\DC2\EOT\252\a\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT\"\STX\NUL\ENQ\DC2\EOT\252\a\STX\a\n\
    \\r\n\
    \\ENQ\EOT\"\STX\NUL\SOH\DC2\EOT\252\a\b\r\n\
    \\r\n\
    \\ENQ\EOT\"\STX\NUL\ETX\DC2\EOT\252\a\DLE\DC1\n\
    \\f\n\
    \\STX\EOT#\DC2\ACK\255\a\NUL\129\b\SOH\n\
    \\v\n\
    \\ETX\EOT#\SOH\DC2\EOT\255\a\b\DC4\n\
    \\f\n\
    \\EOT\EOT#\STX\NUL\DC2\EOT\128\b\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT#\STX\NUL\ENQ\DC2\EOT\128\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT#\STX\NUL\SOH\DC2\EOT\128\b\b\r\n\
    \\r\n\
    \\ENQ\EOT#\STX\NUL\ETX\DC2\EOT\128\b\DLE\DC1\n\
    \\f\n\
    \\STX\EOT$\DC2\ACK\131\b\NUL\133\b\SOH\n\
    \\v\n\
    \\ETX\EOT$\SOH\DC2\EOT\131\b\b\DC3\n\
    \\f\n\
    \\EOT\EOT$\STX\NUL\DC2\EOT\132\b\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT$\STX\NUL\ENQ\DC2\EOT\132\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT$\STX\NUL\SOH\DC2\EOT\132\b\b\r\n\
    \\r\n\
    \\ENQ\EOT$\STX\NUL\ETX\DC2\EOT\132\b\DLE\DC1\n\
    \\f\n\
    \\STX\EOT%\DC2\ACK\135\b\NUL\137\b\SOH\n\
    \\v\n\
    \\ETX\EOT%\SOH\DC2\EOT\135\b\b\DC4\n\
    \\f\n\
    \\EOT\EOT%\STX\NUL\DC2\EOT\136\b\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT%\STX\NUL\ENQ\DC2\EOT\136\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT%\STX\NUL\SOH\DC2\EOT\136\b\b\r\n\
    \\r\n\
    \\ENQ\EOT%\STX\NUL\ETX\DC2\EOT\136\b\DLE\DC1\n\
    \\f\n\
    \\STX\EOT&\DC2\ACK\139\b\NUL\141\b\SOH\n\
    \\v\n\
    \\ETX\EOT&\SOH\DC2\EOT\139\b\b\NAK\n\
    \\f\n\
    \\EOT\EOT&\STX\NUL\DC2\EOT\140\b\STX\DC2\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\ENQ\DC2\EOT\140\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\SOH\DC2\EOT\140\b\b\r\n\
    \\r\n\
    \\ENQ\EOT&\STX\NUL\ETX\DC2\EOT\140\b\DLE\DC1\n\
    \\f\n\
    \\STX\EOT'\DC2\ACK\143\b\NUL\145\b\SOH\n\
    \\v\n\
    \\ETX\EOT'\SOH\DC2\EOT\143\b\b\SYN\n\
    \\f\n\
    \\EOT\EOT'\STX\NUL\DC2\EOT\144\b\STX\DC3\n\
    \\r\n\
    \\ENQ\EOT'\STX\NUL\ENQ\DC2\EOT\144\b\STX\b\n\
    \\r\n\
    \\ENQ\EOT'\STX\NUL\SOH\DC2\EOT\144\b\t\SO\n\
    \\r\n\
    \\ENQ\EOT'\STX\NUL\ETX\DC2\EOT\144\b\DC1\DC2\n\
    \\f\n\
    \\STX\EOT(\DC2\ACK\147\b\NUL\149\b\SOH\n\
    \\v\n\
    \\ETX\EOT(\SOH\DC2\EOT\147\b\b\SYN\n\
    \\f\n\
    \\EOT\EOT(\STX\NUL\DC2\EOT\148\b\STX\DC3\n\
    \\r\n\
    \\ENQ\EOT(\STX\NUL\ENQ\DC2\EOT\148\b\STX\b\n\
    \\r\n\
    \\ENQ\EOT(\STX\NUL\SOH\DC2\EOT\148\b\t\SO\n\
    \\r\n\
    \\ENQ\EOT(\STX\NUL\ETX\DC2\EOT\148\b\DC1\DC2\n\
    \\f\n\
    \\STX\EOT)\DC2\ACK\151\b\NUL\152\b\SOH\n\
    \\v\n\
    \\ETX\EOT)\SOH\DC2\EOT\151\b\b\DC4\n\
    \\f\n\
    \\STX\EOT*\DC2\ACK\154\b\NUL\161\b\SOH\n\
    \\v\n\
    \\ETX\EOT*\SOH\DC2\EOT\154\b\b\DC1\n\
    \\SO\n\
    \\EOT\EOT*\b\NUL\DC2\ACK\155\b\STX\160\b\ETX\n\
    \\r\n\
    \\ENQ\EOT*\b\NUL\SOH\DC2\EOT\155\b\b\DC4\n\
    \\f\n\
    \\EOT\EOT*\STX\NUL\DC2\EOT\156\b\EOT'\n\
    \\r\n\
    \\ENQ\EOT*\STX\NUL\ACK\DC2\EOT\156\b\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT*\STX\NUL\SOH\DC2\EOT\156\b\DC3\"\n\
    \\r\n\
    \\ENQ\EOT*\STX\NUL\ETX\DC2\EOT\156\b%&\n\
    \\f\n\
    \\EOT\EOT*\STX\SOH\DC2\EOT\157\b\EOT)\n\
    \\r\n\
    \\ENQ\EOT*\STX\SOH\ACK\DC2\EOT\157\b\EOT\DC3\n\
    \\r\n\
    \\ENQ\EOT*\STX\SOH\SOH\DC2\EOT\157\b\DC4$\n\
    \\r\n\
    \\ENQ\EOT*\STX\SOH\ETX\DC2\EOT\157\b'(\n\
    \\f\n\
    \\EOT\EOT*\STX\STX\DC2\EOT\158\b\EOT%\n\
    \\r\n\
    \\ENQ\EOT*\STX\STX\ACK\DC2\EOT\158\b\EOT\DC1\n\
    \\r\n\
    \\ENQ\EOT*\STX\STX\SOH\DC2\EOT\158\b\DC2 \n\
    \\r\n\
    \\ENQ\EOT*\STX\STX\ETX\DC2\EOT\158\b#$\n\
    \\f\n\
    \\EOT\EOT*\STX\ETX\DC2\EOT\159\b\EOT'\n\
    \\r\n\
    \\ENQ\EOT*\STX\ETX\ACK\DC2\EOT\159\b\EOT\DC2\n\
    \\r\n\
    \\ENQ\EOT*\STX\ETX\SOH\DC2\EOT\159\b\DC3\"\n\
    \\r\n\
    \\ENQ\EOT*\STX\ETX\ETX\DC2\EOT\159\b%&\n\
    \\f\n\
    \\STX\EOT+\DC2\ACK\163\b\NUL\168\b\SOH\n\
    \\v\n\
    \\ETX\EOT+\SOH\DC2\EOT\163\b\b\SYN\n\
    \\f\n\
    \\EOT\EOT+\STX\NUL\DC2\EOT\164\b\STX\FS\n\
    \\r\n\
    \\ENQ\EOT+\STX\NUL\ACK\DC2\EOT\164\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT+\STX\NUL\SOH\DC2\EOT\164\b\b\ETB\n\
    \\r\n\
    \\ENQ\EOT+\STX\NUL\ETX\DC2\EOT\164\b\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT+\STX\SOH\DC2\EOT\165\b\STX\FS\n\
    \\r\n\
    \\ENQ\EOT+\STX\SOH\EOT\DC2\EOT\165\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT+\STX\SOH\ACK\DC2\EOT\165\b\v\SI\n\
    \\r\n\
    \\ENQ\EOT+\STX\SOH\SOH\DC2\EOT\165\b\DLE\ETB\n\
    \\r\n\
    \\ENQ\EOT+\STX\SOH\ETX\DC2\EOT\165\b\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT+\STX\STX\DC2\EOT\166\b\STX\DLE\n\
    \\r\n\
    \\ENQ\EOT+\STX\STX\ACK\DC2\EOT\166\b\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT+\STX\STX\SOH\DC2\EOT\166\b\a\v\n\
    \\r\n\
    \\ENQ\EOT+\STX\STX\ETX\DC2\EOT\166\b\SO\SI\n\
    \\f\n\
    \\EOT\EOT+\STX\ETX\DC2\EOT\167\b\STX\EM\n\
    \\r\n\
    \\ENQ\EOT+\STX\ETX\ACK\DC2\EOT\167\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT+\STX\ETX\SOH\DC2\EOT\167\b\b\DC4\n\
    \\r\n\
    \\ENQ\EOT+\STX\ETX\ETX\DC2\EOT\167\b\ETB\CAN\n\
    \\f\n\
    \\STX\EOT,\DC2\ACK\170\b\NUL\174\b\SOH\n\
    \\v\n\
    \\ETX\EOT,\SOH\DC2\EOT\170\b\b\ETB\n\
    \\f\n\
    \\EOT\EOT,\STX\NUL\DC2\EOT\171\b\STX\FS\n\
    \\r\n\
    \\ENQ\EOT,\STX\NUL\ACK\DC2\EOT\171\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT,\STX\NUL\SOH\DC2\EOT\171\b\b\ETB\n\
    \\r\n\
    \\ENQ\EOT,\STX\NUL\ETX\DC2\EOT\171\b\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT,\STX\SOH\DC2\EOT\172\b\STX%\n\
    \\r\n\
    \\ENQ\EOT,\STX\SOH\EOT\DC2\EOT\172\b\STX\n\
    \\n\
    \\r\n\
    \\ENQ\EOT,\STX\SOH\ACK\DC2\EOT\172\b\v\DLE\n\
    \\r\n\
    \\ENQ\EOT,\STX\SOH\SOH\DC2\EOT\172\b\DC1 \n\
    \\r\n\
    \\ENQ\EOT,\STX\SOH\ETX\DC2\EOT\172\b#$\n\
    \\f\n\
    \\EOT\EOT,\STX\STX\DC2\EOT\173\b\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT,\STX\STX\ACK\DC2\EOT\173\b\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT,\STX\STX\SOH\DC2\EOT\173\b\a\DC2\n\
    \\r\n\
    \\ENQ\EOT,\STX\STX\ETX\DC2\EOT\173\b\NAK\SYN\n\
    \\f\n\
    \\STX\EOT-\DC2\ACK\176\b\NUL\180\b\SOH\n\
    \\v\n\
    \\ETX\EOT-\SOH\DC2\EOT\176\b\b\NAK\n\
    \\f\n\
    \\EOT\EOT-\STX\NUL\DC2\EOT\177\b\STX\FS\n\
    \\r\n\
    \\ENQ\EOT-\STX\NUL\ACK\DC2\EOT\177\b\STX\a\n\
    \\r\n\
    \\ENQ\EOT-\STX\NUL\SOH\DC2\EOT\177\b\b\ETB\n\
    \\r\n\
    \\ENQ\EOT-\STX\NUL\ETX\DC2\EOT\177\b\SUB\ESC\n\
    \\f\n\
    \\EOT\EOT-\STX\SOH\DC2\EOT\178\b\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT-\STX\SOH\ACK\DC2\EOT\178\b\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT-\STX\SOH\SOH\DC2\EOT\178\b\a\DC2\n\
    \\r\n\
    \\ENQ\EOT-\STX\SOH\ETX\DC2\EOT\178\b\NAK\SYN\n\
    \\f\n\
    \\EOT\EOT-\STX\STX\DC2\EOT\179\b\STX\ETB\n\
    \\r\n\
    \\ENQ\EOT-\STX\STX\ACK\DC2\EOT\179\b\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT-\STX\STX\SOH\DC2\EOT\179\b\a\DC2\n\
    \\r\n\
    \\ENQ\EOT-\STX\STX\ETX\DC2\EOT\179\b\NAK\SYN\n\
    \\f\n\
    \\STX\EOT.\DC2\ACK\182\b\NUL\184\b\SOH\n\
    \\v\n\
    \\ETX\EOT.\SOH\DC2\EOT\182\b\b\SYN\n\
    \\f\n\
    \\EOT\EOT.\STX\NUL\DC2\EOT\183\b\STX\SI\n\
    \\r\n\
    \\ENQ\EOT.\STX\NUL\ACK\DC2\EOT\183\b\STX\ACK\n\
    \\r\n\
    \\ENQ\EOT.\STX\NUL\SOH\DC2\EOT\183\b\a\n\
    \\n\
    \\r\n\
    \\ENQ\EOT.\STX\NUL\ETX\DC2\EOT\183\b\r\SOb\ACKproto3"