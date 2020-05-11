# frozen_string_literal: true

# Module to handle known exceptions
module ExceptionsHandling
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActionController::ParameterMissing, with: :unprocessable_entity
    rescue_from WrongMove, with: :wrong_move
  end

  private

  def record_not_found(exception)
    render json: { errors: [exception.message] }, status: :not_found
  end

  def unprocessable_entity(exception)
    render json: { errors: [exception.message] }, status: :unprocessable_entity
  end

  def wrong_move(exception)
    render json: { errors: { move: [exception.message] } }, status: :unprocessable_entity
  end
end
