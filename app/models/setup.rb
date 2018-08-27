class Setup < ApplicationRecord
  belongs_to :user_guitar
  has_many :users, through: :user_guitars
  # belongs_to :user

  default_scope { order(created_at: :desc) }

  include PgSearch
  pg_search_scope :whose_attrs_start_with,
                  against: %i[string_brand string_gauge setup_notes],
                  using: { tsearch: { prefix: true } }
end
