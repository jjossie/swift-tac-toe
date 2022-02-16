
func testDriverPromptCoord(){
    while true {
        if let c2 = Coord.promptCoord() {
            print(c2.display())
        } else {
            print("promptCoord didnt work")
        }
    }
}
