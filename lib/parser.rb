require_relative 'film'
require 'nokogiri'
require 'open-uri'

module Parser
  extend self
  KINOPOISK = 'https://www.kinopoisk.ru/top/lists/58/'
  IMBD250 = 'https://www.imdb.com/chart/top/?ref_=nv_mv_250/?is-redirected=1/'
  IMBD100 = 'https://www.imdb.com/list/ls055592025/'
  WIKI = 'https://ru.wikipedia.org/wiki/250_%D0%BB%D1%83%D1%87%D1%88%D0%B8%D1%85_%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%BE%D0%B2_%D0%BF%D0%BE_%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D0%B8_IMDb'

  def parse_kinopoisk(url = KINOPOISK)
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('tr.js-film-list-item').map do |item|
      title = item.at_css('td.news > div > a').text
      director = item.at_css('td.news > span > i > a').text
      year = item.at_css('td.news > div > span').text.match(/\d{4}/).to_s

      Film.new(title, director, year)
    end
  end

  def parse_imbd100(url = IMBD100)
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('div.lister-item-content').map do |item|
      title = item.at('h3.lister-item-header > a').text
      director = item.at('p.text-muted.text-small > a').text
      year = item.at('h3.lister-item-header > span.lister-item-year.text-muted.unbold').text

      Film.new(title, director, year)
    end
  end

  def parse_imbd250(url = IMBD250)
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('td.titleColumn').map do |item|
      title = item.at('a').text
      director = item.at('a')['title'].split(' (dir.)')[0]
      year = item.at('span.secondaryInfo').text

      Film.new(title, director, year)
    end
  end

  def parse_wiki(url = WIKI)
    doc = Nokogiri::HTML(URI.open(url))

    doc.css('tbody > tr')[1..].map do |node|
      nodes = node.css('td')

      title = nodes[1].text
      director = nodes[3].text
      year = nodes[2].text
      Film.new(title, director, year)
    end
  end
end
