//==--- DiagnosticLexKinds.td - liblex diagnostics ------------------------===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//

//===----------------------------------------------------------------------===//
// Lexer Diagnostics
//===----------------------------------------------------------------------===//

let Component = "Lex", CategoryName = "Lexical or Preprocessor Issue" in {

def null_in_string : Warning<"null character(s) preserved in string literal">,
  InGroup<NullCharacter>;
def null_in_char : Warning<"null character(s) preserved in character literal">,
  InGroup<NullCharacter>;
def null_in_file : Warning<"null character ignored">, InGroup<NullCharacter>;
def warn_nested_block_comment : Warning<"'/*' within block comment">,
  InGroup<Comment>;
def escaped_newline_block_comment_end : Warning<
  "escaped newline between */ characters at block comment end">,
  InGroup<Comment>;
def backslash_newline_space : Warning<
  "backslash and newline separated by space">,
  InGroup<DiagGroup<"backslash-newline-escape">>;

// Digraphs.
def warn_cxx98_compat_less_colon_colon : Warning<
  "'<::' is treated as digraph '<:' (aka '[') followed by ':' in C++98">,
  InGroup<CXX98Compat>, DefaultIgnore;

// Trigraphs.
def trigraph_ignored : Warning<"trigraph ignored">, InGroup<Trigraphs>;
def trigraph_ignored_block_comment : Warning<
  "ignored trigraph would end block comment">, InGroup<Trigraphs>;
def trigraph_ends_block_comment : Warning<"trigraph ends block comment">,
    InGroup<Trigraphs>;
def trigraph_converted : Warning<"trigraph converted to '%0' character">,
    InGroup<Trigraphs>;

def ext_multi_line_line_comment : Extension<"multi-line // comment">,
    InGroup<Comment>;
def ext_line_comment : Extension<
  "// comments are not allowed in this language">,
  InGroup<Comment>;
def ext_no_newline_eof : Extension<"no newline at end of file">, 
  InGroup<DiagGroup<"newline-eof">>;

def warn_cxx98_compat_no_newline_eof : Warning<
  "C++98 requires newline at end of file">,
  InGroup<CXX98CompatPedantic>, DefaultIgnore;

def ext_dollar_in_identifier : Extension<"'$' in identifier">,
  InGroup<DiagGroup<"dollar-in-identifier-extension">>;
def ext_charize_microsoft : Extension<"charizing operator #@ is a Microsoft extension">,
  InGroup<Microsoft>;

def ext_token_used : Extension<"extension used">,
  InGroup<DiagGroup<"language-extension-token">>;

def warn_cxx11_keyword : Warning<"'%0' is a keyword in C++11">,
  InGroup<CXX11Compat>, DefaultIgnore;

def ext_unterminated_string : ExtWarn<"missing terminating '\"' character">,
  InGroup<InvalidPPToken>;
def ext_unterminated_char : ExtWarn<"missing terminating ' character">,
  InGroup<InvalidPPToken>;
def ext_empty_character : ExtWarn<"empty character constant">,
  InGroup<InvalidPPToken>;
def err_unterminated_block_comment : Error<"unterminated /* comment">;
def err_invalid_character_to_charify : Error<
  "invalid argument to convert to character">;
def err_unterminated___pragma : Error<"missing terminating ')' character">;

def err_conflict_marker : Error<"version control conflict marker in file">;

def err_raw_delim_too_long : Error<
  "raw string delimiter longer than 16 characters"
  "; use PREFIX( )PREFIX to delimit raw string">;
def err_invalid_char_raw_delim : Error<
  "invalid character '%0' character in raw string delimiter"
  "; use PREFIX( )PREFIX to delimit raw string">;
def err_unterminated_raw_string : Error<
  "raw string missing terminating delimiter )%0\"">;
def warn_cxx98_compat_raw_string_literal : Warning<
  "raw string literals are incompatible with C++98">,
  InGroup<CXX98Compat>, DefaultIgnore;

def ext_multichar_character_literal : ExtWarn<
  "multi-character character constant">, InGroup<MultiChar>;
def ext_four_char_character_literal : Extension<
  "multi-character character constant">, InGroup<FourByteMultiChar>;


// Unicode and UCNs
def err_invalid_utf8 : Error<
  "source file is not valid UTF-8">;
def err_non_ascii : Error<
  "non-ASCII characters are not allowed outside of literals and identifiers">;
def ext_unicode_whitespace : ExtWarn<
  "treating Unicode character as whitespace">,
  InGroup<DiagGroup<"unicode-whitespace">>;

def err_hex_escape_no_digits : Error<
  "\\%0 used with no following hex digits">;
def warn_ucn_escape_no_digits : Warning<
  "\\%0 used with no following hex digits; "
  "treating as '\\' followed by identifier">, InGroup<Unicode>;
def err_ucn_escape_incomplete : Error<
  "incomplete universal character name">;
def warn_ucn_escape_incomplete : Warning<
  "incomplete universal character name; "
  "treating as '\\' followed by identifier">, InGroup<Unicode>;
def note_ucn_four_not_eight : Note<"did you mean to use '\\u'?">;

def err_ucn_escape_basic_scs : Error<
  "character '%0' cannot be specified by a universal character name">;
def err_ucn_control_character : Error<
  "universal character name refers to a control character">;
def err_ucn_escape_invalid : Error<"invalid universal character">;
def warn_cxx98_compat_literal_ucn_escape_basic_scs : Warning<
  "specifying character '%0' with a universal character name "
  "is incompatible with C++98">, InGroup<CXX98Compat>, DefaultIgnore;
def warn_cxx98_compat_literal_ucn_control_character : Warning<
  "universal character name referring to a control character "
  "is incompatible with C++98">, InGroup<CXX98Compat>, DefaultIgnore;
def warn_ucn_not_valid_in_c89 : Warning<
  "universal character names are only valid in C99 or C++; "
  "treating as '\\' followed by identifier">, InGroup<Unicode>;
def warn_ucn_not_valid_in_c89_literal : ExtWarn<
  "universal character names are only valid in C99 or C++">, InGroup<Unicode>;


// Literal
def ext_nonstandard_escape : Extension<
  "use of non-standard escape character '\\%0'">;
def ext_unknown_escape : ExtWarn<"unknown escape sequence '\\%0'">;
def err_invalid_decimal_digit : Error<"invalid digit '%0' in decimal constant">;
def err_invalid_binary_digit : Error<"invalid digit '%0' in binary constant">;
def err_invalid_octal_digit : Error<"invalid digit '%0' in octal constant">;
def err_invalid_suffix_integer_constant : Error<
  "invalid suffix '%0' on integer constant">;
def err_invalid_suffix_float_constant : Error<
  "invalid suffix '%0' on floating constant">;
def warn_extraneous_char_constant : Warning<
  "extraneous characters in character constant ignored">;
def warn_char_constant_too_large : Warning<
  "character constant too long for its type">;
def err_multichar_utf_character_literal : Error<
  "Unicode character literals may not contain multiple characters">;
def err_exponent_has_no_digits : Error<"exponent has no digits">;
def ext_imaginary_constant : Extension<
  "imaginary constants are a GNU extension">, InGroup<GNU>;
def err_hexconstant_requires_exponent : Error<
  "hexadecimal floating constants require an exponent">;
def err_hexconstant_requires_digits : Error<
  "hexadecimal floating constants require a significand">;
def ext_hexconstant_invalid : Extension<
  "hexadecimal floating constants are a C99 feature">, InGroup<C99>;
def ext_binary_literal : Extension<
  "binary integer literals are a GNU extension">, InGroup<GNU>;
def err_pascal_string_too_long : Error<"Pascal string is too long">;
def warn_octal_escape_too_large : ExtWarn<"octal escape sequence out of range">;
def warn_hex_escape_too_large : ExtWarn<"hex escape sequence out of range">;
def ext_string_too_long : Extension<"string literal of length %0 exceeds "
  "maximum length %1 that %select{C90|ISO C99|C++}2 compilers are required to "
  "support">, InGroup<OverlengthStrings>;
def err_character_too_large : Error<
  "character too large for enclosing character literal type">;
def warn_cxx98_compat_unicode_literal : Warning<
  "unicode literals are incompatible with C++98">,
  InGroup<CXX98Compat>, DefaultIgnore;
def warn_cxx11_compat_user_defined_literal : Warning<
  "identifier after literal will be treated as a user-defined literal suffix "
  "in C++11">, InGroup<CXX11Compat>, DefaultIgnore;
def warn_cxx11_compat_reserved_user_defined_literal : Warning<
  "identifier after literal will be treated as a reserved user-defined literal "
  "suffix in C++11">,
  InGroup<CXX11CompatReservedUserDefinedLiteral>, DefaultIgnore;
def ext_reserved_user_defined_literal : ExtWarn<
  "invalid suffix on literal; C++11 requires a space between literal and "
  "identifier">, InGroup<ReservedUserDefinedLiteral>, DefaultError;
def ext_ms_reserved_user_defined_literal : ExtWarn<
  "invalid suffix on literal; C++11 requires a space between literal and "
  "identifier">, InGroup<ReservedUserDefinedLiteral>;
def err_unsupported_string_concat : Error<
  "unsupported non-standard concatenation of string literals">;
def err_string_concat_mixed_suffix : Error<
  "differing user-defined suffixes ('%0' and '%1') in string literal "
  "concatenation">;
def err_pp_invalid_udl : Error<
  "%select{character|integer}0 literal with user-defined suffix "
  "cannot be used in preprocessor constant expression">;
def err_bad_string_encoding : Error<
  "illegal character encoding in string literal">;
def warn_bad_string_encoding : ExtWarn<
  "illegal character encoding in string literal">,
  InGroup<InvalidSourceEncoding>;
def err_bad_character_encoding : Error<
  "illegal character encoding in character literal">;
def warn_bad_character_encoding : ExtWarn<
  "illegal character encoding in character literal">,
  InGroup<InvalidSourceEncoding>;
def err_lexing_string : Error<"failure when lexing a string">;


//===----------------------------------------------------------------------===//
// PTH Diagnostics
//===----------------------------------------------------------------------===//
def err_invalid_pth_file : Error<
    "invalid or corrupt PTH file '%0'">;

//===----------------------------------------------------------------------===//
// Preprocessor Diagnostics
//===----------------------------------------------------------------------===//

let CategoryName = "User Defined Issues" in {
def pp_hash_warning : Warning<"%0">,
  InGroup<PoundWarning>, DefaultWarnShowInSystemHeader;
def err_pp_hash_error : Error<"%0">;
}

def pp_include_next_in_primary : Warning<
  "#include_next in primary source file">;
def pp_include_macros_out_of_predefines : Error<
  "the #__include_macros directive is only for internal use by -imacros">;
def pp_include_next_absolute_path : Warning<"#include_next with absolute path">;
def ext_c99_whitespace_required_after_macro_name : ExtWarn<
  "ISO C99 requires whitespace after the macro name">, InGroup<C99>;
def ext_missing_whitespace_after_macro_name : ExtWarn<
  "whitespace required after macro name">;
def warn_missing_whitespace_after_macro_name : Warning<
  "whitespace recommended after macro name">;
  
def pp_pragma_once_in_main_file : Warning<"#pragma once in main file">;
def pp_pragma_sysheader_in_main_file : Warning<
  "#pragma system_header ignored in main file">;
def pp_poisoning_existing_macro : Warning<"poisoning existing macro">;
def pp_out_of_date_dependency : Warning<
  "current file is older than dependency %0">;
def pp_undef_builtin_macro : Warning<"undefining builtin macro">;
def pp_redef_builtin_macro : Warning<"redefining builtin macro">,
  InGroup<DiagGroup<"builtin-macro-redefined">>;
def pp_disabled_macro_expansion : Warning<
  "disabled expansion of recursive macro">, DefaultIgnore,
  InGroup<DiagGroup<"disabled-macro-expansion">>;
def pp_macro_not_used : Warning<"macro is not used">, DefaultIgnore,
  InGroup<DiagGroup<"unused-macros">>;
def warn_pp_undef_identifier : Warning<
  "%0 is not defined, evaluates to 0">,
  InGroup<DiagGroup<"undef">>, DefaultIgnore;
def warn_pp_ambiguous_macro : Warning<
  "ambiguous expansion of macro %0">, InGroup<AmbiguousMacro>;
def note_pp_ambiguous_macro_chosen : Note<
  "expanding this definition of %0">;
def note_pp_ambiguous_macro_other : Note<
  "other definition of %0">;

def pp_invalid_string_literal : Warning<
  "invalid string literal, ignoring final '\\'">;
def warn_pp_expr_overflow : Warning<
  "integer overflow in preprocessor expression">;
def warn_pp_convert_lhs_to_positive : Warning<
  "left side of operator converted from negative value to unsigned: %0">;
def warn_pp_convert_rhs_to_positive : Warning<
  "right side of operator converted from negative value to unsigned: %0">;

def ext_pp_import_directive : Extension<"#import is a language extension">,
  InGroup<DiagGroup<"import-preprocessor-directive-pedantic">>;
def err_pp_import_directive_ms : Error<
  "#import of type library is an unsupported Microsoft feature">;

def ext_pp_ident_directive : Extension<"#ident is a language extension">;
def ext_pp_include_next_directive : Extension<
  "#include_next is a language extension">;
def ext_pp_warning_directive : Extension<"#warning is a language extension">;

def ext_pp_extra_tokens_at_eol : ExtWarn<
  "extra tokens at end of #%0 directive">, InGroup<ExtraTokens>;
  
def ext_pp_comma_expr : Extension<"comma operator in operand of #if">;
def ext_pp_bad_vaargs_use : Extension<
  "__VA_ARGS__ can only appear in the expansion of a C99 variadic macro">;
def ext_pp_macro_redef : ExtWarn<"%0 macro redefined">;
def ext_variadic_macro : Extension<"variadic macros are a C99 feature">,
  InGroup<VariadicMacros>;
def warn_cxx98_compat_variadic_macro : Warning<
  "variadic macros are incompatible with C++98">,
  InGroup<CXX98CompatPedantic>, DefaultIgnore;
def ext_named_variadic_macro : Extension<
  "named variadic macros are a GNU extension">, InGroup<VariadicMacros>;
def err_embedded_include : Error<
  "embedding a #%0 directive within macro arguments is not supported">;
def ext_embedded_directive : Extension<
  "embedding a directive within macro arguments has undefined behavior">,
  InGroup<DiagGroup<"embedded-directive">>;
def ext_missing_varargs_arg : Extension<
  "must specify at least one argument for '...' parameter of variadic macro">,
  InGroup<GNU>;
def ext_empty_fnmacro_arg : Extension<
  "empty macro arguments are a C99 feature">, InGroup<C99>;
def warn_cxx98_compat_empty_fnmacro_arg : Warning<
  "empty macro arguments are incompatible with C++98">,
  InGroup<CXX98CompatPedantic>, DefaultIgnore;
def note_macro_here : Note<"macro %0 defined here">;

def err_pp_opencl_variadic_macros :
  Error<"variadic macros not supported in OpenCL">;

def err_pp_invalid_directive : Error<"invalid preprocessing directive">;
def err_pp_directive_required : Error<
  "%0 must be used within a preprocessing directive">;
def err_pp_file_not_found : Error<"'%0' file not found">, DefaultFatal;
def err_pp_file_not_found_not_fatal : Error<
  "'%0' file not found with <angled> include; use \"quotes\" instead">;
def err_pp_error_opening_file : Error<
  "error opening file '%0': %1">, DefaultFatal;
def err_pp_empty_filename : Error<"empty filename">;
def err_pp_include_too_deep : Error<"#include nested too deeply">;
def err_pp_expects_filename : Error<"expected \"FILENAME\" or <FILENAME>">;
def err_pp_macro_not_identifier : Error<"macro names must be identifiers">;
def err_pp_missing_macro_name : Error<"macro name missing">;
def err_pp_missing_rparen_in_macro_def : Error<
  "missing ')' in macro parameter list">;
def err_pp_invalid_tok_in_arg_list : Error<
  "invalid token in macro parameter list">;
def err_pp_expected_ident_in_arg_list : Error<
  "expected identifier in macro parameter list">;
def err_pp_expected_comma_in_arg_list : Error<
  "expected comma in macro parameter list">;
def err_pp_duplicate_name_in_arg_list : Error<
  "duplicate macro parameter name %0">;
def err_pp_stringize_not_parameter : Error<
  "'#' is not followed by a macro parameter">;
def err_pp_malformed_ident : Error<"invalid #ident directive">;
def err_pp_unterminated_conditional : Error<
  "unterminated conditional directive">;
def pp_err_else_after_else : Error<"#else after #else">;
def pp_err_elif_after_else : Error<"#elif after #else">;
def pp_err_else_without_if : Error<"#else without #if">;
def pp_err_elif_without_if : Error<"#elif without #if">;
def err_pp_endif_without_if : Error<"#endif without #if">;
def err_pp_expected_value_in_expr : Error<"expected value in expression">;
def err_pp_expected_rparen : Error<"expected ')' in preprocessor expression">;
def err_pp_expected_eol : Error<
  "expected end of line in preprocessor expression">;
def err_pp_defined_requires_identifier : Error<
  "operator 'defined' requires an identifier">;
def err_pp_missing_lparen : Error<"missing '(' after '%0'">;
def err_pp_missing_rparen : Error<"missing ')' after '%0'">;
def err_pp_colon_without_question : Error<"':' without preceding '?'">;
def err_pp_division_by_zero : Error<
  "division by zero in preprocessor expression">;
def err_pp_remainder_by_zero : Error<
  "remainder by zero in preprocessor expression">;
def err_pp_expr_bad_token_binop : Error<
  "token is not a valid binary operator in a preprocessor subexpression">;
def err_pp_expr_bad_token_start_expr : Error<
  "invalid token at start of a preprocessor expression">;
def err_pp_invalid_poison : Error<"can only poison identifier tokens">;
def err_pp_used_poisoned_id : Error<"attempt to use a poisoned identifier">;

def err_feature_check_malformed : Error<
  "builtin feature check macro requires a parenthesized identifier">;

def err_warning_check_malformed : Error<
  "builtin warning check macro requires a parenthesized string">;
def warn_has_warning_invalid_option :
   ExtWarn<"__has_warning expected option name (e.g. \"-Wundef\")">,
   InGroup<MalformedWarningCheck>;

def warn_pragma_include_alias_mismatch_angle :
   ExtWarn<"angle-bracketed include <%0> cannot be aliased to double-quoted "
   "include \"%1\"">, InGroup<UnknownPragmas>;
def warn_pragma_include_alias_mismatch_quote :
   ExtWarn<"double-quoted include \"%0\" cannot be aliased to angle-bracketed "
   "include <%1>">, InGroup<UnknownPragmas>;
def warn_pragma_include_alias_expected :
   ExtWarn<"pragma include_alias expected '%0'">,
   InGroup<UnknownPragmas>;
def warn_pragma_include_alias_expected_filename :
   ExtWarn<"pragma include_alias expected include filename">,
   InGroup<UnknownPragmas>;

def err__Pragma_malformed : Error<
  "_Pragma takes a parenthesized string literal">;
def err_pragma_comment_malformed : Error<
  "pragma comment requires parenthesized identifier and optional string">;
def err_pragma_message_malformed : Error<
  "pragma message requires parenthesized string">;
def err_pragma_push_pop_macro_malformed : Error<
   "pragma %0 requires a parenthesized string">;
def warn_pragma_pop_macro_no_push : Warning<
   "pragma pop_macro could not pop '%0', no matching push_macro">;
def warn_pragma_message : Warning<"%0">,
   InGroup<PoundPragmaMessage>, DefaultWarnNoWerror;
def warn_pragma_ignored : Warning<"unknown pragma ignored">,
   InGroup<UnknownPragmas>, DefaultIgnore;
def ext_stdc_pragma_ignored : ExtWarn<"unknown pragma in STDC namespace">,
   InGroup<UnknownPragmas>;
def ext_on_off_switch_syntax :
   ExtWarn<"expected 'ON' or 'OFF' or 'DEFAULT' in pragma">,
   InGroup<UnknownPragmas>;
def ext_pragma_syntax_eod :
   ExtWarn<"expected end of directive in pragma">,
   InGroup<UnknownPragmas>;
def warn_stdc_fenv_access_not_supported :
   Warning<"pragma STDC FENV_ACCESS ON is not supported, ignoring pragma">,
   InGroup<UnknownPragmas>;
def warn_pragma_diagnostic_invalid :
   ExtWarn<"pragma diagnostic expected 'error', 'warning', 'ignored', 'fatal',"
            " 'push', or 'pop'">,
   InGroup<UnknownPragmas>;
def warn_pragma_diagnostic_cannot_pop :
   ExtWarn<"pragma diagnostic pop could not pop, no matching push">,
   InGroup<UnknownPragmas>;
def warn_pragma_diagnostic_invalid_option :
   ExtWarn<"pragma diagnostic expected option name (e.g. \"-Wundef\")">,
   InGroup<UnknownPragmas>;
def warn_pragma_diagnostic_invalid_token :
   ExtWarn<"unexpected token in pragma diagnostic">,
   InGroup<UnknownPragmas>;
def warn_pragma_diagnostic_unknown_warning :
   ExtWarn<"unknown warning group '%0', ignored">,
   InGroup<UnknownPragmas>;
// - #pragma __debug
def warn_pragma_debug_unexpected_command : Warning<
  "unexpected debug command '%0'">;

def err_pragma_comment_unknown_kind : Error<"unknown kind of pragma comment">;
def err_defined_macro_name : Error<"'defined' cannot be used as a macro name">;
def err_paste_at_start : Error<
  "'##' cannot appear at start of macro expansion">;
def err_paste_at_end : Error<"'##' cannot appear at end of macro expansion">;
def ext_paste_comma : Extension<
  "token pasting of ',' and __VA_ARGS__ is a GNU extension">, InGroup<GNU>;
def err_unterm_macro_invoc : Error<
  "unterminated function-like macro invocation">;
def err_too_many_args_in_macro_invoc : Error<
  "too many arguments provided to function-like macro invocation">;
def err_too_few_args_in_macro_invoc : Error<
  "too few arguments provided to function-like macro invocation">;
def err_pp_bad_paste : Error<
  "pasting formed '%0', an invalid preprocessing token">;
def err_pp_bad_paste_ms : Warning<
  "pasting formed '%0', an invalid preprocessing token">, DefaultError,
  InGroup<DiagGroup<"invalid-token-paste">>;
def err_pp_operator_used_as_macro_name : Error<
  "C++ operator '%0' cannot be used as a macro name">;
def err_pp_illegal_floating_literal : Error<
  "floating point literal in preprocessor expression">;
def err_pp_line_requires_integer : Error<
  "#line directive requires a positive integer argument">;
def ext_pp_line_zero : Extension<
  "#line directive with zero argument is a GNU extension">, 
  InGroup<GNU>;
def err_pp_line_invalid_filename : Error<
  "invalid filename for #line directive">;
def warn_pp_line_decimal : Warning<
  "#line directive interprets number as decimal, not octal">;
def err_pp_line_digit_sequence : Error<
  "#line directive requires a simple digit sequence">;
def err_pp_linemarker_requires_integer : Error<
  "line marker directive requires a positive integer argument">;
def err_pp_linemarker_invalid_filename : Error<
  "invalid filename for line marker directive">;
def err_pp_linemarker_invalid_flag : Error<
  "invalid flag line marker directive">;
def err_pp_linemarker_invalid_pop : Error<
  "invalid line marker flag '2': cannot pop empty include stack">;
def ext_pp_line_too_big : Extension<
  "C requires #line number to be less than %0, allowed as extension">;
def warn_cxx98_compat_pp_line_too_big : Warning<
  "#line number greater than 32767 is incompatible with C++98">,
  InGroup<CXX98CompatPedantic>, DefaultIgnore;

def err_pp_visibility_non_macro : Error<"no macro named %0">;

def err_pp_arc_cf_code_audited_syntax : Error<"expected 'begin' or 'end'">;
def err_pp_double_begin_of_arc_cf_code_audited : Error<
  "already inside '#pragma clang arc_cf_code_audited'">;
def err_pp_unmatched_end_of_arc_cf_code_audited : Error<
  "not currently inside '#pragma clang arc_cf_code_audited'">;
def err_pp_include_in_arc_cf_code_audited : Error<
  "cannot #include files inside '#pragma clang arc_cf_code_audited'">;
def err_pp_eof_in_arc_cf_code_audited : Error<
  "'#pragma clang arc_cf_code_audited' was not ended within this file">;

// Module map parsing
def err_mmap_unknown_token : Error<"skipping stray token">;
def err_mmap_expected_module : Error<"expected module declaration">;
def err_mmap_expected_module_name : Error<"expected module name">;
def err_mmap_expected_lbrace : Error<"expected '{' to start module '%0'">;
def err_mmap_expected_rbrace : Error<"expected '}'">;
def note_mmap_lbrace_match : Note<"to match this '{'">;
def err_mmap_expected_rsquare : Error<"expected ']' to close attribute">;
def note_mmap_lsquare_match : Note<"to match this ']'">;
def err_mmap_expected_member : Error<
  "expected umbrella, header, submodule, or module export">;
def err_mmap_expected_header : Error<"expected a header name after '%0'">;
def err_mmap_module_redefinition : Error<
  "redefinition of module '%0'">;
def note_mmap_prev_definition : Note<"previously defined here">;
def err_mmap_header_conflict : Error<
  "header '%0' is already part of module '%1'">;
def err_mmap_header_not_found : Error<
  "%select{|umbrella }0header '%1' not found">;
def err_mmap_umbrella_dir_not_found : Error<
  "umbrella directory '%0' not found">;
def err_mmap_umbrella_clash : Error<
  "umbrella for module '%0' already covers this directory">;
def err_mmap_export_module_id : Error<
  "expected an exported module name or '*'">;
def err_mmap_expected_library_name : Error<
  "expected %select{library|framework}0 name as a string">;
def err_mmap_missing_module_unqualified : Error<
  "no module named '%0' visible from '%1'">;
def err_mmap_missing_module_qualified : Error<
  "no module named '%0' in '%1'">;
def err_mmap_top_level_inferred_submodule : Error<
  "only submodules and framework modules may be inferred with wildcard syntax">;
def err_mmap_inferred_no_umbrella : Error<
  "inferred submodules require a module with an umbrella">;
def err_mmap_inferred_framework_submodule : Error<
  "inferred submodule cannot be a framework submodule">;
def err_mmap_explicit_inferred_framework : Error<
  "inferred framework modules cannot be 'explicit'">;
def err_mmap_missing_exclude_name : Error<
  "expected excluded module name">;
def err_mmap_inferred_redef : Error<
  "redefinition of inferred submodule">;
def err_mmap_expected_lbrace_wildcard : Error<
  "expected '{' to start inferred submodule">;
def err_mmap_expected_inferred_member : Error<
  "expected %select{module exclusion with 'exclude'|'export *'}0">;
def err_mmap_expected_export_wildcard : Error<
  "only '*' can be exported from an inferred submodule">;
def err_mmap_explicit_top_level : Error<
  "'explicit' is not permitted on top-level modules">;
def err_mmap_nested_submodule_id : Error<
  "qualified module name can only be used to define modules at the top level">;
def err_mmap_expected_feature : Error<"expected a feature name">;
def err_mmap_expected_attribute : Error<"expected an attribute name">;
def warn_mmap_unknown_attribute : Warning<"unknown attribute '%0'">,
  InGroup<IgnoredAttributes>;

def warn_auto_module_import : Warning<
  "treating #%select{include|import|include_next|__include_macros}0 as an "
  "import of module '%1'">, InGroup<AutoImport>, DefaultIgnore;
def warn_uncovered_module_header : Warning<
  "umbrella header for module '%0' does not include header '%1'">, 
  InGroup<IncompleteUmbrella>;
def err_expected_id_building_module : Error<
  "expected a module name in '__building_module' expression">;
  
}
