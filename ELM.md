![](https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Elm_logo.svg/100px-Elm_logo.svg.png)
# Функциональный язык программирования Elm
**Elm** - это функциональный язык программирования для frontend-разработки, компилируемый в JavaScript.
Elm можно использовать либо как замену обычного кода JavaScript в браузере, либо как дополнение к нему. Можно написать несколько .elm файлов, пропустить их через компилятор Elm, и в конечном итоге получить стандартные .js-файлы, которые браузер запускает в обычном режиме. Если у вас есть отдельные таблицы стилей, которые вы используете вместе с JavaScript, они будут работать так же, как и Elm.

![](https://dpzbhybb2pdcj.cloudfront.net/rfeldman/HighResolutionFigures/figure_1-1.png)
## Преимущества языка

### Надежность и защита от runtime exceptions
Приложения Elm имеют репутацию никогда не выбрасывающих исключений во время выполнения на практике. Эта надежность распространяется на всю экосистему пакетов Elm, которая построена вокруг небольшого набора примитивов, таких как выражения, неизменяемые значения и "управляемые эффекты" — все это проверяется компилятором.

### Производительность
Elm демонстрирует выдающуюся производительность благодарня собственной виртуальной DOM. 
![](https://elm-lang.org/assets/home/benchmark.png)

### Принудительное семантическое версионирование
Elm может автоматически отслеживать все изменения благодаря собственной системе типов. Эта информация гарантировать, что каждый отдельный пакет Elm будет корректно версионирован.

## Синтаксис и базовые абстрации языка

### Функции
Для объявления функции достаточно напистаь её название = и тело функции.
Например: 
Объявим функцию greet. 
Она составляет приветствие с переданной строкой в качестве имени:
```
> greet name =
|   "Hello " ++ name ++ "!"
| 
<function>

> greet "Alice"
"Hello Alice!"

> greet "Bob"
"Hello Bob!"
```

### Ветвление

```
greet name =
|   if name == "General Grievous" then
|     "Hello there!"
|   else
|     "Hey!"
| 
<function>

> greet "Tom"
"Hey!"

> greet "General Grievous"
"Hello there!"
```

### Списки

Списки хранят последовательности значений одинакового типа.
Также списки позволяют удобно применять функции ко всем его элементам.
```
> numbers =
|   [4,3,2,1]
| 
[4,3,2,1]

> List.sort numbers
[1,2,3,4]

> increment n =
|   n + 1
| 
<function>

> List.map increment numbers
[5,4,3,2]
```

### Кортежи

Кортежи могут содержать 2 или 3 значения разных типов. Обычно используются при необходимости возврата нескольких значений из функции.

```
> isGoodName name =
|   if String.length name <= 20 then
|     (True, "name accepted!")
|   else
|     (False, "name was too long; please limit it to 20 characters")
| 
<function>

> isGoodName "Tom"
(True, "name accepted!")
```
### Записи

Записи представляют собой структуру данных key => value. Value может представлять собой массив данных.

```
> john =
|   { first = "John"
|   , last = "Hobson"
|   , age = 81
|   }
| 
{ age = 81, first = "John", last = "Hobson" }

> john.last
"Hobson"
```

## Общая структура приложения Elm

1. **Состояние или модель.**
Данные описывающее текущее состояние приложения;
2. **Множество допустимых сообщений.** Сообщения отправляются при наступлении событий (допустим клик по кнопке) и доставляются в функцию update;
3. **Функцию view**, которая на основании состояния генерирует новое DOM дерево;
4. **Функция update**, которая принимает модель и сообщение, а возвращает новую модель и требуемые эффекты;
5. **Функция subscribe** - подписка на уведомления о событиях. В ядре языка имеются подписки на таймер, WebSocket и прочее.

## Примеры использования
### Все примеры могут быть запущены в онлайн-компиляторе: https://elm-lang.org/try

### Hello World
```
import Html exposing (text)

main =
  text "Hello!"
```

### Примеры использования Button

Кнопка + увеличивает счётчик на 1, кнопка - уменьшает счётчик на 1.

```
module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--   https://guide.elm-lang.org/architecture/buttons.html
--


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model = Int


init : Model
init =
  0



-- UPDATE


type Msg
  = Increment
  | Decrement


update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1



-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]
```

## Ссылки
[Оф. сайт](https://elm-lang.org/)
[Официальная документация](https://guide.elm-lang.org/)
[Примеры](https://elm-lang.org/examples)
