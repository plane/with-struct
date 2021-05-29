#lang info

(define collection "with-struct")
(define pkg-authors '("crystal@panix.com"))
(define version "0.1")
;(define scribblings
;  '(("with-struct.scrbl" () (library) "with-struct")))
(define pkg-desc "Happy little #%app enhancement")
(define deps '("base"
               "struct-define"
               "reprovide-lang-lib"))
(define build-deps '("rackunit-lib"
                     "racket-doc"
                     "scribble-lib"))
(define compile-omit-paths '("examples"))

