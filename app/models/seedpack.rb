class Seedpack < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :number, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true
end
