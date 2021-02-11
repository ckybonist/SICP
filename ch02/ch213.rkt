#lang racket

(require rackunit)

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)

(define (car z) (z 0))
(define (cdr z) (z 1))

(check-eq? (car (cons 8 7)) 8)
(check-eq? (cdr (cons 8 7)) 7)