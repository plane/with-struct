#lang racket/base

(require "../main.rkt")

(module+ test
  (require racket/math
           rackunit)

  (struct point (x y)
    #:transparent)
  
  (check-equal? 
    (map 
      (lambda/with (p)
        p : point
        (+ p.x p.y))
      (list (point 1 2)
            (point 3 4)))
    '(3 7))

  (check-equal?
    (map 
      (λ/with (p)
        p : point
        (+ p.x p.y))
      (list (point 1 2)
            (point 3 4)))
    '(3 7)))

