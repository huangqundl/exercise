p' = p^2 + q^2
q' = q^2 + 2pq

(define (fib n)
  (define (halve x) (/ x 2))
  
  (define (square x)
    (* x x))
  
  (define (sum-of-squrae a b)
    (+ (square a) (square b)))
  
  (define (even? x)
    (if (= (/ x 2) 0)
        true
        false))
  (define (fib-iter a b p q n)
    (cond ((= n 0) b)
          ((even? n)
           (fib-iter a b (sum-of-square p q) (+ (square q) (* 2 p q)) (halve n)))
          (else
           (fib-iter (+ (* b q) (* a q) (* a p)) (+ (* b p) (* a q)) p q (- n 1)))
          ))
  
  (fib-iter 1 0 0 1 n))

(fib 0)
(fib 1)
(fib 2)
(fib 3)
(fib 4)
(fib 5)
(fib 6)
(fib 7)
(fib 8)
(fib 9)
(fib 10)