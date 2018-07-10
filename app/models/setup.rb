class Setup < ApplicationRecord
  has_many :users, through: :guitars
  belongs_to :guitar

  default_scope { order(created_at: :desc) }
end
