# frozen_string_literal: true

# Module with responder method
module Responder
  extend ActiveSupport::Concern

  private

  def respond_with(object, status:)
    if object.valid?
      render json: object, status: status
    else
      render json: { errors: object.errors }, status: :unprocessable_entity
    end
  end
end
