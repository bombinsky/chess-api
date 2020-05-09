# frozen_string_literal: true

shared_examples 'check maker' do
  it 'saves check status in game history' do
    subject

    expect(game.check?).to eq true
  end
end

shared_examples 'not check maker' do
  it 'does not save check status in game history' do
    subject

    expect(game.check?).to eq false
  end
end
