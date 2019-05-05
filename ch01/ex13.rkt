#!/usr/local/bin/racket
#lang racket

; square-sum takes three numbers as arguments and 
; returns the sum of the squares of the two larger numbers.

(define (min a b c)
  (cond ((and (< a b) (< a c)) a)
        ((and (< b a) (< b c)) b)
        (else c)))

(define (square x) (* x x))

(define (square-sum a b c)
        (cond ((= (min a b c) a) (+ (square b) (square c)))
              ((= (min a b c) b) (+ (square a) (square c)))
              (else (+ (square a) (square b)))))

(square-sum 1 2 3)  ; 13