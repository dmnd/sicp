(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
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

(search-for-primes 1000000000 3) ;=> .12
(search-for-primes 10000000000 3) ;=> .39
(search-for-primes 100000000000 3) ;=> 1.24

(sqrt 10) ;=> 3.162
(/ .39 .12) ;=> 3.25
(/ 1.24 .39) ;=> 3.18

; matches predictions.
