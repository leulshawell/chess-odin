package chess

import "core:fmt"
import "core:math"

Move :: struct {
    from : u8,
    to   : u8
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
            if (y_jump == 1) ||  (y_jump == 2 && from_y == 1) {return true}

        case 'P':
            if (y_jump == 1) ||  (y_jump == 2 && from_y == 6) {return true}
        
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
            if(x_jump < 2 && y_jump < 2 && ((y_jump + x_jump) < 3) ){return true}

    }
    return false
}
