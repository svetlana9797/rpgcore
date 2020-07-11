//import SwiftFMIRPCore

public class MapGeneration : MapGenerator {

func generate(players:[Player]) -> Map {
    let renderer = MapRendererClass()
    let map = MapClass(players:players)
    
    //print the map with information for the players and their position on the map
    renderer.renderMap(map: map)
    renderer.introducePlayers(players: players)
    
    return map
    }
}

