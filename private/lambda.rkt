#lang racket/base

(provide lambda/with
         lambda/this
         λ/with
         λ/this)

(require (for-syntax racket/base
                     syntax/parse)
         "with.rkt")

(define-syntax (lambda/with stx)
  (syntax-parse stx
    #:track-literals
    [(_ (args ...)
        (~seq id:expr : type:id) ...
        e:expr ...)
     #'(lambda (args ...)
         (with ([type id] ...)
           e ...))]))

(define-syntax (lambda/this stx)
  (syntax-parse stx
    #:track-literals
    [(_ (args ...)
        id:expr : type:id
        e:expr ...)
     #'(lambda (args ...)
         (with id : type
           e ...))]))

(define-syntax λ/with
  (make-rename-transformer #'lambda/with))

(define-syntax λ/this
  (make-rename-transformer #'lambda/this))

