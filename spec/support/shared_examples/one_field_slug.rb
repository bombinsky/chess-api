# frozen_string_literal: true

shared_examples 'one field slug' do |col_to_skip, row_to_skip, h, v|
  Board::ROWS.each do |row|
    next if row == row_to_skip

    Board::COLS.each do |col|
      next if col == col_to_skip

      context "next to field :#{ col }#{ row }" do
        let(:field) { "#{ col }#{ row }".to_sym }
        let(:expected_field) { "#{ (col.ord + h).chr }#{ row + v }".to_sym }

        it { is_expected.to eq expected_field }
      end
    end
  end
end
