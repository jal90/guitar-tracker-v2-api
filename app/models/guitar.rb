class Guitar < ApplicationRecord
  has_many :user_guitars
  has_many :users, through: :user_guitars

  include PgSearch
  pg_search_scope :whose_attrs_start_with, against: %i[make model year],
                                           using: { tsearch: { prefix: true } }
end

# TODO: Change datatype of price column to include decimals
