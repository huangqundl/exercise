(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (repeated2 f n)
  (define (repeated-iter result count)
    (if (> count n)
        result
        (repeated-iter (compose result f) (+ count 1))))
  (repeated-iter (lambda (x) x) 1))

(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))

(define (smooth-n f n)
  (repeated smooth n) f)