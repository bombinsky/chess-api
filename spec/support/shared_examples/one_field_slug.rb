# frozen_string_literal: true

shared_examples 'one field slug' do |col_to_exclude, row_to_exclude, vertical_vector, horizontal_vector|
  Board::ROWS.each do |row|
    next if row == row_to_exclude

    Board::COLS.each do |col|
      next if col == col_to_exclude

      context "next to field :#{ col }#{ row }" do
        let(:field) { "#{ col }#{ row }".to_sym }
        let(:expected_field) { "#{ (col.ord + horizontal_vector).chr }#{ row + vertical_vector }".to_sym }

        it { is_expected.to eq expected_field }
      end
    end
  end
end
