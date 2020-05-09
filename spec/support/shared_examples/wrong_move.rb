# frozen_string_literal: true

shared_examples 'wrong move' do |message|
  it "raises Wrong Move with #{ message } message" do
    expect { subject }.to raise_error(WrongMove, message)
  end
end
