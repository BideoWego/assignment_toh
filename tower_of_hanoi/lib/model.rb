def model(d)
	m = []
	3.times do |i|
		m[i] = []
		d.times do |j|
			m[i] << j if i == 0
		end
	end
	m
end

def move!(model, from, to)
	from = from.to_i - 1
	to = to.to_i - 1
	if valid_move?(model, from, to)
		disk = model[from].shift
		model[to].unshift(disk)
	end
	model
end