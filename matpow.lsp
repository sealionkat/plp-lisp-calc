
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
(defun fr_vecmatmul (v M)
	(if (null (first M))
		'()
		(cons (fr_mulvec v (first M)) (fr_vecmatmul v (rest M)))
	)
)

; Mnożenie macierzy
(defun fr_matmul (A B)
	(if (null (first A))
		'()
		(cons (fr_vecmatmul (first A) B) (fr_matmul (rest A) B))
	)
)

; Potęgowanie macierzy
(defun fr_matpow (M k)
	(if (= k 0)
		(f_get_i M)
		(fr_matmul (fr_matpow M (1- k)) M)
	)
)

; Transponowanie
(defun f_trans (M)
	(setq d (length M))
	
	(loop for i from 1 to d collect
		(loop for j from 1 to d collect 
			(nth (1- i) (nth (1- j) M))
		)
	)
)

; Ewaluacja wektora
(defun fr_eval_vec (v)
	(if (null (first v))
		'()
		(cons (eval (first v)) (fr_eval_vec (rest v)))
	)
)

; Ewaluacja macierzy
(defun fr_eval_mat (M)
	(if (null (first M))
		'()
		(cons (fr_eval_vec (first M)) (fr_eval_mat (rest M)))
	)
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

(setq x (f_matpow z 2))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

(write x)
(format t "~& ~&")
(write (fr_eval_mat x))