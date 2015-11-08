(define (sum term a next b)
  (define (iter a result)
	(if (> a b)
		result
		(iter (next a) (+ result (term a))))) 
  (iter a 0))

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