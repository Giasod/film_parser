require_relative 'film'

class FilmCollection
  attr_reader :films

  def self.from_dir(dir_path)
    films_collection = Dir["#{dir_path}/*.txt"].map do |file_name|
      lines = File.readlines(file_name, chomp: true)
      Film.new(lines[0], lines[1], lines[2])
    end
    new(films_collection)
  end

  def initialize(films_collection)
    @films = films_collection
  end

  def collect_director
    @films.map(&:director).uniq
  end

  def chose_movie_by_director(selected_director)
    @films.select { |film| film.director == selected_director }
  end
end
