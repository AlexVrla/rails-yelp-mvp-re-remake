class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  # scope :french, -> { where(:category => "french")}
  # Ex:- scope :active, -> {where(:active => true)}
  scope :positive_reviews, -> { joins(:reviews).where('restaurants.reviews.rating > 2') }

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :category, presence: true, inclusion: ["chinese", "italian", "japanese", "french", "belgian"]
end
