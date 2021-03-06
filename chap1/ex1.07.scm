(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; good-enough? doesn't work too well for small numbers:
(sqrt .0001)
  ;=> .032 rather than .01

(define (good-enough? guess x)
  (< (/ (abs (- (square guess) x))
        x)
     .001))

; this new version will ensure that sqrt is accurate to 0.1%.
(sqrt .0001)
  ;=> 1.0000714038711746e-2