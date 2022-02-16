
func testDriverPromptCoord() {
    let game = Game()
    while true {
        if let c2 = game.promptCoord(prompt: "Test square: ") {
            print(c2.render())
        } else {
            print("promptCoord didnt work")
        }
    }
}

func testBoardPlace() {
    let b = Board()
    if b.place(spot: Coord(1, 1), player: "X") == BoardMessage.success {
        print("Success")
        print(b.render())
    } else {
        print("Failure")
    }
}

func main() {
    let game = Game()
    while true{
        game.playTurn()
    }
}

main()