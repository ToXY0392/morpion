require "game"

class Application
  def initialize
    @games_played = 0
  end

  def perform
    loop do
      @games_played += 1
      system("clear") || system("cls")

      puts "==============================="
      puts "       MORPION - PARTIE #{@games_played}"
      puts "==============================="

      game = Game.new(@games_played)
      game.play

      break unless ask_replay?
    end

    puts "\nMerci d'avoir joué ✌"
  end

  private

  def ask_replay?
    print "\nVoulez-vous lancer une nouvelle partie ? (y/n) : "
    answer = gets.chomp.downcase
    answer == "y"
  end
end
