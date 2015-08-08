MIN_DISKS = 3
MAX_DISKS = 10

$banner = "Tower Of Hanoi\n----\nType 'q', 'quit', or 'exit' at any time to quit.\nType 'r' or 'reset' while playing to reset.\n"
$welcome = "Welcome to Tower Of Hanoi! Please select a difficuly level between #{MIN_DISKS} and #{MAX_DISKS}"
$notice = ""

$is_playing = false
$difficulty = 3
$from = nil
$to = nil
$moves = 0
$model = []