{- This file was auto-generated from scip.proto by the protoc-gen-haskell program. -}
{-# LANGUAGE ScopedTypeVariables, DataKinds, TypeFamilies, UndecidableInstances, GeneralizedNewtypeDeriving, MultiParamTypeClasses, FlexibleContexts, FlexibleInstances, PatternSynonyms, MagicHash, NoImplicitPrelude, DataKinds, BangPatterns, TypeApplications, OverloadedStrings, DerivingStrategies#-}
{-# OPTIONS_GHC -Wno-unused-imports#-}
{-# OPTIONS_GHC -Wno-duplicate-exports#-}
{-# OPTIONS_GHC -Wno-dodgy-exports#-}
module Proto.Scip_Fields where
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
annotatedType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "annotatedType" a) =>
  Lens.Family2.LensLike' f s a
annotatedType = Data.ProtoLens.Field.field @"annotatedType"
annotations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "annotations" a) =>
  Lens.Family2.LensLike' f s a
annotations = Data.ProtoLens.Field.field @"annotations"
arguments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "arguments" a) =>
  Lens.Family2.LensLike' f s a
arguments = Data.ProtoLens.Field.field @"arguments"
body ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "body" a) =>
  Lens.Family2.LensLike' f s a
body = Data.ProtoLens.Field.field @"body"
booleanConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "booleanConstant" a) =>
  Lens.Family2.LensLike' f s a
booleanConstant = Data.ProtoLens.Field.field @"booleanConstant"
byNameType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "byNameType" a) =>
  Lens.Family2.LensLike' f s a
byNameType = Data.ProtoLens.Field.field @"byNameType"
byteConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "byteConstant" a) =>
  Lens.Family2.LensLike' f s a
byteConstant = Data.ProtoLens.Field.field @"byteConstant"
cases ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "cases" a) =>
  Lens.Family2.LensLike' f s a
cases = Data.ProtoLens.Field.field @"cases"
charConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "charConstant" a) =>
  Lens.Family2.LensLike' f s a
charConstant = Data.ProtoLens.Field.field @"charConstant"
classSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "classSignature" a) =>
  Lens.Family2.LensLike' f s a
classSignature = Data.ProtoLens.Field.field @"classSignature"
code ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "code" a) =>
  Lens.Family2.LensLike' f s a
code = Data.ProtoLens.Field.field @"code"
constant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "constant" a) =>
  Lens.Family2.LensLike' f s a
constant = Data.ProtoLens.Field.field @"constant"
constantType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "constantType" a) =>
  Lens.Family2.LensLike' f s a
constantType = Data.ProtoLens.Field.field @"constantType"
declarations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "declarations" a) =>
  Lens.Family2.LensLike' f s a
declarations = Data.ProtoLens.Field.field @"declarations"
descriptors ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "descriptors" a) =>
  Lens.Family2.LensLike' f s a
descriptors = Data.ProtoLens.Field.field @"descriptors"
diagnostics ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "diagnostics" a) =>
  Lens.Family2.LensLike' f s a
diagnostics = Data.ProtoLens.Field.field @"diagnostics"
disambiguator ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "disambiguator" a) =>
  Lens.Family2.LensLike' f s a
disambiguator = Data.ProtoLens.Field.field @"disambiguator"
displayName ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "displayName" a) =>
  Lens.Family2.LensLike' f s a
displayName = Data.ProtoLens.Field.field @"displayName"
documentation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "documentation" a) =>
  Lens.Family2.LensLike' f s a
documentation = Data.ProtoLens.Field.field @"documentation"
documents ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "documents" a) =>
  Lens.Family2.LensLike' f s a
documents = Data.ProtoLens.Field.field @"documents"
doubleConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "doubleConstant" a) =>
  Lens.Family2.LensLike' f s a
doubleConstant = Data.ProtoLens.Field.field @"doubleConstant"
enclosingRange ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "enclosingRange" a) =>
  Lens.Family2.LensLike' f s a
