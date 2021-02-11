#lang racket

(require rackunit)
; (require "rectangle.rkt")
(require "rectangle-variant.rkt")
(require "../ex22.rkt")

(define (perimeter rectangle)
  (* 2 (+ (width rectangle) (height rectangle))))
(check-eq?
  (* 2 (+ 10 20))
  (perimeter (make-rectangle 10 20 (make-point 0 0))))

(define (area rectangle)
  (* (width rectangle) (height rectangle)))
(check-eq?
  (* 10 20)
  (area (make-rectangle 10 20 (make-point 1 1))))