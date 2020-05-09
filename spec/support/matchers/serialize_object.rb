# frozen_string_literal: true

RSpec::Matchers.define :serialize_object do |object|
  match do |parsed_body_of_response|
    serializer_for(object) == parsed_body_of_response
  end

  chain :with do |serializer_klass|
    @serializer_klass = serializer_klass
  end

  chain :using_root_key do |root_key|
    @root = root_key
  end

  private

  def serializer_for(object)
    if @root.present?
      { @root.to_s => serialized(object) }
    else
      serialized(object)
    end
  end

  def serialized(object)
    if object.is_a?(Array) || object.is_a?(ActiveRecord::Relation)
      object.map { |element| serialized_json(element) }
    else
      serialized_json(object)
    end
  end

  def serialized_json(object)
    JSON.parse @serializer_klass.new(object, root: @root).to_json
  end
end
