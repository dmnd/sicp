(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (smallest-divisor n)
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (next test-divisor)))))
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
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

(search-for-primes 1000000000 3) ;=> old .12, new 0.07
(search-for-primes 10000000000 3) ;=> .39, .24
(search-for-primes 100000000000 3) ;=> 1.24, .77

; not twice as fast because now we're testing for 2 all the time.
