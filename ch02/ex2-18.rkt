#lang racket

(define (reverse xs)
  (if (null? xs)
    '()
    (append (reverse (cdr xs)) (list (car xs)))))

(reverse (list 1 4 9 16 25))