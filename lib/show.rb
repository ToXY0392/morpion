# On essaie de charger colorize, mais le jeu reste jouable même sans
begin
  require "colorize"
rescue LoadError
end

class Show
  def self.display_board(board, round)
    system("clear") || system("cls")

    puts "========================================"
    puts "           MORPION".center(31)
    puts "        Tour n° #{round}".center(31)
    puts "========================================\n\n"

    a1 = colorize_symbol(board.cases["A1"].value)
    a2 = colorize_symbol(board.cases["A2"].value)
    a3 = colorize_symbol(board.cases["A3"].value)

    b1 = colorize_symbol(board.cases["B1"].value)
    b2 = colorize_symbol(board.cases["B2"].value)
    b3 = colorize_symbol(board.cases["B3"].value)

    c1 = colorize_symbol(board.cases["C1"].value)
    c2 = colorize_symbol(board.cases["C2"].value)
    c3 = colorize_symbol(board.cases["C3"].value)

    puts "     1   2   3"
    puts "   -------------"
    puts " A | #{a1} | #{a2} | #{a3} |"
    puts "   -------------"
    puts " B | #{b1} | #{b2} | #{b3} |"
    puts "   -------------"
    puts " C | #{c1} | #{c2} | #{c3} |"
    puts "   -------------"
  end

  def self.display_welcome
    puts "Bienvenue dans le Morpion 🎮"
    puts "Deux joueurs humains, pas d'IA, pas de triche."
    puts "-" * 40
  end

  def self.display_players(player1, player2)
    puts "\nJoueurs :"
    puts " - #{player1.name} joue avec #{player1.symbol}"
    puts " - #{player2.name} joue avec #{player2.symbol}"
  end

  def self.display_turn(player)
    puts "\nC'est au tour de #{player.name} (#{player.symbol})"
    print "Choisis une case (ex: A1, B3) : "
  end

  def self.display_invalid_move
    puts "Entrée invalide. Merci de choisir une case parmi A1, A2, ..., C3."
  end

  def self.display_occupied_case
    puts "Cette case est déjà occupée, choisis-en une autre."
  end

  def self.display_winner(player)
    puts "\n🎉 #{player.name} a gagné la partie !"
  end

  def self.display_draw
    puts "\nMatch nul, le plateau est plein 😶"
  end

  private

  def self.colorize_symbol(sym)
    return " " if sym == " "

    if sym == "X"
      colorize_if_possible(sym, :light_red)
    else
      colorize_if_possible(sym, :light_blue)
    end
  end

  def self.colorize_if_possible(text, color)
    if text.respond_to?(:colorize)
      text.colorize(color)
    else
      text
    end
  end
end
