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

    func place(spot: Coord, player: Character) {

    }

    func hasWon(player: Character) -> Bool {

        return false
    }

    func save() {

    }

    func load(from filename: String) {

    }

    func display() {

    }

}


struct Coord {
    let x: Int
    let y: Int

    static let colAliases: Dictionary<Character, Int> = [
        "A": 0,
        "B": 1,
        "C": 2
    ]

    init(row: Int, col: Int) {
        if row < 3 && row >= 0 {
            x = row
        } else {
            x = 0
        }
        if col < 3 && row >= 0 {
            y = col
        } else {
            y = 0
        }
    }

    func display() -> String {
        var yChar: Character = " "
        if y == 0 {
            yChar = "A"
        } else if y == 1 {
            yChar = "B"
        } else {
            yChar = "C"
        }
        return "\(yChar)\(x+1)"
    }

    static func promptCoord() -> Coord? {
        print("Select a square: ")
        let allowedNumbers = 1..<4
        var row = -1
        var col = -1
        guard let userInput = readLine()
        else {
            error("Invalid input.")
            return nil
        }
        guard userInput.count == 2
        else {
            error("Enter a 2-character coordinate, like B2 or 3c or whatever")
            return nil
        }

        let chars = userInput.uppercased()
        for char in chars{
            if char.isLetter && colAliases.keys.contains(char) {
                if col == -1 {
                    col = colAliases[char]!
                } else {
                    error("Two column indicators provided. Use a number and a letter")
                    return nil
                }
            } else if let rowNum = char.wholeNumberValue {
                if row == -1 && allowedNumbers.contains(rowNum) {
                    row = rowNum - 1
                } else {
                    error("Two row indicators provided. Use a number and a letter")
                    return nil
                }
            } else {
                error("Unexpected character.")
                return nil
            }
        }
        assert(row != -1)
        assert(col != -1)
        return Coord(row: row, col: col)
    }
}


func error(_ msg: String) {
    print("ERROR: \(msg)")
}