(defun fmul (x &rest y)
	(if (null y)
		x
		`(* ,(apply 'fmul y) ,x)
	)
)

(defmacro mmul (x &rest y)
	(if (null y)
		x
		``(* ,(mmul ,@y) ,,x)
	)
)

(setq x (fmul 'a '(* b b) 'c 'd))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))
