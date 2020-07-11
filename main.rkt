#lang rosette/safe

(define-symbolic C integer?)
(define-symbolic N integer?)

;;; n^2 + 20n
(define (g n) (+ (expt n 2)
                 (* 20 n)))
;;; n^2
(define (f n) (expt n 2))

(solve
 (begin (assert(>= N 0))
        (assert (positive? C))
        (assert (< (g N)
                   (* C (f N))))))
