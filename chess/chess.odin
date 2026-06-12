package chess


import "core:fmt"


Board :: [64]u8

board: Board;

init:: proc(b: Board){
    board = b
}

@(private="file")
_cell_to_index :: proc(cell: []u8) -> u8 {
    return 0
}


@(private="file")
_piece_is_white :: proc(p: u8) -> bool {
    return (p > 'A') && (p < 'Z')
}

/*
render chess board as string
 */
render_board_text :: proc() {
    for p, c in board{
        if c % 8 == 0 { fmt.println() }
        fmt.printf("%c ", p)
    }
    fmt.println()
}


Move :: struct {
    from : u8,
    to   : u8
}


move :: proc(move: ^Move) -> bool {
    isLegal := is_legal(move)
    if isLegal {
        move_piece(move)
        return true
    }
    return false
}

//move a piece
move_piece :: proc(move: ^Move){
    board[move.to] = board[move.from]
    board[move.from] = '.'
}



piece_can_move :: proc(p: u8, from: u8, to:u8) -> bool {
    from_x, from_y := from / 8, from % 8 //col, row
    to_x, to_y := to / 8, to % 8 //col, row

    return true

}

//is a move legal
is_legal :: proc(move: ^Move) -> bool{
    //check if not empty cell
    if board[move.to] != '.'{
        from_is_white := _piece_is_white(board[move.from])
        to_is_white   := _piece_is_white(board[move.to])
        //can't move to same color piece
        if from_is_white == to_is_white { return false }
    }

    //check if piece can move there
    return piece_can_move(board[move.from], move.from, move.to)

}

