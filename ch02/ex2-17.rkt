#lang racket

(require rackunit)

(define (last-pair pairs)
  (if (= 1 (length pairs))
    pairs
    (last-pair (cdr pairs))))

(check-equal?
  '(34)
  (last-pair (list 23 72 149 34)))