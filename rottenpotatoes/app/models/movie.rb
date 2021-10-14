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
end
