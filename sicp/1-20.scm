application-order

(gcd 206 40) // to evaluate if
(gcd 40 (remainder 206 40))

(gcd 40 6) // to evaluate if
(gcd 6 (remainder 40 6))

(gcd 6 4) // to evaluate if
(gcd 4 (remainder 6 4))

(gcd 4 2) // to evaluate if
gcd 2 (remainder 6 2))

(gcd 2 0) // to evaluate if
2

normal-order
(gcd 206 40)

(gcd 40 (remainder 206 40))
(if (= (remainder 206 40) 0)
  40
  (gcd (remainder 206 40) (remainder 40 (remainder 206 40))))

(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder 40 (remainder 206 40)) 0)
  (remainder 206 40)
  (gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
  
(gcd (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
  (remainder 40 (remainder 206 40))
  (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))))
  
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))