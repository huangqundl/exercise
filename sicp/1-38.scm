(define (cont-frac n d k)
  (define (cont-frac-i i)
    (if (= i (+ k 1))
        0
        (/ (n i) (+ (d i) (cont-frac-i (+ i 1))))))
  
  (cont-frac-i 1))

(define (cont-frac2 n d k)
  (define (cont-frac-iter i result)
    (if (= i 0)
        result
        (cont-frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
  
  (cont-frac-iter k 0))

(define (seq n)
  (cond ((= n 0)
         (newline))
        (else
         (seq (- n 1))
         (display n)
         (newline)
         (display (+ 2(cont-frac2 (lambda (i) 1.0)
                              (lambda (i)
                                (if (= (remainder i 3) 2)
                                       (* 2 (/ (+ i 1) 3))
                                       1))
                              n)))
         (newline))))

(seq 10)