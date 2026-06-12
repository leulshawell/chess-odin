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

	chess.init(board)
	
	m: chess.Move;

	//move the white night
	m = { from=57, to=42}
	chess.move(&m)



	chess.render_board_text();

}
