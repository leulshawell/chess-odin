package chess


import "core:fmt"


Board :: [64]u8
Player:: u8



Game:: struct {
    check: u8, //1 white checked, -1 black checked
    turn: u8,  //0 white, 1 back
    board: ^Board
}



game := Game{}


render_board_text :: proc(board: ^Board) {
    for p, c in board{
        if c % 8 == 0 { fmt.println() }
        fmt.printf("%c ", p)
    }
    fmt.println()
}


init_game:: proc(board: ^Board) -> ^Game{
    game.board = board
    render_board_text(board)
    return &game
}

next:: proc(game: ^Game, m: ^Move){
    is_white := piece_is_white(game.board[m.from])

    if(is_white && bool(game.turn)){
        fmt.println("Its is black's  turn")
    }else {
        move(game.board, m)
        render_board_text(game.board)
    }
}



