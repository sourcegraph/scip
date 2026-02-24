package grammar

//#include "tree_sitter/parser.h"
//TSLanguage *tree_sitter_reprolang();
import "C"

import (
	"unsafe"
)

func Language() unsafe.Pointer {
	return unsafe.Pointer(C.tree_sitter_reprolang())
}
