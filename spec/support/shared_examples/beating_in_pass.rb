# frozen_string_literal: true

shared_examples 'beating in pass' do
  it 'changes previous field to nil' do
    expect { subject }.to change(board, :C5).to nil
  end

  it 'changes target field as new position' do
    expect { subject }.to change(board, :D6)
  end

  it 'saves move in game history' do
    expect { subject }.to change(Move, :count).by 1
  end

  it 'saves capture on board' do
    expect { subject }.to change(board, :C5).to nil
  end

  it 'saves capture in history' do
    subject
    expect(Move.last.taken).not_to be_nil
  end
end
