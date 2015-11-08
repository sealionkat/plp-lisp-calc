(defun fpow (x n)
	(if (= n 0)
		1
		`(* ,x ,(fpow x (1- n)))
	)
)

(defmacro mpow (x n)
	`(if (= ,n 0)
		1
		`(* ,,x ,(mpow ,x ,(1- n)))
	)
)

(trace mpow)
(setq x (mpow 'b 7))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))
