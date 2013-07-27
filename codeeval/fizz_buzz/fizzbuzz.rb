require 'pp'

sets = File.open(ARGV.shift,'r').read.split("\n")
outlines = []
sets.each do |set|
	fizz,buzz,n = set.split(' ').map{|m| m.to_i}
	ret = []
	(1..n).each do |e|
		out = ''
		out << 'F' if (e % fizz == 0)
		out << 'B' if (e % buzz == 0)
		out << e.to_s if ((e % fizz != 0) && (e % buzz != 0))
		ret << out
	end
	outlines << ret.join(' ')
end

print outlines.join("\n")
