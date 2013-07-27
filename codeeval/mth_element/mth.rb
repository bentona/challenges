input = File.open(ARGV.shift,'r').read.split("\n").collect
arr = input.collect{|l| l.split(' ')}

arr.collect do |line|
		m,c = line.pop.to_i,nil
		m.times do |i|
			c = line.pop
		end
		puts c
end
