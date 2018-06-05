# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :examples
  has_many :guitars
  has_many :setups, through: :guitars
end
