(define (product2 term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (facterial n)
  (define (term x) x)
  (define (next x) (+ 1 x))
  (product term 1 next n))

(facterial 6)

(define (calculate-pi n)
  (define (term x) (/ (+ 2 (* 2 (quotient x 2)))
                      (+ 1 (* 2 (quotient (+ x 1) 2)))))
  (define (next x) (+ x 1))
  
  (* 4 (product term 1 next n)))

(calculate-pi 100.0)