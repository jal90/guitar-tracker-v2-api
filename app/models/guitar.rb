class Guitar < ApplicationRecord
  has_many :user_guitars
  has_many :users, through: :user_guitars

  include PgSearch
  pg_search_scope :whose_attrs_start_with, against: %i[make model year],
                                           using: { tsearch: { prefix: true } }

  before_save :normalize_blank_values

  def normalize_blank_values
    attributes.each_key do |col|
      self[col].present? || self[col] = nil
    end
  end
end
