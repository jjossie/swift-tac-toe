
func testDriverPromptCoord(){
    let game = Game()
    while true {
        if let c2 = game.promptCoord() {
            print(c2.display())
        } else {
            print("promptCoord didnt work")
        }
    }
}

func testBoardPlace() {
    var b = Board()
    if b.place(spot: Coord(1, 1), player: "X") == BoardMessage.success {
        print("Success")
        print(b.display())
    } else {
        print("Failure")
    }
}


testBoardPlace()