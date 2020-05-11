# frozen_string_literal: true

shared_examples 'successful response' do |status_code|
  it { is_expected.to respond_with status_code }

  it 'responds with proper content type' do
    expect(response.content_type).to eq 'application/json; charset=utf-8'
  end
end
