# frozen_string_literal: true

class User < ApplicationRecord
  include Authentication
  has_many :guitars, through: :user_guitars
  has_many :user_guitars
  has_many :setups, through: :user_guitars
end
