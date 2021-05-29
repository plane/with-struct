#lang racket/base

(provide with)
         
(require (for-syntax racket/base
                     syntax/parse)
         struct-define)

(define-syntax (with stx)
  (syntax-parse stx
    #:track-literals
    [(_ ([type:id id:expr] ...)
        e:expr ...)
     #'(let ()
         (struct-define type id #:prefix) ...
         e ...)]
    
    [(_ ((~seq id:expr : type:id) ...)
        e:expr ...)
     #'(let ()
         (struct-define type id #:prefix) ...
         e ...)]
    
    [(_ id:expr : type:id
        e:expr ...)
     #'(let ()
         (struct-define type id)
         e ...)]))

