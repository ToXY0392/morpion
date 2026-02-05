require "board_case"

class Board
  attr_reader :cases

  def initialize
    # Hash : "A1" => instance de BoardCase
    @cases = {}
    %w[A B C].each do |row|
      %w[1 2 3].each do |col|
        position = "#{row}#{col}"
        @cases[position] = BoardCase.new(position)
      end
    end
  end

  # Joue un coup sur une position "A1", "C3", etc.
  # Retourne : :ok, :invalid, :occupied
  def play(position, symbol)
    position = position.to_s.upcase

    return :invalid unless @cases.key?(position)

    cell = @cases[position]
    return :occupied unless cell.empty?

    cell.value = symbol
    :ok
  end

  # Retourne "X", "O" ou nil
  def winner?
    winning_lines = [
      %w[A1 A2 A3],
      %w[B1 B2 B3],
      %w[C1 C2 C3],
      %w[A1 B1 C1],
      %w[A2 B2 C2],
      %w[A3 B3 C3],
      %w[A1 B2 C3],
      %w[A3 B2 C1]
    ]

    winning_lines.each do |line|
      values = line.map { |pos| @cases[pos].value }
      if values[0] != " " && values.uniq.size == 1
        return values[0] # "X" ou "O"
      end
    end

    nil
  end

  def full?
    @cases.values.all? { |cell| !cell.empty? }
  end

  def reset!
    @cases.values.each { |cell| cell.value = " " }
  end
end