enclosingRange = Data.ProtoLens.Field.field @"enclosingRange"
enclosingSymbol ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "enclosingSymbol" a) =>
  Lens.Family2.LensLike' f s a
enclosingSymbol = Data.ProtoLens.Field.field @"enclosingSymbol"
existentialType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "existentialType" a) =>
  Lens.Family2.LensLike' f s a
existentialType = Data.ProtoLens.Field.field @"existentialType"
externalSymbols ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "externalSymbols" a) =>
  Lens.Family2.LensLike' f s a
externalSymbols = Data.ProtoLens.Field.field @"externalSymbols"
floatConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "floatConstant" a) =>
  Lens.Family2.LensLike' f s a
floatConstant = Data.ProtoLens.Field.field @"floatConstant"
hardlinks ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "hardlinks" a) =>
  Lens.Family2.LensLike' f s a
hardlinks = Data.ProtoLens.Field.field @"hardlinks"
intConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "intConstant" a) =>
  Lens.Family2.LensLike' f s a
intConstant = Data.ProtoLens.Field.field @"intConstant"
intersectionType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "intersectionType" a) =>
  Lens.Family2.LensLike' f s a
intersectionType = Data.ProtoLens.Field.field @"intersectionType"
isDefinition ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isDefinition" a) =>
  Lens.Family2.LensLike' f s a
isDefinition = Data.ProtoLens.Field.field @"isDefinition"
isImplementation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isImplementation" a) =>
  Lens.Family2.LensLike' f s a
isImplementation = Data.ProtoLens.Field.field @"isImplementation"
isReference ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isReference" a) =>
  Lens.Family2.LensLike' f s a
isReference = Data.ProtoLens.Field.field @"isReference"
isTypeDefinition ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "isTypeDefinition" a) =>
  Lens.Family2.LensLike' f s a
isTypeDefinition = Data.ProtoLens.Field.field @"isTypeDefinition"
key ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "key" a) =>
  Lens.Family2.LensLike' f s a
key = Data.ProtoLens.Field.field @"key"
kind ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "kind" a) =>
  Lens.Family2.LensLike' f s a
kind = Data.ProtoLens.Field.field @"kind"
lambdaType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lambdaType" a) =>
  Lens.Family2.LensLike' f s a
lambdaType = Data.ProtoLens.Field.field @"lambdaType"
language ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "language" a) =>
  Lens.Family2.LensLike' f s a
language = Data.ProtoLens.Field.field @"language"
longConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "longConstant" a) =>
  Lens.Family2.LensLike' f s a
longConstant = Data.ProtoLens.Field.field @"longConstant"
lowerBound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "lowerBound" a) =>
  Lens.Family2.LensLike' f s a
lowerBound = Data.ProtoLens.Field.field @"lowerBound"
manager ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "manager" a) =>
  Lens.Family2.LensLike' f s a
manager = Data.ProtoLens.Field.field @"manager"
matchType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "matchType" a) =>
  Lens.Family2.LensLike' f s a
matchType = Data.ProtoLens.Field.field @"matchType"
maybe'annotatedType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'annotatedType" a) =>
  Lens.Family2.LensLike' f s a
maybe'annotatedType
  = Data.ProtoLens.Field.field @"maybe'annotatedType"
maybe'body ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'body" a) =>
  Lens.Family2.LensLike' f s a
maybe'body = Data.ProtoLens.Field.field @"maybe'body"
maybe'booleanConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'booleanConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'booleanConstant
  = Data.ProtoLens.Field.field @"maybe'booleanConstant"
maybe'byNameType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'byNameType" a) =>
  Lens.Family2.LensLike' f s a
maybe'byNameType = Data.ProtoLens.Field.field @"maybe'byNameType"
maybe'byteConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'byteConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'byteConstant
  = Data.ProtoLens.Field.field @"maybe'byteConstant"
maybe'charConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'charConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'charConstant
  = Data.ProtoLens.Field.field @"maybe'charConstant"
