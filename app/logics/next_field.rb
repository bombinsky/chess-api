# frozen_string_literal: true

# Service object that determine what will be the next field in specific direction
class NextField
  def initialize(field, heading)
    @field = field
    @heading = heading
  end

  def call
    next_field if Board::FIELDS.include? next_field
  end

  private

  attr_reader :field, :heading

  def next_field
    @next_field ||= send(:"next_field_heading_#{ heading }")
  end

  def next_field_heading_n
    "#{ current_col }#{ current_row.next }".to_sym
  end

  def next_field_heading_s
    "#{ current_col }#{ current_row.pred }".to_sym
  end

  def next_field_heading_e
    "#{ next_col }#{ current_row }".to_sym
  end

  def next_field_heading_w
    "#{ previous_col }#{ current_row }".to_sym
  end

  def next_field_heading_ne
    "#{ next_col }#{ current_row.next }".to_sym
  end

  def next_field_heading_nw
    "#{ previous_col }#{ current_row.next }".to_sym
  end

  def next_field_heading_se
    "#{ next_col }#{ current_row.pred }".to_sym
  end

  def next_field_heading_sw
    "#{ previous_col }#{ current_row.pred }".to_sym
  end

  def current_col
    field.to_s.first
  end

  def previous_col
    (current_col.ord - 1).chr
  end

  def next_col
    (current_col.ord + 1).chr
  end

  def current_row
    field.to_s.last.to_i
  end
end
