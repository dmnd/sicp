(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter b n)
  (define (fei a b n)
    (cond ((= n 0) a)
          ((even? n) (fei a (square b) (/ n 2)))
          (else (fei (* a b) b (- n 1)))))
  (fei 1 b n))

  