# Функциональный язык программирования Elm
**Elm** - это функциональный язык программирования для frontend-разработки, компилируемый в JavaScript.
Elm можно использовать либо как замену обычного кода JavaScript в браузере, либо как дополнение к нему. Можно написать несколько .elm файлов, пропустить их через компилятор Elm, и в конечном итоге получить стандартные .js-файлы, которые браузер запускает в обычном режиме. Если у вас есть отдельные таблицы стилей, которые вы используете вместе с JavaScript, они будут работать так же, как и Elm.

![](https://dpzbhybb2pdcj.cloudfront.net/rfeldman/HighResolutionFigures/figure_1-1.png)
## Особенности языка

Что отличает Elm от многих разновидностей JavaScript, так это надежность. Код на чистом JavaScript, как известно, склонен к сбоям во время выполнения, таким как "undefined-это не функция." 
Приложения Elm имеют репутацию никогда не выбрасывающих исключений во время выполнения на практике! Эта надежность распространяется на всю экосистему пакетов Elm, которая построена вокруг небольшого набора примитивов, таких как выражения, неизменяемые значения и "управляемые эффекты" — все это проверяется компилятором.

Компилятор Elm имеет репутацию user-friendly компилятора. Он не только выводит типы целых программ, не требуя рукописных аннотаций типа, которые делают многие языки—в главе 2 мы построим целое приложение, а затем в главе 3 мы увидим, как добавить к нему дополнительные аннотации,—но когда компилятор обнаруживает проблемы, он сообщает о них с такой ясностью, что он сделал себе имя даже среди легендарных программистов.

### Основным элементом в архитектуре языка Elm является приложение.
В общем случае каждое приложение содержит:

1. **Состояние или модель.**
Данные описывающее текущее состояние приложения;
2. **Множество допустимых сообщений.** Сообщения отправляются при наступлении событий (допустим клик по кнопке) и доставляются в функцию update;
3. **Функцию view**, которая на основании состояния генерирует новое DOM дерево;
4. **Функция update**, которая принимает модель и сообщение, а возвращает новую модель и требуемые эффекты;
5. **Функция subscribe** - подписка на уведомления о событиях. В ядре языка имеются подписки на таймер, WebSocket и прочее.

## Примеры использования
### Hello World
#### h4 Heading
##### h5 Heading
###### h6 Heading


## Horizontal Rules

___

---

***


## Typographic replacements

Enable typographer option to see result.

(c) (C) (r) (R) (tm) (TM) (p) (P) +-

test.. test... test..... test?..... test!....

!!!!!! ???? ,,  -- ---

"Smartypants, double quotes" and 'single quotes'


## Emphasis

**This is bold text**

__This is bold text__

*This is italic text*

_This is italic text_

~~Strikethrough~~


## Blockquotes


> Blockquotes can also be nested...
>> ...by using additional greater-than signs right next to each other...
> > > ...or with spaces between arrows.


## Lists

Unordered

+ Create a list by starting a line with `+`, `-`, or `*`
+ Sub-lists are made by indenting 2 spaces:
  - Marker character change forces new list start:
    * Ac tristique libero volutpat at
    + Facilisis in pretium nisl aliquet
    - Nulla volutpat aliquam velit
+ Very easy!

Ordered

1. Lorem ipsum dolor sit amet
2. Consectetur adipiscing elit
3. Integer molestie lorem at massa


1. You can use sequential numbers...
1. ...or keep all the numbers as `1.`

Start numbering with offset:

57. foo
1. bar


## Code

Inline `code`

Indented code

    // Some comments
    line 1 of code
    line 2 of code
    line 3 of code


Block code "fences"

```
Sample text here...
```

Syntax highlighting

``` js
var foo = function (bar) {
  return bar++;
};

console.log(foo(5));
```

## Tables

| Option | Description |
| ------ | ----------- |
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |

Right aligned columns

| Option | Description |
| ------:| -----------:|
| data   | path to data files to supply the data that will be passed into templates. |
| engine | engine to be used for processing templates. Handlebars is the default. |
| ext    | extension to be used for dest files. |


## Links

[link text](http://dev.nodeca.com)

[link with title](http://nodeca.github.io/pica/demo/ "title text!")

Autoconverted link https://github.com/nodeca/pica (enable linkify to see)


## Images

![Minion](https://octodex.github.com/images/minion.png)
![Stormtroopocat](https://octodex.github.com/images/stormtroopocat.jpg "The Stormtroopocat")

Like links, Images also have a footnote style syntax

![Alt text][id]

With a reference later in the document defining the URL location:

[id]: https://octodex.github.com/images/dojocat.jpg  "The Dojocat"


## Plugins

The killer feature of `markdown-it` is very effective support of
[syntax plugins](https://www.npmjs.org/browse/keyword/markdown-it-plugin).


### [Emojies](https://github.com/markdown-it/markdown-it-emoji)

> Classic markup: :wink: :crush: :cry: :tear: :laughing: :yum:
>
> Shortcuts (emoticons): :-) :-( 8-) ;)

see [how to change output](https://github.com/markdown-it/markdown-it-emoji#change-output) with twemoji.


### [Subscript](https://github.com/markdown-it/markdown-it-sub) / [Superscript](https://github.com/markdown-it/markdown-it-sup)

- 19^th^
- H~2~O


### [\<ins>](https://github.com/markdown-it/markdown-it-ins)

++Inserted text++


### [\<mark>](https://github.com/markdown-it/markdown-it-mark)

==Marked text==


### [Footnotes](https://github.com/markdown-it/markdown-it-footnote)

Footnote 1 link[^first].

Footnote 2 link[^second].

Inline footnote^[Text of inline footnote] definition.

Duplicated footnote reference[^second].

[^first]: Footnote **can have markup**

    and multiple paragraphs.

[^second]: Footnote text.


### [Definition lists](https://github.com/markdown-it/markdown-it-deflist)

Term 1

:   Definition 1
with lazy continuation.

Term 2 with *inline markup*

:   Definition 2

        { some code, part of Definition 2 }

    Third paragraph of definition 2.

_Compact style:_

Term 1
  ~ Definition 1

Term 2
  ~ Definition 2a
  ~ Definition 2b


### [Abbreviations](https://github.com/markdown-it/markdown-it-abbr)

This is HTML abbreviation example.

It converts "HTML", but keep intact partial entries like "xxxHTMLyyy" and so on.

*[HTML]: Hyper Text Markup Language

### [Custom containers](https://github.com/markdown-it/markdown-it-container)

::: warning
*here be dragons*
:::
