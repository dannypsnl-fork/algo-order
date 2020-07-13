#lang rosette/safe

(define-symbolic C C1 integer?)
(define-symbolic N N1 integer?)

;;; n^2 + 20n
(define (g n) (+ (expt n 2)
                 (* 20 n)))
;;; n^2
(define (f n) (expt n 2))

(define (O f g)
  (solve
   (begin (assert (>= N 0))
          (assert (positive? C))
          (assert (< (g N)
                     (* C (f N)))))))
(define (Ω f g)
  (solve
   (begin (assert (>= N 0))
          (assert (positive? C))
          (assert (> (g N)
                     (* C (f N)))))))
(define (θ f g)
  (solve
   (begin (assert (>= N 0))
          (assert (>= N1 0))
          (assert (positive? C))
          (assert (positive? C1))
          (assert (< (g N)
                     (* C (f N))))
          (assert (> (g N1)
                     (* C1 (f N1)))))))

(O f g)
(Ω f g)
(θ f g)
