def process(input)
	if $is_playing
		if ['r', 'reset'].include?(input)
			reset
		else
			move(input)
		end
	else
		start(input)
	end
end

def quit?(input)
	['q', 'quit', 'exit'].include?(input)
end

def game
	output = "Moves: #{$moves.to_s}\n"
	if win?
		output += color(1, "You win! Press Enter to play again.")
	elsif not $from
		output += 'Where would you like to move from?'
	elsif not $to
		output += 'Where would you like to move to?'
	end
	output += "\n\n" + render($model, $difficulty)
end

def prompt(message)
	system('clear')
	puts message
	puts "\n" + color(0, $notice) if not $notice.empty?
	print "\n> "
	gets.chomp
end

def display
	($is_playing) ? game : $welcome
end

def difficulty(input)
	d = input.to_i
	if valid_difficulty?(d)
		$is_playing = true
		$difficulty = d
		$model = model($difficulty)
	end
end

def move(input)
	if win?
		reset
	elsif not $from
		$from = input
	elsif not $to
		$to = input
		move!($model, $from, $to)
		$from = nil
		$to = nil
		$moves += 1
	end
end

def start(input)
	difficulty(input)
end

def reset
	$is_playing = false
	$difficulty = 3
	$from = nil
	$to = nil
	$moves = 0
	$model = []
end