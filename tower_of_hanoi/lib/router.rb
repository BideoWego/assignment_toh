def play
	begin
		message = "#{$banner}\n#{display}"
		input = prompt(message)
		$notice = ''
		process(input)
	end while not quit?(input)
	system('clear')
end