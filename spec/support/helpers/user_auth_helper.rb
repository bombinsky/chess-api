# frozen_string_literal: true

# Module needed to test controllers guarded by TokenAuth
module UserAuthHelper
  # TODO: should be replaced with chosen authentication method
  # rubocop:disable RSpec/AnyInstance
  def authenticate(user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  end
  # rubocop:enable RSpec/AnyInstance
end
