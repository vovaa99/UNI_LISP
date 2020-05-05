;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#19
;Определите функцию (ЛУКОВИЦА n), строящую N-уровневый вложенный список, элементом которого на самом глубоком уровне является N.

(print "-----TASK 19-----")
(defun ЛУКОВИЦА (n)
    (defun nest_el_n_times (el n)
        (cond 
    		((= n 1) (list el))
    		(t 
    			(list (nest_el_n_times el (- n 1)))
    		)
    	)
    )
	(nest_el_n_times n n)
)
;Test cases

(print (ЛУКОВИЦА 1))
; (1)
(print (ЛУКОВИЦА 2))
; ((2))
(print (ЛУКОВИЦА 5))
; (((((5)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#44
;Определите функцию, проверяющую, является ли одно дерево поддеревом второго.

(print "-----TASK 44-----")
(defun is-a-sublist (sub ls)
    (cond
        (
            (null ls) 
            nil
        )
        (
            (
                (lambda (head tail)
                    (cond
                        (
                            (atom head) ;если head - это узел, то рассматриваем поддеревья
                            (is-a-sublist sub tail)
                        )
                        (
                            (equal sub head)
                        )
                        (
                            (is-a-sublist sub head)
                        )
                        (
                            (is-a-sublist sub tail)
                        )
                    )
                )
                (car ls)
                (cdr ls)
            )
        )
        (T
            nil
        )
    )
)

 
; Test cases

(print (is-a-sublist '(c (f (g) (h))) '(a (b) (c (f (g) (h))) (d (e)))))
; T
(print (is-a-sublist '(a (b (c))) '(a (b (c) (d)) (e (f)) (g (h) (i)))))
; nil
(print (is-a-sublist '(b (c) (d)) '(a (b (c) (d)) (e (f)) (g (h) (i)))))
; T
(print (is-a-sublist '(e (f)) '(a (b (c) (d)) (e (f)) (g (h) (i)))))
; T
(print (is-a-sublist '(b (c) (d)) '(a (b (c) (d)) (e (f)) (g (h) (i)))))
; T

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#45
;Предположим, что у имени города есть свойства х и у, которые содержат координаты места нахождения города относительно некоторого начала координат. Напишите функцию (РАССТОЯНИЕ a b), вычисляющую расстояние между городами а и b
(print "-----TASK 45-----")

(defun set-city (city x y)
	(setf (get city 'X) x)
	(setf (get city 'Y) y)
)
(defun get-x (city)
	(get city 'X)
)

(defun get-y (city)
	(get city 'Y)
)

(defun РАССТОЯНИЕ (a b)
	(cond
		(
			(eq a b)
			0
		)
		(T
			(
				(lambda(x1 y1 x2 y2)
					(sqrt (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2))) 
				)
				(get-x a)
				(get-y a)
				(get-x b)
				(get-y b)
			)
		)
	)
)

; Test cases

(set-city 'CITY_1 0 0)
(set-city 'CITY_2 0 1)
(set-city 'CITY_3 4 3)

(print (РАССТОЯНИЕ 'CITY_1 'CITY_1))
; 0
(print (РАССТОЯНИЕ 'CITY_1 'CITY_2))
; 1
(print (РАССТОЯНИЕ 'CITY_1 'CITY_3))
; 5

;#46
;Предположим, что отец и мать некоторого лица, хранятся как значения соответствующих свойств у символа, обозначающего это лицо. Напишите функцию (РОДИТЕЛИ x), которая возвращает в качестве значения родителей, и предикат (СЕСТРЫ-БРАТЬЯ x1 x2), который истинен в случае, если x1 и x2 — сестры или братья, родные или с одним общим родителем
(print "-----TASK 46-----")

(defun set-parents(child mother father)
    (setf (get child 'M) mother)
    (setf (get child 'F) father)
)

(defun РОДИТЕЛИ(child)
    (list (get-mother child) (get-father child))
)

(defun get-father(child)
    (get child 'F)
)

(defun get-mother(child)
    (get child 'M)
)

(defun СЕСТРЫ-БРАТЬЯ(child1 child2)
    (cond
        (
			(eq (get-mother child1) (get-mother child2)) T
		)
        (
			(eq (get-father child1) (get-father child2)) T
		)
        (T NIL)
    )
)

; Test cases

(set-parents 'CHILD_1 'MOTHER_1 'FATHER_1)
(set-parents 'CHILD_2 'MOTHER_2 'FATHER_2)
(set-parents 'CHILD_3 'MOTHER_2 'FATHER_1)
(set-parents 'CHILD_4 'MOTHER_3 'FATHER_3)

(print (СЕСТРЫ-БРАТЬЯ 'CHILD_1 'CHILD_2))
; NIL 
(print (СЕСТРЫ-БРАТЬЯ 'CHILD_2 'CHILD_3))
; T 
(print (СЕСТРЫ-БРАТЬЯ 'CHILD_3 'CHILD_1))
; T 
(print (СЕСТРЫ-БРАТЬЯ 'CHILD_2 'CHILD_4))
; NIL 
