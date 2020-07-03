public class MapClass : Map {
    var players: [Player]
    var maze: [[MapTile]]

    required init(players: [Player]) {
        self.players = players
        self.maze = Array(Array(repeating: , count: Int))
    }

    

    func availableMoves(player: Player) -> [PlayerMove] {

    }
    func move(player: Player, move: PlayerMove) {

    }
}
