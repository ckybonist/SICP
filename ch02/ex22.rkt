#lang racket

(provide (all-defined-out))

; util
(define (avg x y) (exact->inexact (/ (+ x y) 2)))

; Point
(define (make-point x y) (cons x y))
(define (x-point point) (car point))
(define (y-point point) (cdr point))
(define (is-point? element) (pair? element))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; Segment
(define (make-segment . points)
  (if
    (ormap (lambda (e) (not (is-point? e))) points) (error 'Error "Only point could form the segment.")
    points))

(define (start-segment segment) (car segment))
(define (end-segment segment) (car (cdr segment)))
(define (mid-point segment)
  (let ([s (start-segment segment)] [e (end-segment segment)])
    (make-point
      (avg (x-point s) (x-point e))
      (avg (y-point s) (y-point e)))))