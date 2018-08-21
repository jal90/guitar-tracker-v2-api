class Guitar < ApplicationRecord
  belongs_to :user
  has_many :setups, dependent: :destroy

  include PgSearch
  pg_search_scope :whose_attrs_start_with, against: %i[make model year],
                                           using: { tsearch: { prefix: true } }
end
