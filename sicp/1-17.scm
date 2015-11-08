(define (double x) (* 2 x))
(define (halve x) (/ x 2))

(define (fast-multi a b)
  (define (fast-multi-iter a product)
    (cond ((= a 1) product)
          ((= (/ a 2) 0) (fast-multi-iter (halve a) (double product)))
          (else (+ product (fast-multi-iter (halve (- a 1)) (double product))))))
  (fast-multi-iter a b))

(fast-multi 3 5)