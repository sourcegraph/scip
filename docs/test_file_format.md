# `scip test` file format

The `scip test` command validates whether a provided SCIP index, matches manually specified fields in a syntax file. These files are loosely based on [Sublime Text's](https://www.sublimetext.com/docs/syntax.html#testing) syntax highlighting tests.

## File Format

Test cases are made up of a range, type, and data attribute

### Ranges

Three range selection comment formats are supported:

- `// ^^^`: enforces the length of the occurrence. Will fail if the range at this location does not equal 3 characters
- `// ^`: ignore length, `^` can occur at any point to any character in the occurrence
- `// <-`: ignore length, and treat the character above the first comment character as the start of the occurrence, similar to Sublime Text

```js
function someFunction() {
  //     ^ ...
  //    ^^^^^^^^^^^^ ...
  // <- ...
}
```

### Type / Data

There are four possible types test cases. The chosen test case is determined by the first word after the range selection

- `definition [symbol]` - validates that the specified range has a symbol with the role of "definition" with the specified `[symbol]`
- `reference [symbol]` - validates that the specified range has a symbol with the role of "reference" with the specified `[symbol]`
- `forward_definition [symbol]` - validates that the specified range has a symbol with the role of "forward_definition" with the specified `[symbol]`
- `diagnostic [value]` - validates that the specified range as a diagnostic with the a value of `[value]`

```js
function someFunction() {
  //     ^ definition scip-typescript npm test_package 1.0.0 lib/`test.js`/someFunction().

  someOtherFunction()
  // <- reference scip-typescript npm test_package 1.0.0 lib/`test.js`/someOtherFunction().
}
```

Some test types can provide additional data, you can use a `>` character on a new line

```js
function someFn() {
  let someVar = ''
  //   ^ diagnostic Warning
  //   > someVar is unused.
  //   > remove it or use it.
}
```
