(defun fmin (x &rest y)
	(if (null y)
		x
		(let ((tmp (apply 'fmin y)))
			`(if (< ,x ,tmp)
				,x
				,tmp
			)
		)
	)
)

(defmacro mmin (x &rest y)
	(if (null y)
		x
		(let ((tmp `(mmin ,@y)))
			``(if (< ,,x ,,tmp)
				,,x
				,,tmp
			)
		)
	)
)

(setq x (mmin 'c 'd 'a 'b))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))
