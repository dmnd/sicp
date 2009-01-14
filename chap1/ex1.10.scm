(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; What are the values of the following expressions?

(A 1 10) ;=> 1024

(A 2 4) ;=> 65536

(A 3 3) ;=> 65536

; Consider the following procedures, where A is the procedure defined above:

(define (f n) (A 0 n)) ; => 2n

(define (g n) (A 1 n))
; n => (A 1 n)
; 0 => 0
; 1 => 2
; >1 => (A 0 (A 1 n-1)) = (* 2 (g n-1)) = (expt 2 n)

(define (h n) (A 2 n))
; (h n) => (A 2 n)
; (h 0) => (A 2 0) => 0
; (h 1) => (A 2 1) => 2
; (h 2) => (A 2 2) => (A 1 (h n-1)) => (g (h n-1)) => (expt 2 (h n-1))
; tetration!

(define (k n) (* 5 n n)) ; => 5n^2