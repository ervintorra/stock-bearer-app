class Stock < ApplicationRecord
  has_many :bearer_stock
  has_many :bearers, through: :bearer_stock

  validates_presence_of :name, :ticker, :last_price
  validates_uniqueness_of :name

  scope :enabled, -> { where(enabled: true) }
end
