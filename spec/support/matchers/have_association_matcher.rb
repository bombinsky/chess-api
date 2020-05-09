# frozen_string_literal: true

RSpec::Matchers.define :have_association do |expected|
  match do |serialized_object|
    serialized_object.associations.map(&:name).include?(expected)
  end
end
