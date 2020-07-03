public class MapGeneration : MapGenerator {

func generate(players:[Player]) -> Map {
let numPlayers = players.count
let numRows = numPlayers*3

return MapClass(players:players)
}

}