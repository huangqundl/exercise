(define (cube x)
  (* x x x))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))

(define (good-enough? guess-old guess)
  (< (abs (- guess-old guess))  (* guess 0.001)))

(define (cube-sqrt-iter guess-old guess x)
  (if (good-enough? guess-old guess)
      guess
      (cube-sqrt-iter guess (improve guess x) x)))

(define (cube-sqrt x)
  (cube-sqrt-iter 0.99 1.0 x))

(cube-sqrt 8)