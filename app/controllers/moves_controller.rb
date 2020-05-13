# frozen_string_literal: true

# Moves controller
class MovesController < ApplicationController
  include ExceptionsHandling
  include Responder

  def create
    if game.next_player == current_user
      respond_with created_move, status: :created
    else
      render json: { errors: { move: ['You are not current player in this game'] } }, status: :unprocessable_entity
    end
  end

  private

  def created_move
    CreateMove.new(game, create_params[:from], create_params[:to]).call
  end

  def create_params
    @create_params ||= params.require(:move).permit(:from, :to)
  end

  def game
    @game ||= Game.find params[:game_id]
  end
end
