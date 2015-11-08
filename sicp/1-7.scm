(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess-old guess)
  (< (abs (- guess-old guess))  (* guess 0.001)))

(define (sqrt-iter guess-old guess x)
  (if (good-enough? guess-old guess)
      guess
      (sqrt-iter guess (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 0.9 1.0 x))