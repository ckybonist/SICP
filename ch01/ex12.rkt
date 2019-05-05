#!/usr/local/bin/racket
#lang racket

(/ (+ 5 4 (- 2
            (- 3 
              (+ 6
                 (/ 4.0 5.0)))))
   (* 3 (- 6 2) (- 2 7)))  ; 0.24666666