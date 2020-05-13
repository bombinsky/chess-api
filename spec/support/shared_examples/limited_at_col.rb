# frozen_string_literal: true

shared_examples 'limited at col' do |col|
  Board::ROWS.each do |row|
    context "next to boundary field :#{ col }#{ row }" do
      let(:field) { "#{ col }#{ row }".to_sym }

      it { is_expected.to be_nil }
    end
  end
end
