class ApplicationController < ActionController::API
  def respond_with(object, status:)
    if object.valid?
      render json: object, status: status
    else
      render json: { errors: object.errors }, status: :unprocessable_entity
    end
  end

  # TODO: should be updated or deleted depends on chosen authentication
  def current_user
    User.create_or_find_by!(nickname: 'creator', email: 'creator@chess.backend.pl')
  end
end
