(define (f n)
  (if (< n 3) n
      (+ (f (- n 1)) (* 2 (f (- n 2))) (* 3 (f (- n 3))))))
	  

(define (f n)
  (define (f-iter f1 f2 f3 current max)
  (if (> current  max) f3
      (f-iter f2 f3 (+ (* 3 f1) (* 2 f2) f3) (+ current 1) max)))
  
  (if (< n 3) n
      (f-iter 0 1 2 3 n)))