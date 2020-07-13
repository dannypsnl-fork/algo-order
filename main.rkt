#lang rosette/safe

(define-symbolic C integer?)
(define-symbolic N integer?)

;;; n^2 + 20n
(define (g n) (+ (expt n 2)
                 (* 20 n)))
;;; n^2
(define (f n) (expt n 2))

(define (big-O f g)
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
          (assert (positive? C))
          (assert (< (g N)
                     (* C (f N))))
          (assert (> (g N)
                     (* C (f N)))))))

(big-O f g)
(big-O g f)
(Ω f g)
(θ f g)
