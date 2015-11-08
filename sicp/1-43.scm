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

((repeated
  (lambda (x) (* x x))
  2)
 5)