maybe'classSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'classSignature" a) =>
  Lens.Family2.LensLike' f s a
maybe'classSignature
  = Data.ProtoLens.Field.field @"maybe'classSignature"
maybe'constant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'constant" a) =>
  Lens.Family2.LensLike' f s a
maybe'constant = Data.ProtoLens.Field.field @"maybe'constant"
maybe'constantType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'constantType" a) =>
  Lens.Family2.LensLike' f s a
maybe'constantType
  = Data.ProtoLens.Field.field @"maybe'constantType"
maybe'declarations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'declarations" a) =>
  Lens.Family2.LensLike' f s a
maybe'declarations
  = Data.ProtoLens.Field.field @"maybe'declarations"
maybe'doubleConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'doubleConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'doubleConstant
  = Data.ProtoLens.Field.field @"maybe'doubleConstant"
maybe'existentialType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'existentialType" a) =>
  Lens.Family2.LensLike' f s a
maybe'existentialType
  = Data.ProtoLens.Field.field @"maybe'existentialType"
maybe'floatConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'floatConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'floatConstant
  = Data.ProtoLens.Field.field @"maybe'floatConstant"
maybe'intConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'intConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'intConstant = Data.ProtoLens.Field.field @"maybe'intConstant"
maybe'intersectionType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'intersectionType" a) =>
  Lens.Family2.LensLike' f s a
maybe'intersectionType
  = Data.ProtoLens.Field.field @"maybe'intersectionType"
maybe'key ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'key" a) =>
  Lens.Family2.LensLike' f s a
maybe'key = Data.ProtoLens.Field.field @"maybe'key"
maybe'lambdaType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'lambdaType" a) =>
  Lens.Family2.LensLike' f s a
maybe'lambdaType = Data.ProtoLens.Field.field @"maybe'lambdaType"
maybe'longConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'longConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'longConstant
  = Data.ProtoLens.Field.field @"maybe'longConstant"
maybe'lowerBound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'lowerBound" a) =>
  Lens.Family2.LensLike' f s a
maybe'lowerBound = Data.ProtoLens.Field.field @"maybe'lowerBound"
maybe'matchType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'matchType" a) =>
  Lens.Family2.LensLike' f s a
maybe'matchType = Data.ProtoLens.Field.field @"maybe'matchType"
maybe'metadata ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'metadata" a) =>
  Lens.Family2.LensLike' f s a
maybe'metadata = Data.ProtoLens.Field.field @"maybe'metadata"
maybe'methodSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'methodSignature" a) =>
  Lens.Family2.LensLike' f s a
maybe'methodSignature
  = Data.ProtoLens.Field.field @"maybe'methodSignature"
maybe'nullConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'nullConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'nullConstant
  = Data.ProtoLens.Field.field @"maybe'nullConstant"
maybe'package ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'package" a) =>
  Lens.Family2.LensLike' f s a
maybe'package = Data.ProtoLens.Field.field @"maybe'package"
maybe'parameters ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'parameters" a) =>
  Lens.Family2.LensLike' f s a
maybe'parameters = Data.ProtoLens.Field.field @"maybe'parameters"
maybe'prefix ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'prefix" a) =>
  Lens.Family2.LensLike' f s a
maybe'prefix = Data.ProtoLens.Field.field @"maybe'prefix"
maybe'repeatedType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'repeatedType" a) =>
  Lens.Family2.LensLike' f s a
maybe'repeatedType
  = Data.ProtoLens.Field.field @"maybe'repeatedType"
maybe'returnType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'returnType" a) =>
  Lens.Family2.LensLike' f s a
maybe'returnType = Data.ProtoLens.Field.field @"maybe'returnType"
maybe'scrutinee ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'scrutinee" a) =>
  Lens.Family2.LensLike' f s a
maybe'scrutinee = Data.ProtoLens.Field.field @"maybe'scrutinee"
maybe'sealedValue ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'sealedValue" a) =>
  Lens.Family2.LensLike' f s a
