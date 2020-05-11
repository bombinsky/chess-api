# frozen_string_literal: true

# Module with methods shared by services related to beating in pass
module BeatingInPass
  extend ActiveSupport::Concern

  private

  def row
    chessman_current_row + chessman.vector
  end

  def chessman_in_position?
    chessman.beating_in_pass_row == chessman_current_row
  end

  def chessman_current_row
    field.to_s.last.to_i
  end
end
