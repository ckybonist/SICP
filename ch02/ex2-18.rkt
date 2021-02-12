#lang racket

(require rackunit)

(define (reverse xs)
  (if (null? xs)
    '()
    (append (reverse (cdr xs)) (list (car xs)))))

(check-equal?
  '(25 16 9 4 1)
  (reverse (list 1 4 9 16 25)))