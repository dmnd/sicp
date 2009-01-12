(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; expanded version:
(define (a-plus-abs-b-simple a b)
  (if (> b 0)
      (+ a b)
      (- a b)))