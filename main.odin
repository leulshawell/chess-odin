package main

import "core:fmt"
import "./chess"




main:: proc(){
	board: chess.Board = {
		'r', 'n', 'b', 'q', 'k', 'b', 'n', 'r',
		'p', 'p', 'p', 'p', 'p', 'p', 'p', 'p',
		'.', '.', '.', '.', '.', '.', '.', '.',
		'.', '.', '.', '.', '.', '.', '.', '.',
		'.', '.', '.', '.', '.', '.', '.', '.',
		'.', '.', '.', '.', '.', '.', '.', '.',
		'P', 'P', 'P', 'P', 'P', 'P', 'P', 'P',
		'R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R',
	}

	game := chess.init_game(&board)

	m := chess.Move{from=51, to=35}
	chess.next(game, &m)

	m = chess.Move{from=11, to=27}
	chess.next(game, &m)


	m = chess.Move{from=50, to=34}
	chess.next(game, &m)

	m = chess.Move{from=12, to=20}
	chess.next(game, &m)

	m = chess.Move{from=34, to=26}
	chess.next(game, &m)



}
