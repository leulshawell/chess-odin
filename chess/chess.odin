package chess


import "core:fmt"


Board :: [64]u8

board: Board;

init:: proc(b: Board){
    board = b
}




render_board_text :: proc() {
    for p, c in board{
        if c % 8 == 0 { fmt.println() }
        fmt.printf("%c ", p)
    }
    fmt.println()
}




