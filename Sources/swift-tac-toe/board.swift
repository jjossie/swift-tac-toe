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
        // Check Rows
        for row in board {
            if sequenceFilled(sequence: row, player: player) {
                return true
            }
        }
        // Check Columns
        for i in 1..<4 {
            if sequenceFilled(sequence: [board[0][i], board[1][i], board[2][i]], player: player) {
                return true
            }
        }
        // Check diagonals
        

        return false
    }

    func sequenceFilled(sequence: Array<Character>, player: Character) -> Bool {
        return sequence.reduce(true, {(acc, val) in 
            return acc && val == player
        })
    }

    func save() {

    }

    func load(from filename: String) {

    }

    func render() -> String {
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


