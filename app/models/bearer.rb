class Bearer < ApplicationRecord
  has_many :bearer_stock
  has_many :stocks, through: :bearer_stock
  validates :name, uniqueness: true
  validates_presence_of :email, :age
end
