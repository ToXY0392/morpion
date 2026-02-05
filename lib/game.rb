require "player"
require "board"
require "show"

class Game
  def initialize(game_number)
    @game_number    = game_number
    @round          = 1
    @board          = Board.new
    @players        = []
    @current_player = nil
    @winner         = nil

    setup_players
  end

  def play
    loop do
      Show.display_board(@board, @round)
      Show.display_players(@players[0], @players[1])

      play_turn

      if game_over?
        Show.display_board(@board, @round)
        announce_result
        break
      end

      switch_player
      @round += 1
    end
  end

  private

  def setup_players
    Show.display_welcome

    print "\nNom du joueur 1 (X) : "
    name1 = gets.chomp.strip
    name1 = "Joueur 1" if name1.empty?

    print "Nom du joueur 2 (O) : "
    name2 = gets.chomp.strip
    name2 = "Joueur 2" if name2.empty?

    @players << Player.new(name1, "X")
    @players << Player.new(name2, "O")

    @current_player = @players[0]
  end

  def play_turn
    loop do
      Show.display_turn(@current_player)
      choice = gets.chomp.strip.upcase

      status = @board.play(choice, @current_player.symbol)

      case status
      when :ok
        break
      when :invalid
        Show.display_invalid_move
      when :occupied
        Show.display_occupied_case
      end
    end
  end

  def switch_player
    @current_player = (@current_player == @players[0]) ? @players[1] : @players[0]
  end

  def game_over?
    symbol = @board.winner?
    if symbol
      @winner = @players.find { |p| p.symbol == symbol }
      return true
    end

    return true if @board.full?

    false
  end

  def announce_result
    if @winner
      Show.display_winner(@winner)
    else
      Show.display_draw
    end
  end
end
