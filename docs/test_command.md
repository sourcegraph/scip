

### File Specification

The validation files for `scip test` are loosely based on [Sublime Text's](https://www.sublimetext.com/docs/syntax.html#testing) syntax highlighting files. Symbol ranges are selected using `^`, `^^` and `// <-`. Symbol attributes can be specified as the first word: `definition`, `reference`, `diagnostic`, and all subsequent lines are interpreted based on the kind of symbol attribute you are writing a test for.

Given the following example, the cli command `scip test` will exit with a non-zero exit code if the provided `index.scip` file does not contain a definition, at the specified range, with the specified symbol
```js
function someFunction() {
   //    ^^^^^^^^^^^^ definition scip-typescript npm test_package 1.0.0 lib/`test.js`/someFunction().
}
```

Three range selection comment formats are supported:
- `// ^^^`: enforces the length of the occurrence. Will fail if the range at this location does not equal 3 characters
- `// ^`: ignore length, `^` can occur at any point to any character in the occurrence
- `// <-`: ignore length, and treat the character above the first comment character as the start of the occurrence, similar to Sublime Text

Four selection kinds are currently supported
- `definition`
- `reference`
- `forward_definition`
- `diagnostic`

The `.` character can be used as a wildcard, to match any symbol segment
```js
function someFunction() {
   //        ^ definition . . test_package . lib/`test.js`/someFunction().
}
```

For kinds which can provide additional data, you can use a `>` character on a new line
```js
function someFn() {
   let someVar = "";
   //   ^ diagnostic Warning
   //   > someVar is unused.
   //   > remove it or use it.
}
```