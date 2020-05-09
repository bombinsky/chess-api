# frozen_string_literal: true

# Represents user
class User < ActiveRecord::Base
  validates :nickname, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def games
    Game.includes(:moves, :board).where('? IN (white_player_id, black_player_id, creator_id)', id)
  end
end
