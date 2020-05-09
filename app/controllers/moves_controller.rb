# frozen_string_literal: true

# Moves controller
class MovesController < ApplicationController
  include ExceptionsHandling

  def create
    render json: created_move, status: :created
  end

  private

  def created_move
    MoveChessman.new(game, create_params[:from], create_params[:to]).call
  end

  def create_params
    permitted_create_params.require(:from)
    permitted_create_params.require(:to)
    permitted_create_params
  end

  def permitted_create_params
    @permitted_create_params ||= params.require(:move).permit(:from, :to)
  end

  def game
    @game ||= Game.find params[:game_id]
  end
end
