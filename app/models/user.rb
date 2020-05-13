# frozen_string_literal: true

# Represents user
class User < ActiveRecord::Base
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
