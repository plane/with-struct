#lang racket/base

(require "../main.rkt")

(module+ test
  (require racket/math
           rackunit)

  (struct point (x y) 
    #:transparent)
  
  (define/with (foo p q)
    p : point
    q : point
    (+ p.x q.y))

  (define/with (dist p q)
    p : point
    q : point
    (sqrt
     (+ (sqr (- p.x q.x))
        (sqr (- p.y q.y)))))

  (define/with (add-xy p)
    p : point
    (+ p.x p.y))

  (define/this (add-xy* this)
    this : point
    (+ x y))

  (define p (point 2 3))
  (define q (point 3 4))

  (check-equal? (foo p q) 6)
  (check-equal? (dist p q) (sqrt 2))
  (check-equal? (add-xy p) 5)
  (check-equal? (add-xy* q) 7))

