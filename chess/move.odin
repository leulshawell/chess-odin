package chess

import "core:fmt"
import "core:math"

Move :: struct {
    from: u8,
    to  : u8
}


piece_is_white :: proc(p: u8) -> bool {
    return (p > 'A') && (p < 'Z')
}



move :: proc(board: ^Board, move: ^Move) -> bool {
    isLegal := is_legal(board, move)
    if isLegal {
        move_piece(board, move)
        return true
    }

    fmt.printf("Illegal move: %c, %u %u\n", board[move.from], move.from, move.to)
    return false
}

//move a piece
move_piece :: proc(board: ^Board, move: ^Move){
    board[move.to] = board[move.from]
    board[move.from] = '.'
}




//is a move legal
is_legal :: proc(board: ^Board, move: ^Move) -> bool{
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



/**
Takes a piece, from position and to position and checks if the move is legal
*/
piece_can_move :: proc(p: u8, from: u8, to:u8) -> bool {
    from_x, from_y := from % 8, from / 8 //col, row
    to_x, to_y := to % 8, to / 8 //col, row

    x_jump := math.abs(i8(from_x) - i8(to_x))
    y_jump := math.abs(i8(from_y) - i8(to_y))

    switch (p){
        //powns
        case 'p':  
            if (y_jump == 1) || (y_jump == 2 && from_y == 1) {return true}

        case 'P':
            if (y_jump == 1) || (y_jump == 2 && from_y == 6) {return true}
        
        //bishops
        case 'b', 'B':  
            if(x_jump == y_jump) {return true}
            return false
        
        //nights
        case 'n', 'N':  
            if (x_jump == 1 && y_jump == 2) || 
                ((x_jump == 2 && y_jump == 1)) {return true}
            return false

        //rooks
        case 'r', 'R':  
            if x_jump == 0 || y_jump == 0 {return true}
            return false

        //queens
        case 'q', 'Q':  
        if  (x_jump == y_jump) || (x_jump == 0 || y_jump == 0) { return true }
            return false

        //kings
        case 'k', 'K':  
            if(x_jump < 2 && y_jump < 2 && ((y_jump + x_jump) < 3) ){
                //make sure the king is not moving to a check

                return true
            }

    }
    return false
}