maybe'sealedValue = Data.ProtoLens.Field.field @"maybe'sealedValue"
maybe'self ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'self" a) =>
  Lens.Family2.LensLike' f s a
maybe'self = Data.ProtoLens.Field.field @"maybe'self"
maybe'shortConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'shortConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'shortConstant
  = Data.ProtoLens.Field.field @"maybe'shortConstant"
maybe'signature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'signature" a) =>
  Lens.Family2.LensLike' f s a
maybe'signature = Data.ProtoLens.Field.field @"maybe'signature"
maybe'signatureDocumentation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'signatureDocumentation" a) =>
  Lens.Family2.LensLike' f s a
maybe'signatureDocumentation
  = Data.ProtoLens.Field.field @"maybe'signatureDocumentation"
maybe'singleType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'singleType" a) =>
  Lens.Family2.LensLike' f s a
maybe'singleType = Data.ProtoLens.Field.field @"maybe'singleType"
maybe'stringConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'stringConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'stringConstant
  = Data.ProtoLens.Field.field @"maybe'stringConstant"
maybe'structuralType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'structuralType" a) =>
  Lens.Family2.LensLike' f s a
maybe'structuralType
  = Data.ProtoLens.Field.field @"maybe'structuralType"
maybe'superType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'superType" a) =>
  Lens.Family2.LensLike' f s a
maybe'superType = Data.ProtoLens.Field.field @"maybe'superType"
maybe'thisType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'thisType" a) =>
  Lens.Family2.LensLike' f s a
maybe'thisType = Data.ProtoLens.Field.field @"maybe'thisType"
maybe'toolInfo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'toolInfo" a) =>
  Lens.Family2.LensLike' f s a
maybe'toolInfo = Data.ProtoLens.Field.field @"maybe'toolInfo"
maybe'tpe ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'tpe" a) =>
  Lens.Family2.LensLike' f s a
maybe'tpe = Data.ProtoLens.Field.field @"maybe'tpe"
maybe'typeParameters ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'typeParameters" a) =>
  Lens.Family2.LensLike' f s a
maybe'typeParameters
  = Data.ProtoLens.Field.field @"maybe'typeParameters"
maybe'typeRef ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'typeRef" a) =>
  Lens.Family2.LensLike' f s a
maybe'typeRef = Data.ProtoLens.Field.field @"maybe'typeRef"
maybe'typeSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'typeSignature" a) =>
  Lens.Family2.LensLike' f s a
maybe'typeSignature
  = Data.ProtoLens.Field.field @"maybe'typeSignature"
maybe'unionType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'unionType" a) =>
  Lens.Family2.LensLike' f s a
maybe'unionType = Data.ProtoLens.Field.field @"maybe'unionType"
maybe'unitConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'unitConstant" a) =>
  Lens.Family2.LensLike' f s a
maybe'unitConstant
  = Data.ProtoLens.Field.field @"maybe'unitConstant"
maybe'universalType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'universalType" a) =>
  Lens.Family2.LensLike' f s a
maybe'universalType
  = Data.ProtoLens.Field.field @"maybe'universalType"
maybe'upperBound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'upperBound" a) =>
  Lens.Family2.LensLike' f s a
maybe'upperBound = Data.ProtoLens.Field.field @"maybe'upperBound"
maybe'valueSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'valueSignature" a) =>
  Lens.Family2.LensLike' f s a
maybe'valueSignature
  = Data.ProtoLens.Field.field @"maybe'valueSignature"
maybe'withType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "maybe'withType" a) =>
  Lens.Family2.LensLike' f s a
maybe'withType = Data.ProtoLens.Field.field @"maybe'withType"
message ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "message" a) =>
  Lens.Family2.LensLike' f s a
message = Data.ProtoLens.Field.field @"message"
metadata ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "metadata" a) =>
  Lens.Family2.LensLike' f s a
metadata = Data.ProtoLens.Field.field @"metadata"
methodSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "methodSignature" a) =>
  Lens.Family2.LensLike' f s a
