def valid_difficulty?(d)
	if d >= MIN_DISKS && d <= MAX_DISKS
		return true
	else
		$notice = 'Invalid difficulty value'
		return false
	end
end

def valid_move?(model, from, to)
	if $from == '' || $to == ''
		$notice = 'Must give a stack number to move from and to'
		return false
	elsif ! model[from.to_i] || ! model[to.to_i]
		$notice = "Invalid stack number"
		return false
	elsif model[from.to_i].empty?
		$notice = "Cannot move from empty stack"
		return false
	elsif model[to.to_i].first && model[from.to_i].first > model[to.to_i].first
		$notice = "Cannot move larger disk onto smaller disk"
		return false
	end
	return true
end

def win?
	return ($model[2].join == (0...$difficulty).to_a.join)
end