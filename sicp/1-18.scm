(define (double x) (* 2 x))
(define (halve x) (/ x 2))

// guarantee a*b + product invarant
(define (fast-multi-2 a b)
  (define (fast-multi-iter-2 a b product)
    (cond ((= a 0) product)
          ((= (/ a 2) 0) (fast-multi-iter-2 (halve a) (double b) product))
          (else (fast-multi-iter-2 (halve (- a 1)) (double b) (+ b product)))))
  (fast-multi-iter-2 a b 0))