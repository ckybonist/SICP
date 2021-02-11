#lang racket

(require rackunit)
(require "../ex22.rkt")
(provide make-rectangle width height)

(define (len x y) (abs (- x y)))

; Variant rectangle abstraction that without '(width height) metadata
(define (make-rectangle width height base-point)
  (let (
    [p1 (make-point (+ width (x-point base-point)) (y-point base-point))]
    [p2 (make-point (x-point base-point) (+ height (y-point base-point)))]
    [p3 (make-point (+ width (x-point base-point)) (+ height (y-point base-point)))])
    (list base-point p1 p2 p3)))

(define (width rectangle)
  (let ([pa (car rectangle)] [pb (last rectangle)])
    (len (x-point pa) (x-point pb))))

(define (height rectangle)
  (let ([pa (car rectangle)] [pb (last rectangle)])
    (len (y-point pa) (y-point pb))))

(check-eq? 10 (width (make-rectangle 10 20 (make-point 3 5))))
(check-eq? 20 (height (make-rectangle 10 20 (make-point 3 5))))