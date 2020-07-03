public class MapClass : Map {
    var players: [Player]
    var maze: [[MapTile]]

    required init(players: [Player]) {
        self.players = players
        self.maze = []
    }

    func availableMoves(player: Player) -> [PlayerMove] {
        return []
    }

    func move(player: Player, move: PlayerMove) {
        //check for possible moves
        //remove 1 energy
    }
}
