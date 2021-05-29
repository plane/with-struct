#lang racket/base

(require "../main.rkt")

(module+ test
  (require rackunit)

  (struct point (x y) 
    #:transparent)
  (define p (point 2 3))
  (define q (point 3 4))
  
  (check-equal? 
    (with ([point p]
           [point q])
      (* (+ p.x q.x)
         (+ p.y q.y)))
    35)

  (check-equal? 
    (with (p : point         
           q : point)
      (+ p.x q.y))
    6))

