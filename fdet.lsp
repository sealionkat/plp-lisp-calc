(defun removed_nth (M n)
	(setq len (length M))
	
	(loop for i from 1 to len collect
		(loop for j from 1 to (1+ len)
			if (/= n j) collect (nth (1- j) (nth (1- i) M))
		)
	)
)

(defun fextract (v M pos)
	(if (null v)
		0
		`(- (* ,(first v) ,(fdet (removed_nth M pos))) ,(fextract (rest v) M (1+ pos)))
	)
)

(defun fdet (M)
	(setq fvec (first M))
	(setq mat (rest M))
	
	(if (= (length fvec) 1)
		(first fvec)
		(fextract fvec mat 1)
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

(setq x (fdet z))
(write (eval x))