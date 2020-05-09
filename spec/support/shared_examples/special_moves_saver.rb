# frozen_string_literal: true

shared_examples 'special moves saver' do |special_move_type, count|
  let(:scope) do
    Move.where(special_type: Move.special_types[special_move_type])
  end

  it "adds #{ count } movements with special_type #{ special_move_type }" do
    expect { subject }.to change(scope, :count).by count
  end
end
