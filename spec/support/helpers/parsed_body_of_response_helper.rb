# frozen_string_literal: true

module ParsedBodyOfResponseHelper
  def parsed_body_of_response
    parsed = JSON.parse(response.body)
    parsed = parsed.with_indifferent_access if parsed.is_a?(Hash)
    parsed
  end
end
