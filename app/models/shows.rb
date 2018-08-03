class Show < ActiveRecord::Base
  def self.highest_rating
    Show.maximum("rating")
  end
  def self.most_popular_show
    Show.find_by(rating: Show.maximum("rating"))
  end
  def self.lowest_rating
    Show.minimum("rating")
  end
  def self.least_popular_show
    Show.find_by(rating: Show.minimum("rating"))
  end
  def self.ratings_sum
    sum = 0
    Show.all.each do |show|
      sum += show.rating
    end
    sum
  end
  def self.popular_shows
    array = Array.new
    Show.all.each do |show|
      if show.rating > 5
        array << show
      end
    end
    array
  end
  def self.shows_by_alphabetical_order
    Show.order(name: :asc)
  end
        
end