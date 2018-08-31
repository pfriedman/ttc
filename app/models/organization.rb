class Organization < ApplicationRecord
  validates :name, presence: true
  validates :category, presence: true
  validates :name, uniqueness: { scope: [:postal_code, :category] }
end
