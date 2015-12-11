class FireGrid

  attr_accessor :arr

  SIZE = 1000

  def initialize(file)
    @arr = Array.new(SIZE) { Array.new(SIZE, 0) }
    lines = File.open(file, 'r').read.split("\n")
    lines.each{|line| parse_line(line) }
  end

  def parse_line(line)
    rect = extract_rect(line)
    case
    when line =~ /turn on/
      turn_on(rect)
    when line =~ /turn off/
      turn_off(rect)
    when line =~ /toggle/
      toggle(rect)
    else
      raise 'something broke'
    end
  end

  def extract_rect(line)
    line.scan(/([0-9]{1,3}),([0-9]{1,3})/).map{|r| r.map(&:to_i)}
  end

  def change(coords, f)
    (coords.first.first..coords.last.first).each do |x|
      (coords.first.last..coords.last.last).each do |y|
        @arr[x][y] = f.call(@arr[x][y])
      end
    end
  end

  def turn_on(coords)
    change(coords, -> (n){ n + 1} )
  end

  def turn_off(coords)
    change(coords, -> (n){ [n-1,0].max } )
  end

  def toggle(coords)
    change(coords, ->(n){ n + 2 } )
  end

end

fg = FireGrid.new(ARGV.shift)
puts fg.arr.flatten.inject(:+)