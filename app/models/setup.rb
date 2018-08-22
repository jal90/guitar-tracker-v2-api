class Setup < ApplicationRecord
  has_many :users, through: :guitars
  belongs_to :user_guitars

  default_scope { order(created_at: :desc) }

  include PgSearch
  pg_search_scope :whose_attrs_start_with,
                  against: %i[string_brand string_gauge setup_notes],
                  using: { tsearch: { prefix: true } }
end
