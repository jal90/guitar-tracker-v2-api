class Setup < ApplicationRecord
  has_many :users, through: :guitars
  belongs_to :guitar
end
