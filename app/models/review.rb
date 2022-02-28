class Review < ApplicationRecord
  belongs_to :restaurant

  def self.higher_rated_than(rating)
    where("rating > ?", rating)
  end

  scope :positive, ->{ higher_rated_than(2) }
  # Ex:- scope :active, -> {where(:active => true)}

  validates :rating, presence: true, numericality: { only_integer: true }, inclusion: 0..5
  validates :content, presence: true
end
