
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
}

func promptCoord() -> Coord? {
    print("Select a square: ")
    

}