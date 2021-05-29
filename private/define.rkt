#lang racket/base

(provide define/with
         define/this)

(require (for-syntax racket/base
                     syntax/parse)
         "with.rkt")

(define-syntax (define/with stx)
  (syntax-parse stx
    #:track-literals
    [(_ (name args ...)
        (~seq id:expr : type:id) ...
        e:expr ...)
     #'(define (name args ...)
         (with ([type id] ...)
           e ...))]))

(define-syntax (define/this stx)
  (syntax-parse stx
    #:track-literals
    [(_ (name args ...)
        id:expr : type:id
        e:expr ...)
     #'(define (name args ...)
         (with id : type
           e ...))]))

