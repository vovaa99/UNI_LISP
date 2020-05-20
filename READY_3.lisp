; 1
; Определите макрос, который возвращает свой вызов.
(defmacro get-self-call() '(quote (get-self-call)))

;Test cases
(print (get-self-call))
(print (eval (eval (get-self-call))))
(print '(macro 1))
(print (get-self-call))

; 2
; Определите макрос (POP стек), который читает из стека верхний элемент и меняет значение переменной стека.

(defmacro _pop (stack)
    '(let
        temp
        `(,(psetq temp (car stack) stack (cdr stack)))
        temp
        
    )
)

; Test cases
(setq stack (list 1 2 3 4 5))

(print stack)
(print (_pop stack))
(print stack)
(print (_pop stack))
(print stack)
(print (_pop stack))
(print stack)
(print (_pop stack))
(print stack)
(print (_pop stack))
(print stack)
(print (_pop stack))
(print stack)

; 3
; Определите лисповскую форму (IF условие p q) в виде макроса.
(defmacro _if (con q p)
    (list 
        'cond
        (list 
            con q
        )
        (list 
            t p
        )
    )
)

;Test cases
(setq a 1)
(setq b 1)
(setq c 2)

(print (_if (= a b) 'equal 'not-equal))
(print (_if (= a c) 'equal 'not-equal))

(print (_if (= a b) (car '(a b c)) (cdr '(a b c))))
(print (_if (= b c) (car '(a b c)) (cdr '(a b c))))


; 4
; Определите в виде макроса форму (FIF тест отр нуль полож).

;Code
(defmacro fif (test neg zero poz)
    `(
        cond
        (
			(< ,test 0)
			,neg
		)
        (
			(= ,test 0)
            ,zero
        )
        (t
            ,poz
        )
    )
)

;Test cases
(print (fif -5 'отрицательное 'нуль 'положительное))
(print (fif 0 'отрицательное 'нуль 'положительное))
(print (fif 1 'отрицательное 'нуль 'положительное))

; 5
; Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.
; 6
; Разработать “собственный” язык программирования