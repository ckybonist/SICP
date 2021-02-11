#lang racket

(require rackunit)
(require "../ex22.rkt")
(provide make-rectangle width height)

(define (make-rectangle width height base-point)
  (let (
    [p1 (make-point (+ width (x-point base-point)) (y-point base-point))]
    [p2 (make-point (x-point base-point) (+ height (y-point base-point)))]
    [p3 (make-point (+ width (x-point base-point)) (+ height (y-point base-point)))])
    (list base-point p1 p2 p3 (cons width height))))


(define (width rectangle) (car (last rectangle)))
(define (height rectangle) (cdr (last rectangle)))
(let ([rectangle (make-rectangle 10 20 (make-point 0 0))])
  (check-eq? (width rectangle) 10 "width is correct?")
  (check-eq? (height rectangle) 20 "height is correct?"))
