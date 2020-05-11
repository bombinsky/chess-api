# frozen_string_literal: true

shared_examples 'not successful response' do |status_code, expected_error_message, error_key = nil|
  it { is_expected.to respond_with status_code }

  it 'responds with proper content type' do
    expect(response.content_type).to eq 'application/json; charset=utf-8'
  end

  it "returns #{ expected_error_message } among #{ error_key } errors" do
    error_messages =
      if error_key.present?
        parsed_body_of_response['errors'][error_key]
      else
        parsed_body_of_response['errors']
      end

    expect(error_messages).to include expected_error_message
  end
end
