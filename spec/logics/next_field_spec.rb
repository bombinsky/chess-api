# frozen_string_literal: true

describe NextField do
  describe '#call' do
    subject(:service_call) { described_class.new(field, movement).call }

    let(:board) { build :board }

    context 'when east' do
      let(:movement) { Movement::EAST }

      it_behaves_like 'limited at col', Board::COLS.last
      it_behaves_like 'one field slug', Board::COLS.last, nil, 0, 1
    end

    context 'when west' do
      let(:movement) { Movement::WEST }

      it_behaves_like 'limited at col', Board::COLS.first
      it_behaves_like 'one field slug', Board::COLS.first, nil, 0, -1
    end

    context 'when south' do
      let(:movement) { Movement::SOUTH }

      it_behaves_like 'limited at row', Board::ROWS.first
      it_behaves_like 'one field slug', nil, Board::ROWS.first, -1, 0
    end

    context 'when north' do
      let(:movement) { Movement::NORTH }

      it_behaves_like 'limited at row', Board::ROWS.last
      it_behaves_like 'one field slug', nil, Board::ROWS.last, 1, 0
    end

    context 'when north_east' do
      let(:movement) { Movement::NORTH_EAST }

      it_behaves_like 'limited at col', Board::COLS.last
      it_behaves_like 'limited at row', Board::ROWS.last
      it_behaves_like 'one field slug', Board::COLS.last, Board::ROWS.last, 1, 1
    end

    context 'when north_west' do
      let(:movement) { Movement::NORTH_WEST }

      it_behaves_like 'limited at col', Board::COLS.first
      it_behaves_like 'limited at row', Board::ROWS.last
      it_behaves_like 'one field slug', Board::COLS.first, Board::ROWS.last, 1, -1
    end

    context 'when south_east' do
      let(:movement) { Movement::SOUTH_EAST }

      it_behaves_like 'limited at col', Board::COLS.last
      it_behaves_like 'limited at row', Board::ROWS.first
      it_behaves_like 'one field slug', Board::COLS.last, Board::ROWS.first, -1, 1
    end

    context 'when south_west' do
      let(:movement) { Movement::SOUTH_WEST }

      it_behaves_like 'limited at col', Board::COLS.first
      it_behaves_like 'limited at row', Board::ROWS.first
      it_behaves_like 'one field slug', Board::COLS.first, Board::ROWS.first, -1, -1
    end
  end
end
