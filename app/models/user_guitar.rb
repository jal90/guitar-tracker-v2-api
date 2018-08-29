class UserGuitar < ApplicationRecord
  belongs_to :user
  belongs_to :guitar

  has_many :setups
end
