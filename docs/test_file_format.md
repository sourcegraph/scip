# `scip test` file format

The `scip test` command validates whether a provided SCIP index contains the data specified in a human-readable test file.
The test file syntax is inspired by [Sublime Text's syntax highlighting tests](https://www.sublimetext.com/docs/syntax.html#testing).

## File Format

Test cases are made up of a range, type, and data attribute.

### Ranges

Three range selection comment formats are supported:

- `// ^^^` (2 or more `^`): enforces the length of the occurrence. Will fail if the range at this location does not equal 3 characters
- `// ^`: ignore length, `^` can occur at any point to any character in the occurrence
- `// <-`: ignore length, and treat the character above the first comment character as the start of the occurrence, similar to Sublime Text

```js
function someFunction() {
  //     ^ ...
  //     ^^^^^^^^^^^^ ...
  // <- ...
}
```

### Type and Data

There are four possible types test cases. The chosen test case is determined by the first word after the range selection

- `definition [symbol]` - validates that the specified range has a symbol with the role of "definition" with the specified `[symbol]`
- `reference [symbol]` - validates that the specified range has a symbol with the role of "reference" with the specified `[symbol]`
- `forward_definition [symbol]` - validates that the specified range has a symbol with the role of "forward_definition" with the specified `[symbol]`
- `diagnostic [severity] [message]` - validates that the specified range has a diagnostic with the given `[severity]` and `[message]`

```js
function someFunction() {
  //     ^ definition scip-typescript npm test_package 1.0.0 lib/`test.js`/someFunction().

  someOtherFunction()
  // <- reference scip-typescript npm test_package 1.0.0 lib/`test.js`/someOtherFunction().
}
```

The message for diagnostics can be specified on the following line using `>`,
and may span over multiple lines.

```js
function someFn() {
  let someVar = ''
  //   ^ diagnostic Warning
  //   > someVar is unused.
  //   > remove it or use it.
}
```