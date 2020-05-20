; 3 7 15 19 20 30 32 44 45 46

;#3
;Определите функцию, заменяющую в исходном списке все вхождения заданного значения другими

(print "-----TASK 3-----")

(defun rep (lst pattern replaceWith)
	(
    	(lambda(head tail)
    	
            (cond 
        		(
        			(null lst)
        			nil
        		)
        	    (
        	        (eq head pattern) 
        		    (cons replaceWith (rep tail pattern replaceWith))
        		)
    		    (t
    		        (cons head (rep tail pattern replaceWith))
    		    )
    		)
    	)
    	(car lst)(cdr lst)
	)
)

;Test cases
(print (rep '(1 2 3 1 1) 1 'a))
;(A 2 3 A A) 
(print (rep '((1 2 3) 4 5 6 1) 1 44))
;((1 2 3) 4 5 6 44) 
  
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#7
;Определите функцию, удаляющую из исходного списка элементы с четными номерами.
(print "-----TASK 7-----")
(defun drop-eventh (w)
	(cond 
		((null w) nil)
		(t 
			(cons
				(car w)
				(drop-eventh (cddr w))
			)
		)
	)
) 

;Test cases        
(print (drop-eventh '(1 2 3 4 5 6 7 (8 81))))
;(1 3 5 7) 		
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#15
;Определите функцию, вычисляющую скалярное произведение векторов, заданных списками целых чисел.

(print "-----TASK 15-----")
(defun cross-prod(v1 v2)
	(cond
		((null v1) 0)
		((null v2) 0)
		(t (+ (* (car v1) (car v2)) (cross-prod(cdr v1) (cdr v2))))
	)
)

;Test cases
(print(cross-prod '(2 3 5) '(3 7 9)))
; 72 
(print(cross-prod '(2 3 5) '(3 7 9 2 5)))
; 72 
(print(cross-prod '(2 3 5 7 9) '(3 7 9)))
; 72 

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
;#20
;Определите функцию ПЕРВЫЙ-АТОМ, результатом которой будет первый атом списка. Пример:
;> (ПЕРВЫЙ-АТОМ ’(((a b)) c d))
;A
(print "-----TASK 20-----")

(defun ПЕРВЫЙ-АТОМ(lst)
	(cond
        (
			(atom lst) 
			lst
		)
		(t 
			(ПЕРВЫЙ-АТОМ (car lst))
		)
    )
)

;Test cases

(print (ПЕРВЫЙ-АТОМ '(1)))
; 1
(print (ПЕРВЫЙ-АТОМ '((+ 1 2) 5)))
; +

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#30
;Запрограммируйте интерпретатор ВЫЧИСЛИ, который преобразует инфиксную запись операций в префиксную и возвращает значение выражения. Пример:
;> (ВЫЧИСЛИ ’((-2 + 4) * 3))
;6
(print "-----TASK 30-----")

(defun prefix (lst)
   (cond 
		((null lst) nil)
		((atom lst) lst)
		(t
			(list 
				(prefix (cadr lst))
				(prefix (car lst))
				(prefix (caddr lst))
			)
		)
	)
)

(defun ВЫЧИСЛИ (lst)
	(eval (prefix lst))
)

;
;------------------------------------------------------------------------------
;
;(print  (calculate '((-4 + 7 ) *  3 )))
(print (ВЫЧИСЛИ '((-4 + 7 ) *  3 )))
;(print  (calculate '((2 + -6 ) *  4 )))
(print (ВЫЧИСЛИ '((2 + -6 ) *  4 )))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;#32
;Определить предикат МНОЖЕСТВО-Р, который проверяет, является ли список множеством, т.е. входит ли каждый элемент в список лишь один раз.

(print "-----TASK 32-----")
(defun is_el_present (lst el)
	(cond
		((null lst)
			nil
		)
		((= (car lst) el)
			t
		)
		(t
			(is_el_present (cdr lst) el)
		)
	)
)

(defun МНОЖЕСТВО-Р (lst)
	(
		(lambda(head tail)
			(cond
				((null lst)
					t
				)
				(
					(is_el_present tail head)
					nil
				)
				(t
					(МНОЖЕСТВО-Р tail)
				)
			)
		)
		(car lst)
		(cdr lst)
	)
)
;Test cases
(print (МНОЖЕСТВО-Р '(1 2 3 4)))
; T
(print (МНОЖЕСТВО-Р '(1 1 3 4)))
; NIL
(print (МНОЖЕСТВО-Р '(1 2 3 4 5 5)))
; NIL

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
; 2
; Определите функицонал (MAPLIST fn список) для одного списочного аргумента.

(print "-----TASK 2-----")
(defun _maplist (fn lst)
    (cond
        (
			(null lst)
            nil
        )
        (t
            (cons (funcall fn lst) (_maplist fn (cdr lst)))
        )
    )
    
)
;Test cases
(print (_maplist (lambda (x) (apply '+ x)) '(5 4 3 2 1)))
; (15 10 6 3 1) 
(print (_maplist (lambda (x) (list 'foo x 'bar)) '(a b c d)))
; ((FOO (A B C D) BAR) (FOO (B C D) BAR) (FOO (C D) BAR) (FOO (D) BAR)) 


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 4
; Определите функциональный предикат (КАЖДЫЙ пред список), который истинен в том и только в том случае, когда, являющейся функциональным аргументом предикат пред истинен для всех элементов списка список.

(print "-----TASK 4-----")
(defun КАЖДЫЙ (pred lst)
    (eq nil (member nil (mapcar pred lst)))
)

;Test cases
(print (КАЖДЫЙ (lambda (x) (eq (REM x 2) 0)) '(1 2 3 4)))
;NIL
(print (КАЖДЫЙ (lambda (x) (eq (REM x 2) 0)) '(2 4 6)))
;T


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 6
; Определите фильтр (УДАЛИТЬ-ЕСЛИ пред список), удаляющий из списка список все элементы, которые обладают свойством, наличие которого проверяет предикат пред.

(print "-----TASK 6-----")
(defun УДАЛИТЬ-ЕСЛИ (pred lst)
	(mapcan 
		(lambda (el) 
			(cond
				(
					(funcall pred el) 
					nil
				)
				(t (list el))
			)
		)
	lst
	)
)

; Test cases
(print (УДАЛИТЬ-ЕСЛИ (lambda (x) (= x 0)) '(1 0 3 4)))
; (1 3 4)
(print (УДАЛИТЬ-ЕСЛИ (lambda (x) (= x 0)) '(1 2 3 4)))
; (1 2 3 4)
(print (УДАЛИТЬ-ЕСЛИ (lambda (x) (null x)) '(1 nil 2)))
; (1 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 8
; Напишите генератор натуральных чисел: 0, 1, 2, 3, 4, 5, ...

(print "-----TASK 8-----")
(defun gen-nat ()
	(setq last_natural 0)
	(lambda ()
		(setq last_natural (+ last_natural 1))
    )
)

;Test cases
(setq gen_next_nat (gen-nat))
(print (funcall gen_next_nat))
(print (funcall gen_next_nat))
(print (funcall gen_next_nat))
(print (funcall gen_next_nat))
(print (funcall gen_next_nat))
(print (funcall gen_next_nat))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(print "-----TASK 10-----")
;10
; Напишите генератор, порождающий последовательность (A), (B A), (A B A),(B A B A), ...
(defun gen-ab-list ()
	(let
		(
			(s1 'A)
			(s2 'B)
			(s nil)
		)
		(lambda ()
			(setq
				s 
                (cond 
                    (
                        (eq s1 (car s))
                        (cons s2 s)
                    )
                    (t (cons s1 s))
                )
            )
        )
	)
)

;Test cases
(setq gen (gen-ab-list))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))
(print (funcall gen))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;12
; Определите функцию, которая возвращает в качестве значения свой вызов.

(defun get-func-call ()
   '(get-func-call)
)

;Test cases
(print (get-func-call))
(print (eval (get-func-call)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;14
; Определите функцию, которая возвращает в качестве значения форму своего определения (DEFUN).

(defun get-def-form ()
   '(defun get-def-form ())
)

;Test cases
(print (get-def-form))
