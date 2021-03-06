(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fermat-test-complete n)
  (define (test a)
    (cond ((= a 0) #t)
          ((fermat-test n a) (test (- a 1)))
          (else #f)))
  (test (- n 1)))

(fermat-test-complete 561)
(fermat-test-complete 1105)
(fermat-test-complete 1729)
(fermat-test-complete 2465)
(fermat-test-complete 2821)
(fermat-test-complete 6601)