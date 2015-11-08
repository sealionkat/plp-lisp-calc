(defun fmax (x &rest y)
	(if (null y)
		x
		(let ((tmp (apply 'fmax y)))
			`(if (< ,tmp ,x)
				,x
				,tmp
			)
		)
	)
)

(defmacro mmax (x &rest y)
	(if (null y)
		x
		``(if (> ,,x ,(mmax ,@y))
			,,x
			,(mmax ,@y)
		)
	)
)

(setq x (mmax 'a 'd 'c 'a))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))