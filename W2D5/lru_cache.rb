class LRUCache
  def initialize(size)
    @size = size
    @cache = Array.new
  end

  def count
    @cache.length
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
      @cache << el
    elsif self.count >= @size
      @cache.shift
      @cache << el
    else
      @cache << el
    end
  end

  def show
    p @cache
    return nil
  end
end
