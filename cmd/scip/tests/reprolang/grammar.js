module.exports = grammar({
  name: 'reprolang',
  extras: $ => [/\s+/],
  word: $ => $.workspace_identifier,

  rules: {
    source_file: $ => repeat($._statement),
    _statement: $ =>
      seq(
        choice(
          $.definition_statement,
          $.reference_statement,
          $.relationships_statement,
          $.comment
        ),
        '\n'
      ),
    definition_statement: $ =>
      seq(
        field('docstring', optional(seq($.docstring, '\n'))),
        'definition',
        field('name', $.identifier),
        field('roles', repeat($._definition_relations))
      ),
    reference_statement: $ => seq('reference', field('name', $.identifier)),
    _definition_relations: $ =>
      choice(
        $.implementation_relation,
        $.type_definition_relation,
        $.references_relation
      ),
    implementation_relation: $ =>
      seq('implements', field('name', $.identifier)),
    type_definition_relation: $ =>
      seq('type_defines', field('name', $.identifier)),
    references_relation: $ => seq('references', field('name', $.identifier)),
    // Meant to be used primarily when trying to construct indexes with
    // relationships for symbols which lack a definition themselves,
    // and are defined by some other symbol.
    relationships_statement: $ =>
      seq(
        'relationships',
        field('name', $.identifier),
        field('roles', repeat($._all_relations))
      ),
    _all_relations: $ => choice($._definition_relations, $.defined_by_relation),
    defined_by_relation: $ => seq('defined_by', field('name', $.identifier)),
    comment: $ => seq('#', /.*/),
    docstring: $ => seq('# docstring:', /.*/),
    identifier: $ =>
      choice(
        field('global', $.global_identifier),
        field('workspace', $.workspace_identifier)
      ),
    global_identifier: $ =>
      seq(
        'global',
        field('project_name', $.workspace_identifier),
        field('descriptors', $.workspace_identifier)
      ),
    workspace_identifier: $ => /[^\s]+/,
  },
})
