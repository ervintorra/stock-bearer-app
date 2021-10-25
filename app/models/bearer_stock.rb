class BearerStock < ApplicationRecord
  belongs_to :bearer
  belongs_to :stock
end
