require_relative 'lib/film'
require_relative 'lib/film_collection'
require_relative 'lib/parser'

puts 'Программа "Фильм на вечер"'
puts 'Хотите выбрать из фильмов в интернете(1) или из тех, что я знаю(2)? Выберите 1 или 2'
choice = STDIN.gets.to_i

if choice == 1
  puts 'С какого сайта хотите взять список фильмов? Кинопоиск (1), Википедия (2), IMBd TOP250 (3), IMBd TOP100 (4)?'
  site_choice = STDIN.gets.to_i

  films =
    case site_choice
    when 1
      FilmCollection.new(Parser.parse_kinopoisk)
    when 2
      FilmCollection.new(Parser.parse_wiki)
    when 3
      FilmCollection.new(Parser.parse_imbd250)
    when 4
      FilmCollection.new(Parser.parse_imbd100)
    end
else
  films = FilmCollection.from_dir("#{__dir__}/data/films")
end

directors = films.collect_director

puts 'Фильм какого режиссера вы хотите сегодня посмотреть?'

directors.each.with_index(1) { |director, index| puts "#{index}. #{director}" }

user_input = STDIN.gets.to_i

until user_input.between?(1, directors.size)
  puts "Введите число от 1 до #{directors.size}"
  user_input = STDIN.gets.to_i
end

selected_films = films.chose_movie_by_director(directors[user_input - 1])

puts 'И сегодня вечером рекомендую посмотреть:'
puts selected_films.sample
