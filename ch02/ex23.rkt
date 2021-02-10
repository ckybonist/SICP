#lang racket

(require rackunit)
(require "ex22.rkt")

(define (distance p1 p2)
  (sqrt (+
    (sqr (- (x-point p1) (x-point p2)))
    (sqr (- (y-point p1) (y-point p2))))))


(define (make-rectangle width height base-point)
  (let (
    [p1 (make-point (+ width (x-point base-point)) (y-point base-point))]
    [p2 (make-point (x-point base-point) (+ height (y-point base-point)))]
    [p3 (make-point (+ width (x-point base-point)) (+ height (y-point base-point)))])
    (list base-point p1 p2 p3)))

(check-equal?
  (make-rectangle 10 20 (make-point 0 0))
  (list (cons 0 0) (cons 10 0) (cons 0 20) (cons 10 20)))


(define (perimeter rectangle) ())
(define (area rectangle) ())
