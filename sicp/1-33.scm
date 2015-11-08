(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a b)
         (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))

  
; sum
(define (prime-sum a b)
  (define (square x) (* x x))
  (define (divides? a b)
    (= (remainder a b) 0))
  (define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((divides? n test-divisor) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))
  (define (smallest-divisor n)
    (find-divisor n 2))
  (define (prime? n useless)
    (and (> n 1) (= n (smallest-divisor n))))
  (define (term x) x)
  (define (next x) (+ 1 x))
  (filtered-accumulate + 0 term a next b prime?))

(prime-sum 1 7)

; product
(define (filter-product n)
  (define (gcd x y)
    (if (= (remainder x y) 0)
        y
        (gcd y (remainder x y))))
  (define (filter a b)
    (= (gcd b a) 1))
  (define (term x) x)
  (define (next x) (+ 1 x))
  (filtered-accumulate * 1 term 1 next n filter))

(filter-product 10)