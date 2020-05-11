# frozen_string_literal: true

# Moves controller
class GamesController < ApplicationController
  include ExceptionsHandling

  def create
    respond_with created_game, status: :created
  end

  private

  def created_game
    CreateGame.new(creator: current_user, white_player: white_player, black_player: black_player).call
  end

  def white_player
    User.find create_params[:white_player_id]
  end

  def black_player
    User.find create_params[:black_player_id]
  end

  def create_params
    @create_params ||= params.require(:game).permit(:white_player_id, :black_player_id)
  end
end
