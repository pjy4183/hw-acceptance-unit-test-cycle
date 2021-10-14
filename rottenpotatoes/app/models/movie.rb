class Movie < ActiveRecord::Base
    def self.find_same_director(id)
        movie = Movie.find_by(id: id)
        # return nil if movie.director.nil?
        # return Movie.where(direcotr: movie.direcotr)
        if movie.director.nil? or movie.director.empty?
            return nil
        else
            return Movie.where(director: movie.director)
        end
    end
    def self.all_ratings
        %w(G PG PG-13 NC-17 R)
    end
end
