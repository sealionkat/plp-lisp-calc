

(defun fdet_helper (M)
	(setq firstM (first M))
	(setq n (length firstM))
	(setq tmpM (rest M))
	
	; Kazda
	;(loop for i from 1 to n do (
		;(setq newM '())
		
	;	(loop for j from 1 to (- n 1) do (
			
	;	))
		
		;(write newM)
	;))
	
	
	0
)

(defun fdet (M)
	(if (= 1 (length M))
		(first (first M))
		(fdet_helper M)
	)
)

(setq z '(
	(a b a a)
	(a a c a)
	(d a a a)
	(a a b a)
))


(setq tt '(
	((+ b d))
))

;(setq x (fsum 'a '(* b b) 'c 'd))


(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write (eval x))

;(write (eval (fdet z)))
