# Парсер кино-сайтов на Ruby!
Привет! Это учебное приложение, цель которого помочь выбрать фильм на вечер. 
Оно сделано на Ruby `(v. ruby 2.7.1p83)` с помощью гемов `nokogiri` и `open-uri`.
Собственно информацию берёт с 4 сайтов (да, я увлёкся в процессе выполнения задачи):
1. [Википедия — 250 лучших фильмо](https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb)
2. [Кинопоиск — ТОП-250](https://www.kinopoisk.ru/top/lists/58/)
3. [IMBd — ТОП-100](https://www.imdb.com/list/ls055592025/)
4. [IMBd — ТОП-250](https://www.imdb.com/chart/top/?ref_=nv_mv_250/?is-redirected=1/)

## Как установить себе
```
git clone git@github.com:Giasod/film_parser.git
cd ./film_parser
bundle install
bundle exec ruby main.rb
```

####P.S.
Приложение может работать и без интернета, в папке `data/films` лежит 20 `.txt` 
файлов с фильмами. Иногда может быть полезно :)