methodSignature = Data.ProtoLens.Field.field @"methodSignature"
name ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "name" a) =>
  Lens.Family2.LensLike' f s a
name = Data.ProtoLens.Field.field @"name"
nullConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "nullConstant" a) =>
  Lens.Family2.LensLike' f s a
nullConstant = Data.ProtoLens.Field.field @"nullConstant"
occurrences ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "occurrences" a) =>
  Lens.Family2.LensLike' f s a
occurrences = Data.ProtoLens.Field.field @"occurrences"
overrideDocumentation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "overrideDocumentation" a) =>
  Lens.Family2.LensLike' f s a
overrideDocumentation
  = Data.ProtoLens.Field.field @"overrideDocumentation"
package ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "package" a) =>
  Lens.Family2.LensLike' f s a
package = Data.ProtoLens.Field.field @"package"
parameterLists ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "parameterLists" a) =>
  Lens.Family2.LensLike' f s a
parameterLists = Data.ProtoLens.Field.field @"parameterLists"
parameters ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "parameters" a) =>
  Lens.Family2.LensLike' f s a
parameters = Data.ProtoLens.Field.field @"parameters"
parents ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "parents" a) =>
  Lens.Family2.LensLike' f s a
parents = Data.ProtoLens.Field.field @"parents"
positionEncoding ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "positionEncoding" a) =>
  Lens.Family2.LensLike' f s a
positionEncoding = Data.ProtoLens.Field.field @"positionEncoding"
prefix ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "prefix" a) =>
  Lens.Family2.LensLike' f s a
prefix = Data.ProtoLens.Field.field @"prefix"
projectRoot ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "projectRoot" a) =>
  Lens.Family2.LensLike' f s a
projectRoot = Data.ProtoLens.Field.field @"projectRoot"
range ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "range" a) =>
  Lens.Family2.LensLike' f s a
range = Data.ProtoLens.Field.field @"range"
relationships ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "relationships" a) =>
  Lens.Family2.LensLike' f s a
relationships = Data.ProtoLens.Field.field @"relationships"
relativePath ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "relativePath" a) =>
  Lens.Family2.LensLike' f s a
relativePath = Data.ProtoLens.Field.field @"relativePath"
repeatedType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "repeatedType" a) =>
  Lens.Family2.LensLike' f s a
repeatedType = Data.ProtoLens.Field.field @"repeatedType"
returnType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "returnType" a) =>
  Lens.Family2.LensLike' f s a
returnType = Data.ProtoLens.Field.field @"returnType"
scheme ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "scheme" a) =>
  Lens.Family2.LensLike' f s a
scheme = Data.ProtoLens.Field.field @"scheme"
scrutinee ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "scrutinee" a) =>
  Lens.Family2.LensLike' f s a
scrutinee = Data.ProtoLens.Field.field @"scrutinee"
self ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "self" a) =>
  Lens.Family2.LensLike' f s a
self = Data.ProtoLens.Field.field @"self"
severity ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "severity" a) =>
  Lens.Family2.LensLike' f s a
severity = Data.ProtoLens.Field.field @"severity"
shortConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "shortConstant" a) =>
  Lens.Family2.LensLike' f s a
shortConstant = Data.ProtoLens.Field.field @"shortConstant"
signature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "signature" a) =>
  Lens.Family2.LensLike' f s a
signature = Data.ProtoLens.Field.field @"signature"
signatureDocumentation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "signatureDocumentation" a) =>
  Lens.Family2.LensLike' f s a
signatureDocumentation
  = Data.ProtoLens.Field.field @"signatureDocumentation"
singleType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "singleType" a) =>
  Lens.Family2.LensLike' f s a
singleType = Data.ProtoLens.Field.field @"singleType"
source ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "source" a) =>
  Lens.Family2.LensLike' f s a
source = Data.ProtoLens.Field.field @"source"
stringConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "stringConstant" a) =>
  Lens.Family2.LensLike' f s a
stringConstant = Data.ProtoLens.Field.field @"stringConstant"
structuralType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "structuralType" a) =>
  Lens.Family2.LensLike' f s a
