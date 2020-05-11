LoadChessmen.new.call

creator = User.create! nickname: 'creator', email: 'creator@chess.backend.pl'
white_player = User.create! nickname: 'white', email: 'white@chess.backend.pl'
black_player = User.create! nickname: 'black', email: 'black@chess.backend.pl'

game = CreateGame.new(creator: creator, white_player: white_player, black_player: black_player).call

# CreateMove does not raise exceptions so using MoveChessman is safer here
MoveChessman.new(game, :F2, :F3).call
MoveChessman.new(game, :E7, :E5).call
MoveChessman.new(game, :G2, :G4).call
MoveChessman.new(game, :D8, :H4).call
