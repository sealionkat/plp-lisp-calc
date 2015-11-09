
; Tworzy wektor k elementowy z i-tym elementem równym 1
(defun fr_get_i_vec (k i)
	(if (= k 0)
		'()
		(append (fr_get_i_vec (1- k) i) `(,(if (= k i) 1 0)))
	)
)

; Tworzy macierz jednostkową z wektorów
(defun fr_get_i_mat (k n)
	(if (= k 0)
		'()
		(append (fr_get_i_mat (1- k) n) `(,(fr_get_i_vec n k)))
	)
)

; Zwraca macierz jednostkową o wymiarach macierzy M
(defun f_get_i (M)
	(setq d (length M))
	(fr_get_i_mat d d)
)

; Mnożenie 2 wektorów (pionowy i poziomy - zwraca 1 wartość)
(defun fr_mulvec (v w)
	(if (null (first v))
		0
		`(+ (* ,(first v) ,(first w)) ,(fr_mulvec (rest v) (rest w)))
	)
)

; Mnoży wektor przez macierz
(defun vecmatmul (v M)
)

(defun matmul (A B)
	(setq d (length A))
	
)

(defun fr_matpow (M k)
	(if (= k 0)
		(get_i M)
		(matmul (fr_matpow M (1- k)) M)
	)
)

(defun f_trans (M)
	(setq d (length M))
	
	; TODO: loop
)

(defun f_matpow (M k)
	(fr_matpow (f_trans M) k)
)

(setq z '(
	(a b a a)
	(a a c a)
	(d a a a)
	(a a b a)
))

(setq zt '(
	(a a d a)
	(b a a a)
	(a c a b)
	(a a a a)
))


(setq zz '(
	((+ b d))
))

(write (fr_mulvec (first z) (second z)))

;(setq x (fmatpow z 2))
;(setq x (get_i z))


(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

;(write x)
;(write (eval x))