(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

(define (cube x)
  (* x x x))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (term i)
    (cond ((or (= i 0) (= i n))
           (f (+ a (* i h))))
          ((even? i)
           (* 2 (f (+ a (* i h)))))
          (else
           (* 4 (f (+ a (* i h)))))))
  (define (next x) (+ x 1))
  
  (if (even? n)
      (* (/ h 3) (sum term 0 next n))))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)