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
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m)) m))
        (else
         (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

; modify the program in the book, let it return
(define (start-prime-test n start-time)
  (cond ((fast-prime? n 10)
         (report-prime (- (runtime) start-time))
         true)
        (else false)))

(define (report-prime elapsed-time)
  (display "*** ")
  (display elapsed-time)
  (newline))

(define (search-for-primes start count)
  (cond ((= count 0) (newline))
        ((timed-prime-test start)
         (display start)
         (newline)
         (search-for-primes (+ 1 start) (- count 1)))
        (else (search-for-primes (+ 1 start) count))))

(search-for-primes 100000000 3)