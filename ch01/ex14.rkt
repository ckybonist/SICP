#!/usr/local/bin/racket
#lang racket

; Observe that our model of evaluation allows for combinations whose operators are
; compound expressions. Use this observation to describe the behavior of the
; following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; (a-plus-abs-b 5 -3)
; ((if (> -3 0) + -) 5 -3)
; ((if #f + -) 5 -3)
; (- 5 -3)
; 8
(a-plus-abs-b 5 (- 3))