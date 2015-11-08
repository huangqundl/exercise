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

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

; modify the program in the book, let it return
(define (start-prime-test n start-time)
  (cond ((prime? n)
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