#lang racket

(require rackunit)

(define (cons x y)
  (define (dispatch m)
    (cond ((= m 0) x)
          ((= m 1) y)
          (else (error "Argument not 0 or 1: CONS" m))))
  dispatch)
(check-exn exn:fail?
  (lambda () ((cons 2 1) 2))
  "Should raise error if the arugment of dispatch is neither 0 nor 1")

(define (car z) (z 0))
(define (cdr z) (z 1))

(check-eq? (car (cons 8 7)) 8)
(check-eq? (cdr (cons 8 7)) 7)