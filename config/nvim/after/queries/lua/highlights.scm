;; extends
(("function" @keyword.function) (#set! conceal "ƒ"))
(("local" @keyword) (#set! conceal "ℓ"))
(("return" @keyword.return) (#set! conceal "⇚"))
((function_call name: (identifier) @function.builtin (#eq? @function.builtin "require")) (#set! conceal "ʀ"))
