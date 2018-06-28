def quad_longest_fish(fishes)
  fishes.each_with_index do |fish1, i1|
    longest = true

    fishes.each_with_index do |fish2, i2|
      next if i1 == i2
      longest = false if fish2.length > fish1.length
    end

    return fish1 if longest
  end
end

def nlogn_longest_fish(fishes)
  prc = Proc.new {|x, y| y.length <=> x.length}
  fishes.merge_sort(&prc).first
end

def linear_longest_fish(fishes)
  longest = fishes.first

  fishes.each do |fish|
    longest = fish if fish.length > longest.length
  end

  longest
end

def slow_dance(dir, tiles)
  tiles.each_with_index do |tile, i|
    return i if tile == dir
  end
end


def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end

class Array
  def merge_sort(&prc)
    prc ||= Proc.new {|x, y| x <=> y}

    return self if self.length <= 1

    mid = self.length / 2
    left = self.take(mid).merge_sort(&prc)
    right = self.drop(mid).merge_sort(&prc)

    Array.merge(left, right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}
