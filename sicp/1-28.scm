(define (square x) (* x x))

(define (divides? a b)
  (= (remainder a b) 0))

(define  (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (expmod base exp m)
  (if (and (not (= base 1)) (not (= base (- m 1))) (= (remainder (square base) m) 1)) 0
      (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m)))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  
  (define (try-iter test)
    (cond ((= test n) true)
          ((try-it test) (try-iter (+ 1 test)))
          (else false)))
  
  (try-iter 1))

(fermat-test 561)
(fermat-test 1105)
(fermat-test 1729)
(fermat-test 2465)
(fermat-test 2821)
(fermat-test 6601)