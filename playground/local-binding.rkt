#lang racket

(let fac ([n 10])
  (if (zero? n)
    1
    (* n (fac (sub1 n )))))

(let* ([x 1]
       [y (add1 x)])
    (list  y x))

(letrec ([is-even? (lambda (n)
                      (or (zero? n)
                          (is-odd? (sub1 n))))]
         [is-odd? (lambda (n)
                    (and (not (zero? n))
                         (is-even? (sub1 n))))])
    (is-odd? 11))

(let-values ([(x y) (quotient/remainder 10 3)])
  (list y x))