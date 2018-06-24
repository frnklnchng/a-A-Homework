class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = Array.new
  end

  def play
    system "cls" or system "clear"
    puts "Welcome to Simon."
    sleep 1
    system "cls" or system "clear"

    until game_over
      take_turn
      system "cls" or system "clear"
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless game_over
      round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    add_random_color

    seq.each do |color|
      puts color
      sleep 1
      system "cls" or system "clear"
      sleep 1
    end
  end

  def require_sequence
    system "cls" or system "clear"
    puts "Repeat the sequence."

    seq.each do |color|
      input = gets.chomp

      unless color[0] == input
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.shuffle[0]
  end

  def round_success_message
    system "cls" or system "clear"
    puts "The next sequence is:"
    sleep 1
  end

  def game_over_message
    puts "Game over."
  end

  def reset_game
    initialize
  end
end
