(define (proc x y z)
  (if (< x y)
      (if (< x z) (+ y z) (+ x y))
      (if (< y z) (+ x z) (+ x y))))
	  
(proc 1 2 3)
(proc 1 3 2)
(proc 2 1 3)
(proc 2 3 1)
(proc 3 1 2)
(proc 3 2 1)