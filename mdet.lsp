(defmacro removed_nth (M n)
	`(loop for i from 1 to (length ,M) collect
		(loop for j from 1 to (1+ (length ,M))
			if (/= ,n j) collect (nth (1- j) (nth (1- i) ,M))
		)
	)
)

(defmacro mextract (v M pos)
	`(if (null ,v)
		0
		`(- (* ,(first ,v) ,(mdet (removed_nth ,M ,pos))) ,(mextract (rest ,v) ,M (1+ ,pos)))
	)
)

(defmacro mdet (M)
	`(if (= (length (first ,M)) 1)
		(first (first ,M))
		(mextract (first ,M) (rest ,M) 1)
	)
)

(setq z '(
	(a b a a)
	(a a c a)
	(d a a a)
	(a a b a)
))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(setq x (mdet z))
(write (eval x))