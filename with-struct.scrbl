#lang scribble/manual

@title{Title}
@defmodule[with-struct]
@author[@author+email["Plane" "crystal@panix.com"]]

@(require
   scribble/example
   (for-label (except-in racket/base #%app _)
              with-struct))

@(define (make-with-eval)
   (make-base-eval #:lang 'racket/base
                   '(require with-struct)
                   '(random-seed 0)))

@(define-syntax-rule (with-examples body ...)
   (examples #:eval (make-with-eval) #:preserve-source-locations body ...))

Text

@section{Section}

@racketblock[(lambda (x) 
               (+ x 1))]

@(with-examples
  (eval:check #t #t))

