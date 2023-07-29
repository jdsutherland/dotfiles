;; extends
(("function" @keyword.function) (#set! conceal "ƒ"))
(("const" @keyword) (#set! conceal "𝔠"))
(("static" @keyword) (#set! conceal "∬"))

; (((import_statement) @include (#eq? @include "import")) (#set! conceal "ɪ"))

(((true) @boolean) (#set! conceal "✓"))
(((false) @boolean) (#set! conceal "✗"))

(("let" @keyword) (#set! conceal "ℓ"))
(("return" @keyword.return) (#set! conceal "⇚"))
(("=>" @operator) (#set! conceal "⇒"))
((";" @punctuation.delimiter) (#set! conceal ""))
(((null) @special) (#set! conceal "ø"))
(((this) @variable.builtin) (#set! conceal "@"))

(("implements" @keyword) (#set! conceal ":"))
(("extends" @keyword) (#set! conceal "<"))
(("export" @keyword) (#set! conceal "➕"))
(("interface" @keyword) (#set! conceal "♀"))
(("type" @keyword) (#set! conceal "₪"))

(("readonly" @type.qualifier) (#set! conceal "∱"))

(((predefined_type) @type.builtin (#eq? @type.builtin "string")) (#set! conceal "⟆"))
(((predefined_type) @type.builtin (#eq? @type.builtin "boolean")) (#set! conceal "ƀ"))
(((predefined_type) @type.builtin (#eq? @type.builtin "integer")) (#set! conceal "ⅰ"))
(((predefined_type) @type.builtin (#eq? @type.builtin "number")) (#set! conceal "ℤ"))
(((predefined_type) @type.builtin (#eq? @type.builtin "unknown")) (#set! conceal "?"))
(((predefined_type) @type.builtin (#eq? @type.builtin "any")) (#set! conceal "∀"))
(((predefined_type) @type.builtin (#eq? @type.builtin "never")) (#set! conceal "⊘"))
(((predefined_type) @type.builtin (#eq? @type.builtin "void")) (#set! conceal "⍉"))

; (("new" @keyword.operator) (#set! conceal "μ"))
