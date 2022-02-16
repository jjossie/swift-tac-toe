
class Game {
    
    let colAliases: Dictionary<Character, Int> = [
        "A": 0,
        "B": 1,
        "C": 2
    ]

    var board: Board
    var turn: Character

    init() {
        board = Board()
        turn = "X"
    }

    func playTurn() {
        print(board.render())
        var finished = false
        while (!finished){
            if let coord = promptCoord(prompt: "\(turn)> ") {
                let result = board.place(spot: coord, player: turn)
                if result == .success {
                    nextPlayer()
                    finished = true
                } else if result == .illegalMove {
                    error("Spot is already taken")
                }
            }
        }
    }

    private func nextPlayer(){
        if turn == "X"{
            turn = "O"
        } else if turn == "O" {
            turn = "X"
        }
    }

    func promptCoord(prompt: String) -> Coord? {
        print(prompt)
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