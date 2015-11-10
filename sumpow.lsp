(defun fsumpow (x n)
	(if (= n 0)
		0
		`(+ ,x ,(fsumpow x (1- n)))
	)
)

(defmacro msumpow (x n)
	`(if (= ,n 0)
		0
		`(+ ,,x ,(msumpow ,x ,(1- n)))
	)
)

(setq x (msumpow 'b 7))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))