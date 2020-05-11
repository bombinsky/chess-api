# frozen_string_literal: true

shared_context 'with all chessmen loaded' do
  before do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
    LoadChessmen.new.call
  end
end
