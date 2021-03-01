#lang racket

(require rackunit)

(define (equal? compared target)
    (cond
        [(or (null? compared) (null? target)) #f]
        [(and (symbol? compared) (symbol? target)) (eq? compared target)]
        [(and (list? compared) (list? target))
            (if (and (eq? 1 (length compared)) (eq? 1 (length compared)))
                (eq? (car compared) (car target))
                (equal? (cdr compared) (cdr target)))]))

(check-true
    (equal? '(this is a list)
            '(this is a list)))

(check-false
    (equal? '(this is a list) 
            '(this (is a) list)))

(check-true (equal? 'kiki 'kiki))
(check-false (equal? 'kiki 'wiwi))