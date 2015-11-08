(define (f n)
  (define (f-iter f1 f2 current max)
    (if (= current max) f1
        (f-iter f2 (+ f1 f2) (+ 1 current) max)))
  (f-iter 0 1 0 n))

(define (sqrt x)
  (define (sqrt-iter guess-old guess x)
    (define (improve guess x)
      (define (average x y)
          (/ (+ x y) 2))
      (average guess (/ x guess)))

    (define (good-enough? guess-old guess)
      (< (abs (- guess-old guess))  (* guess 0.001)))
    
    (if (good-enough? guess-old guess)
        guess
        (sqrt-iter guess (improve guess x) x)))
  
  (sqrt-iter 0.9 1.0 x))

(define (limit-n n)
  (define fi (/ (+ 1 (sqrt 5)) 2))
  (define (limit-n-iter product current max)
    (if (= current max)
        product
        (limit-n-iter (* product fi) (+ 1 current) max)))
  (/ (limit-n-iter 1 0 n) (sqrt 5)))

(define (diff n)
  (abs (- (limit-n n) (f n))))


(diff 10)