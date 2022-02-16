
class Game {

    var board: Board
    var turn: Character

    init(){
        board = Board()
        turn = "X"
    }

    let colAliases: Dictionary<Character, Int> = [
        "A": 0,
        "B": 1,
        "C": 2
    ]

    func promptCoord() -> Coord? {
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
        return Coord(row, col)
    }
        
    func error(_ msg: String) {
        print("ERROR: \(msg)")
    }
}