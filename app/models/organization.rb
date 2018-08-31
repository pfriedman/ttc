class Organization < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :name, uniqueness: { scope: [:postal, :category] }

  scope :name_filter, -> (name) { where name: name }
  scope :city_filter, -> (city) { where city: city }
  scope :state_filter, -> (state) { where state: state }
  scope :postal_filter, -> (postal) { where postal: postal }
  scope :category_filter, -> (category) { where category: category }
end
