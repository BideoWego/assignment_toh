def color(number, string)
	code = ((number % 15) + 1).to_s
	bg = "\e[48;5;#{code}m"
	close = "\e[0m"
	"#{bg}#{string}#{close}"
end

def render(model, size)
	width = size + 1
	lines = []
	size.times do |i|
		lines << ''
		model.each do |stack|
			normalized = stack.join.rjust(size, '#').split('')
			string = ''.ljust(width)
			char = normalized[i] 
			if char != '#'
				number = char.to_i
				string = (number + 1).to_s.ljust(number + 1)
				string = color(number, string) + (' ' * (width - (number + 1)))
			end
			lines[i] += string
		end
	end
	lines << ('_' * size).ljust(width) * 3
	lines << (1..3).to_a.map {|i| i.to_s.center(width)}.join
	s = ''
	lines.each do |line|
		s += line + "\n"
	end
	s
end