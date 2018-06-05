class Guitar < ApplicationRecord
  belongs_to :user
  has_many :setups, dependent: :destroy
end
