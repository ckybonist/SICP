#lang racket

(define (last-pair pairs)
  (if (= 1 (length pairs))
    pairs
    (last-pair (cdr pairs))))

(last-pair (list 23 72 149 34))