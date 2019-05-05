#!/usr/local/bin/racket
#lang racket

; Determine whether the interpreter he is faced with is using
; applicative-order evaluation or normal-order evaluation for 
; following two procedures:
(define (p) (p))

(define (test x y) 
  (if (= x 0) 
      0 
      y))

; 1. (test 0 (p))
;
; Applicative Order (Never terminate):
; 2. (p (p (p (p (.....)))))  infinte recursion
; 3. Stuck in (test 0 (p)) because of evaluating (p)
;
; Normal Order (return 0):
; 2. (if (= 0 0)
;        0
;        (p))
; 3. (if #t 0 (p))
; 4. Result is 0
(test 0 (p))
