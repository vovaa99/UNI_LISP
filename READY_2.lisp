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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;14
; Определите функцию, которая возвращает в качестве значения форму своего определения (DEFUN).