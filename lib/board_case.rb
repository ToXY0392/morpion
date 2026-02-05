class BoardCase
  attr_reader :position
  attr_accessor :value

  def initialize(position)
    @position = position       # ex : "A1", "B3", etc.
    @value    = " "            # " " (vide), "X" ou "O"
  end

  def empty?
    @value == " "
  end
end
