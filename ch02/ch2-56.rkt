#lang racket

(require rackunit)

;; Base deriv utils
(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1)
       (variable? v2)
       (eq? v1 v2)))

(define (make-sum a1 a2) (list '+ a1 a2))
(define (make-product m1 m2) (list '* m1 m2))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))
(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))
(define (multiplicand p) (caddr p))

;; End Base deriv utils

;; Extend with exponentiation
(define (=number? exp num)
  (and (number? exp) (eq? exp num)))

(define (exponentiation? exp)
  (and (pair? exp)
       (eq? (car exp) '**)))

(define (base exp) (cadr exp))
(define (exponent exp) (caddr exp))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        ((and (number? base) (number? exponent)) (expt base exponent))
        (else (list '** base exponent))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        
        ((product? exp)
         (make-sum
          (make-product 
           (multiplier exp)
           (deriv (multiplicand exp) var))
          (make-product 
           (deriv (multiplier exp) var)
           (multiplicand exp))))
        
        ((exponentiation? exp)
         (make-product
           (make-product (exponent exp)
                         (make-exponentiation (base exp) (- (exponent exp) 1)))
           (deriv (base exp) var)))
        (else (error "unknown expression 
                      type: DERIV" exp))))

;; Test
(check-false (exponentiation? '(* 2 3)))
(check-true (exponentiation? '(** 2 3)))

(check-equal? (base '(** 2 3)) 2)
(check-equal? (exponent '(** 2 3)) 3)

(check-equal? (make-exponentiation "2" "3") '(** "2" "3"))
(check-equal? 1 (make-exponentiation 2 0))
(check-equal? 3 (make-exponentiation 3 1))
(check-equal? 256 (make-exponentiation 2 8))

(check-equal? (deriv '(** 2 4) 'x) '(* (* 4 8) 0)) 
