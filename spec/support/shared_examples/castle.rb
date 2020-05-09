# frozen_string_literal: true

shared_examples 'castle' do
  it 'changes previous king field to nil' do
    expect { subject }.to change(board, :E1).to nil
  end

  it 'changes previous tower field to nil' do
    expect { subject }.to change(board, :A1).to nil
  end

  it 'changes new field of king' do
    expect { subject }.to change(board, to)
  end

  it 'changes new field of rook' do
    expect { subject }.to change(board, :D1)
  end

  it 'saves two moves in game history' do
    expect { subject }.to change(Move, :count).by 2
  end

  it 'does not saves taken_id' do
    expect(subject.taken_id).to be_nil
  end

  it 'does not saves captured' do
    expect(subject.captured).to be_nil
  end

  it_behaves_like 'special moves saver', :castle, 2
end
