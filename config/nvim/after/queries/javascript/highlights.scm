;; extends
(("function" @keyword.function) (#set! conceal "ƒ"))
(("const" @keyword) (#set! conceal "𝔠"))
(("static" @keyword) (#set! conceal "∬"))

; TODO: seems can't split 'import'
; (((import_statement) @include (#eq? @include "import")) (#set! conceal "ɪ"))
((call_expression function: (identifier) @function.builtin (#eq? @function.builtin "require")) (#set! conceal "ʀ"))

(((true) @boolean) (#set! conceal "✓"))
(((false) @boolean) (#set! conceal "✗"))

(((undefined) @constant.builtin) (#set! conceal "¿"))
(((property_identifier) @property) (#eq? @property "prototype") (#set! conceal "¶"))

(("let" @keyword) (#set! conceal "ℓ"))
(("return" @keyword.return) (#set! conceal "⇚"))
(("=>" @operator) (#set! conceal "⇒"))
((";" @punctuation.delimiter) (#set! conceal ""))
(((null) @special) (#set! conceal "ø"))
(((this) @variable.builtin) (#set! conceal "@"))

(("extends" @keyword) (#set! conceal "<"))
; TODO: use this concealchar?
(("export" @keyword) (#set! conceal "➕"))

; (("new" @keyword.operator) (#set! conceal "μ"))
