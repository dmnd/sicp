(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define r remainder)

(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (r 206 40)))
(gcd 40 (r 206 40))
(if (= (r 206 40) 0)
    40
    (gcd (r 206 40) (r 40 (r 206 40))))
; (r 206 40) => 6
(if (= 6 0)
    40
    (gcd (r 206 40) (r 40 (r 206 40))))
(gcd (r 206 40) (r 40 (r 206 40)))
(if (= (r 40 (r 206 40)) 0)
    (r 206 40)
    (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))
; (r 40 (r 206 40)) => (r 40 6) => 4
(if (= 6 0)
    (r 206 40)
    (gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))
(gcd (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))
(if (= (r (r 206 40) (r 40 (r 206 40))) 0)
    (r 40 (r 206 40))
    (gcd (r (r 206 40) (r 40 (r 206 40)))
         (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))
; (r (r 206 40) (r 40 (r 206 40))) => (r (r 206 40) (r 40 6)) => (r 6 4) => 2
(if (= 2 0)
    (r 40 (r 206 40))
    (gcd (r (r 206 40) (r 40 (r 206 40)))
         (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40))))))

(gcd (r (r 206 40) (r 40 (r 206 40)))
     (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))

(if (= (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) 0)
    (r (r 206 40) (r 40 (r 206 40)))
    (gcd (r (r 206 40) (r 40 (r 206 40)))
         (r (r (r 206 40) (r 40 (r 206 40)))
            (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))))))

; (r (r 40 (r 206 40)) (r (r 206 40) (r 40 (r 206 40)))) => (r (r 40 6) (r 6 (r 40 6))) => (r 4 (r 6 4)) => (r 4 2) => 0

(r (r 206 40) (r 40 (r 206 40)))
(r (r 206 40) (r 40 6))
(r 6 4)
2

; a lot of calls to remainder in normal order

(gcd 206 40)
(if (= 40 0)
    206
    (gcd 40 (r 206 40)))
(gcd 40 (r 206 40))
(gcd 40 6)
(if (= 6 0)
    40
    (gcd 6 (r 40 6)))
(gcd 6 (r 40 6))
(gcd 6 4)
(if (= 4 0)
    6
    (gcd 4 (r 6 4)))
(gcd 4 (r 6 4))
(gcd 4 2)
(if (= 2 0)
    4
    (gcd 2 (r 4 2)))
(gcd 2 0)
(if (= 0 0)
    2
    (gcd 0 (r 2 0)))
2
; 4 calls to remainder.
