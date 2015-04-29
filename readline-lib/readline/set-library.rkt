#lang racket/base

;; Library to allow for changing the libreadline implementation.

;; For example, to use libreadline in .racketrc:
;;
;; (require readline/set-library
;;          ffi/unsafe)
;; (current-readline-library (ffi-lib "libreadline" '("5" "6" "4" "")))
;; (require readline)

(require racket/contract/base
         (only-in ffi/unsafe
                  ffi-lib
                  ffi-lib?))
(provide (contract-out [current-readline-library (case-> (-> ffi-lib?)
                                                         (-> ffi-lib? void?))]))

(define current-readline-library (make-parameter (ffi-lib "libreadline" '("3" "2" ""))))
