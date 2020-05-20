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
; 4
; Определите в виде макроса форму (FIF тест отр нуль полож).
; 5
; Определите в виде макроса форму (REPEAT e UNTIL p) паскалевского типа.
; 6
; Разработать “собственный” язык программирования