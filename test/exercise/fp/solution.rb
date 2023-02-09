module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        result = array.each_with_object({ count: 0, total: 0 }) do |film, acc|
          countries = film['country'].to_s.split(',')
          rating = film['rating_kinopoisk'].to_f
          has_rating = rating.positive?
          if has_rating && countries.size > 1
            acc[:count] += 1
            acc[:total] += rating
          end
        end
        result[:total] / result[:count]
      end

      def chars_count(films, threshold)
        chars_and_ratings = films.map do |film|
          count = film['name'].count 'и'
          rating = film['rating_kinopoisk'].to_f
          { count: count, rating: rating }
        end
        chars_and_ratings.reduce(0) do |acc, item|
          acc += item[:count] if item[:rating] >= threshold
          acc
        end
      end
    end
  end
end
