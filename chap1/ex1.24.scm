(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (fast-prime? n 1) ; 1 time. 
      (report-prime (- (runtime) start-time))
      #f))
(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start n)
  (if (= n 0)
      #f
      (if (timed-prime-test start)
          (search-for-primes (next-odd start) (- n 1))
          (search-for-primes (next-odd start) n))))

(define (next-odd n)
  (if (even? n)
      (+ n 1)
      (+ n 2)))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))
;                                   ex1. 22   23  24
(search-for-primes 1000000000 3)   ;    .12  .07   0
(search-for-primes 10000000000 3)  ;    .39  .24   0
(search-for-primes 100000000000 3) ;   1.24  .77   0

; this method is way too fast to measure with (runtime).
