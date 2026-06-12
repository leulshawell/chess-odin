package chess


import "core:fmt"


Board :: [64]u8

board: Board;

init:: proc(b: Board){
    board = b
}



piece_is_white :: proc(p: u8) -> bool {
    return (p > 'A') && (p < 'Z')
}


render_board_text :: proc() {
    for p, c in board{
        if c % 8 == 0 { fmt.println() }
        fmt.printf("%c ", p)
    }
    fmt.println()
}



move :: proc(move: ^Move) -> bool {
    isLegal := is_legal(move)
    if isLegal {
        move_piece(move)
        return true
    }

    fmt.printf("Illegal move: %c, %u %u\n", board[move.from], move.from, move.to)
    return false
}

//move a piece
move_piece :: proc(move: ^Move){
    board[move.to] = board[move.from]
    board[move.from] = '.'
}




//is a move legal
is_legal :: proc(move: ^Move) -> bool{
    //check if not empty cell
    if board[move.to] != '.'{
        from_is_white := piece_is_white(board[move.from])
        to_is_white   := piece_is_white(board[move.to])
        //can't move to same color piece
        if from_is_white == to_is_white { return false }
    }

    //check if piece can move there
    return piece_can_move(board[move.from], move.from, move.to)

}

