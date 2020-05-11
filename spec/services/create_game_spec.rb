# frozen_string_literal: true

describe CreateGame do
  describe '#call' do
    subject(:service_call) do
      described_class.new(creator: creator, white_player: white_player, black_player: black_player).call
    end

    let(:creator) { create :user }
    let(:white_player) { create :user }
    let(:black_player) { create :user }

    include_context 'with all chessmen loaded'

    it { is_expected.to be_a Game }
    it { is_expected.to be_valid }
    it { is_expected.to be_persisted }

    it 'saves creator' do
      expect(service_call.creator).to eq creator
    end

    it 'saves white_player' do
      expect(service_call.white_player).to eq white_player
    end

    it 'saves black_player' do
      expect(service_call.black_player).to eq black_player
    end

    it 'adds game to the system' do
      expect { service_call }.to change(Game, :count).by 1
    end

    it 'sets 32 chessman on board' do
      expect(service_call.board.chessmen.count).to eq 32
    end
  end
end
