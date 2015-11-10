
; Tworzy wektor k elementowy z i-tym elementem równym 1
(defmacro mr_get_i_vec (k i)
	(if (= k 0)
		'()
		`(append (mr_get_i_vec ,(1- k) ,i) `(,(if ,(= k i) 1 0)))
	)
)

; Tworzy macierz jednostkową z wektorów
(defmacro mr_get_i_mat (k n)
	(if (= k 0)
		'()
		`(append (mr_get_i_mat ,(1- k) ,n) `(,(mr_get_i_vec ,n ,k)))
	)
)

; Zwraca macierz jednostkową o wymiarach macierzy M
(defmacro m_get_i (M)
	`(mr_get_i_mat ,(length (eval M)) ,(length (eval M)))
)

; Mnożenie 2 wektorów (pionowy i poziomy - zwraca 1 wartość)
(defmacro mr_mulvec (v w)
	`(if (null `,(first ,v))
		0
		`(+ (* ,(first ,v) ,(first ,w)) ,(mr_mulvec (rest ,v) (rest ,w)))
	)
)

; Mnoży wektor przez macierz
(defmacro mr_vecmatmul (v M)
	`(if (null `,(first ,M))
		'()
		(cons (mr_mulvec ,v (first ,M)) (mr_vecmatmul ,v (rest ,M)))
	)
)

; Mnożenie macierzy
(defmacro mr_matmul (A B)
	`(if (null `,(first ,A))
		'()
		(cons (mr_vecmatmul (first ,A) ,B) (mr_matmul (rest ,A) ,B))
	)
)

; Ewaluacja wektora
(defmacro mr_eval_vec (v)
	`(if (null `,(first ,v))
		'()
		(cons (eval (first ,v)) (mr_eval_vec (rest ,v)))
	)
)

; Ewaluacja macierzy
(defmacro mr_eval_mat (M)
	`(if (null `,(first ,M))
		'()
		(cons (mr_eval_vec (first ,M)) (mr_eval_mat (rest ,M)))
	)
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

;(setq x (f_matpow z 2))

(setf a 1)
(setf b 2)
(setf c 3)
(setf d 4)

;(trace mr_get_i_vec)
;(trace mr_get_i_mat)
;(trace m_get_i)
;(trace mr_mulvec)
;(trace mr_vecmatmul)
;(trace mr_eval_vec)
;(trace mr_matmul)
;(trace mr_eval_mat)


(setq x (mr_matmul z zt))

(write (mr_eval_mat x))