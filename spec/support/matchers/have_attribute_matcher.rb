# frozen_string_literal: true

# Have attribute matcher for serializers
RSpec::Matchers.define :have_attribute do |expected|
  match do |serialized_object|
    serialized_object.attributes.keys.include? expected
  end
end
