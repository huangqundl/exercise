(define (cont-frac n d k)
  (define (cont-frac-i i)
    (let ((N (n i))
          (D (d i)))
    (if (= i (+ k 1))
        0
        (/ N (+ D (cont-frac-i (+ i 1)))))))
  
  (cont-frac-i 1))

(define (cont-frac2 n d k)
  (define (cont-frac-iter i result)
    (if (= i 0)
        result
        (cont-frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
  
  (cont-frac-iter k 0))

(define (tan-cf x k)
  (define (d i) (- (* 2 i) 1))
  (define (n i)
    (if (= i 1)
        x
        (- (* x x))))
  (cont-frac n d k))

(tan-cf 1.0 100)