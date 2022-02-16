struct Coord {
    let x: Int
    let y: Int

    init(_ row: Int, _ col: Int) {
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

    func render() -> String {
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


}