structuralType = Data.ProtoLens.Field.field @"structuralType"
suffix ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "suffix" a) =>
  Lens.Family2.LensLike' f s a
suffix = Data.ProtoLens.Field.field @"suffix"
superType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "superType" a) =>
  Lens.Family2.LensLike' f s a
superType = Data.ProtoLens.Field.field @"superType"
symbol ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "symbol" a) =>
  Lens.Family2.LensLike' f s a
symbol = Data.ProtoLens.Field.field @"symbol"
symbolRoles ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "symbolRoles" a) =>
  Lens.Family2.LensLike' f s a
symbolRoles = Data.ProtoLens.Field.field @"symbolRoles"
symbols ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "symbols" a) =>
  Lens.Family2.LensLike' f s a
symbols = Data.ProtoLens.Field.field @"symbols"
symlinks ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "symlinks" a) =>
  Lens.Family2.LensLike' f s a
symlinks = Data.ProtoLens.Field.field @"symlinks"
syntaxKind ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "syntaxKind" a) =>
  Lens.Family2.LensLike' f s a
syntaxKind = Data.ProtoLens.Field.field @"syntaxKind"
tags ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "tags" a) =>
  Lens.Family2.LensLike' f s a
tags = Data.ProtoLens.Field.field @"tags"
text ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "text" a) =>
  Lens.Family2.LensLike' f s a
text = Data.ProtoLens.Field.field @"text"
textDocumentEncoding ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "textDocumentEncoding" a) =>
  Lens.Family2.LensLike' f s a
textDocumentEncoding
  = Data.ProtoLens.Field.field @"textDocumentEncoding"
thisType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "thisType" a) =>
  Lens.Family2.LensLike' f s a
thisType = Data.ProtoLens.Field.field @"thisType"
toolInfo ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "toolInfo" a) =>
  Lens.Family2.LensLike' f s a
toolInfo = Data.ProtoLens.Field.field @"toolInfo"
tpe ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "tpe" a) =>
  Lens.Family2.LensLike' f s a
tpe = Data.ProtoLens.Field.field @"tpe"
typeArguments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "typeArguments" a) =>
  Lens.Family2.LensLike' f s a
typeArguments = Data.ProtoLens.Field.field @"typeArguments"
typeParameters ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "typeParameters" a) =>
  Lens.Family2.LensLike' f s a
typeParameters = Data.ProtoLens.Field.field @"typeParameters"
typeRef ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "typeRef" a) =>
  Lens.Family2.LensLike' f s a
typeRef = Data.ProtoLens.Field.field @"typeRef"
typeSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "typeSignature" a) =>
  Lens.Family2.LensLike' f s a
typeSignature = Data.ProtoLens.Field.field @"typeSignature"
types ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "types" a) =>
  Lens.Family2.LensLike' f s a
types = Data.ProtoLens.Field.field @"types"
unionType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unionType" a) =>
  Lens.Family2.LensLike' f s a
unionType = Data.ProtoLens.Field.field @"unionType"
unitConstant ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "unitConstant" a) =>
  Lens.Family2.LensLike' f s a
unitConstant = Data.ProtoLens.Field.field @"unitConstant"
universalType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "universalType" a) =>
  Lens.Family2.LensLike' f s a
universalType = Data.ProtoLens.Field.field @"universalType"
upperBound ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "upperBound" a) =>
  Lens.Family2.LensLike' f s a
upperBound = Data.ProtoLens.Field.field @"upperBound"
value ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "value" a) =>
  Lens.Family2.LensLike' f s a
value = Data.ProtoLens.Field.field @"value"
valueSignature ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "valueSignature" a) =>
  Lens.Family2.LensLike' f s a
valueSignature = Data.ProtoLens.Field.field @"valueSignature"
vec'annotations ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'annotations" a) =>
  Lens.Family2.LensLike' f s a
