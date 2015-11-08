(define (square x) (* x x))

(define (divides? a b)
  (= (remainder a b) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (search-for-primes start n)
  (cond ((= n 0) (newline))
        ((prime? start)
         (display start)
         (newline)
         (search-for-primes (+ 1 start) (- n 1)))
        (else (search-for-primes (+ 1 start) n))))

(define (report-prime elapsed-time)
  (display "*** ")
  (display elapsed-time))

(define (start-prime-test start n start-time)
  (search-for-primes start n)
  (report-prime (- (runtime) start-time)))

(define (timed-prime-test start n)
  (newline)
  (start-prime-test start n (runtime)))

(timed-prime-test 1000 3)
(timed-prime-test 10000 3)
(timed-prime-test 100000 3)
(timed-prime-test 1000000 3)




// another solution

(define (square x) (* x x))

(define (divides? a b)
  (= (remainder a b) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (report-prime elapsed-time)
  (display "*** ")
  (display elapsed-time)
  (newline))

(define (start-prime-test n start-time)
  (cond ((prime? n)
         (report-prime (- (runtime) start-time))
         true)
        (else false)))

(define (search-for-primes start count)
  (cond ((= count 0) (newline))
        ((timed-prime-test start)
         (display start)
         (newline)
         (search-for-primes (+ 1 start) (- count 1)))
        (else (search-for-primes (+ 1 start) count))))

(search-for-primes 10000000 3)