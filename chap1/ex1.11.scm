(define (f-recursive n)
  (cond ((< n 3) n)
        (else (+ (f-recursive (- n 1))
                 (* 2 (f-recursive (- n 2)))
                 (* 3 (f-recursive (- n 3)))))))

(define (f-iterative n)
  (define (f-iter a b c n)
    (if (= n 0)
        a
        (f-iter (+ a (* 2 b) (* 3 c))
                a
                b
                (- n 1))))
  (if (< n 3)
      n
      (f-iter 2 1 0 (- n 2))))