vec'annotations = Data.ProtoLens.Field.field @"vec'annotations"
vec'arguments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'arguments" a) =>
  Lens.Family2.LensLike' f s a
vec'arguments = Data.ProtoLens.Field.field @"vec'arguments"
vec'cases ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'cases" a) =>
  Lens.Family2.LensLike' f s a
vec'cases = Data.ProtoLens.Field.field @"vec'cases"
vec'descriptors ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'descriptors" a) =>
  Lens.Family2.LensLike' f s a
vec'descriptors = Data.ProtoLens.Field.field @"vec'descriptors"
vec'diagnostics ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'diagnostics" a) =>
  Lens.Family2.LensLike' f s a
vec'diagnostics = Data.ProtoLens.Field.field @"vec'diagnostics"
vec'documentation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'documentation" a) =>
  Lens.Family2.LensLike' f s a
vec'documentation = Data.ProtoLens.Field.field @"vec'documentation"
vec'documents ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'documents" a) =>
  Lens.Family2.LensLike' f s a
vec'documents = Data.ProtoLens.Field.field @"vec'documents"
vec'enclosingRange ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'enclosingRange" a) =>
  Lens.Family2.LensLike' f s a
vec'enclosingRange
  = Data.ProtoLens.Field.field @"vec'enclosingRange"
vec'externalSymbols ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'externalSymbols" a) =>
  Lens.Family2.LensLike' f s a
vec'externalSymbols
  = Data.ProtoLens.Field.field @"vec'externalSymbols"
vec'hardlinks ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'hardlinks" a) =>
  Lens.Family2.LensLike' f s a
vec'hardlinks = Data.ProtoLens.Field.field @"vec'hardlinks"
vec'occurrences ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'occurrences" a) =>
  Lens.Family2.LensLike' f s a
vec'occurrences = Data.ProtoLens.Field.field @"vec'occurrences"
vec'overrideDocumentation ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'overrideDocumentation" a) =>
  Lens.Family2.LensLike' f s a
vec'overrideDocumentation
  = Data.ProtoLens.Field.field @"vec'overrideDocumentation"
vec'parameterLists ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'parameterLists" a) =>
  Lens.Family2.LensLike' f s a
vec'parameterLists
  = Data.ProtoLens.Field.field @"vec'parameterLists"
vec'parents ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'parents" a) =>
  Lens.Family2.LensLike' f s a
vec'parents = Data.ProtoLens.Field.field @"vec'parents"
vec'range ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'range" a) =>
  Lens.Family2.LensLike' f s a
vec'range = Data.ProtoLens.Field.field @"vec'range"
vec'relationships ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'relationships" a) =>
  Lens.Family2.LensLike' f s a
vec'relationships = Data.ProtoLens.Field.field @"vec'relationships"
vec'symbols ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'symbols" a) =>
  Lens.Family2.LensLike' f s a
vec'symbols = Data.ProtoLens.Field.field @"vec'symbols"
vec'symlinks ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'symlinks" a) =>
  Lens.Family2.LensLike' f s a
vec'symlinks = Data.ProtoLens.Field.field @"vec'symlinks"
vec'tags ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'tags" a) =>
  Lens.Family2.LensLike' f s a
vec'tags = Data.ProtoLens.Field.field @"vec'tags"
vec'typeArguments ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'typeArguments" a) =>
  Lens.Family2.LensLike' f s a
vec'typeArguments = Data.ProtoLens.Field.field @"vec'typeArguments"
vec'types ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "vec'types" a) =>
  Lens.Family2.LensLike' f s a
vec'types = Data.ProtoLens.Field.field @"vec'types"
version ::
  forall f s a.
  (Prelude.Functor f, Data.ProtoLens.Field.HasField s "version" a) =>
  Lens.Family2.LensLike' f s a
version = Data.ProtoLens.Field.field @"version"
withType ::
  forall f s a.
  (Prelude.Functor f,
   Data.ProtoLens.Field.HasField s "withType" a) =>
  Lens.Family2.LensLike' f s a
withType = Data.ProtoLens.Field.field @"withType"