import Foundation


class Board {
    var board: Array<Array<Character>>

    init() {
        board = [
            [" ", " ", " "],
            [" ", " ", " "],
            [" ", " ", " "]
        ]
    }

    func place(spot: Coord, player: Character) -> BoardMessage? {
        if board[spot.x][spot.y] == " "{
            board[spot.x][spot.y] = player
            return .success
        } else {
            return .illegalMove
        }
    }

    func hasWon(player: Character) -> Bool {

        return false
    }

    func save() {

    }

    func load(from filename: String) {

    }

    func display() -> String{
        var output = ""
        output += "    A   B   C  \n"
        var rowLabel = 1
        for row in board {
            output += " \(rowLabel)  \(row[0]) | \(row[1]) | \(row[2])\n"
            if rowLabel != 3 {
                output += "   ---+---+---\n"
            }
            rowLabel += 1
        }

        return output
    }

}

enum BoardMessage {
    case success
    case illegalMove
}


