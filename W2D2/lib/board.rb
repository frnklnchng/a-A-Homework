class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, i|
      next if i == 6 || i == 13

      cup << :stone
      cup << :stone
      cup << :stone
      cup << :stone
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, 12)
    raise "Empty starting cup" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stone_stack = cups[start_pos]
    @cups[start_pos] = Array.new

    i = start_pos

    until stone_stack.empty?
      i += 1

      i = 0 if i > 13

      if i == 6
        @cups[6] << stone_stack.pop if @name1 == current_player_name
      elsif i == 13
        @cups[13] << stone_stack.pop if @name2 == current_player_name
      else
        @cups[i] << stone_stack.pop
      end
    end

    render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all? {|cup| cup.empty?} || cups[7..12].all? {|cup| cup.empty?}
  end

  def winner
    count1 = cups[6].count
    count2 = cups[13].count

    if count1 == count2
      :draw
    else
      count1 > count2 ? @name1 : @name2
    end
  end
end
