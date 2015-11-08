(defun fsum (x &rest y)
	(if (null y)
		x
		`(+ ,x ,(apply 'fsum y))
	)
)

(defmacro msum (x &rest y)
	(if (null y)
		x
		``(+ ,,x ,(msum ,@y))
	)
)

(setq x (fsum 'a '(* b b) 'c 'd))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))
