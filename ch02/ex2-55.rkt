#lang racket

(car ''abracadabra)

; Answer
; (car ''abracadabra) could be transformed to
;; (car (quote (quote abracadabra)))
;;; (quote (quote abracadabra) => '(quote abracadabra)
;; (car '(quote abracadabra))
; result: 'quote 
