# frozen_string_literal: true

class ApplicationController < ActionController::API
  # TODO: should be updated or deleted depends on chosen authentication
  def current_user
    @current_user ||= game.next_player
  end
end
