protocol Map {
    init(players: [Player])
    var players: [Player] {get}
    var maze: [[MapTile]] {get}

    func availableMoves(player: Player) -> [PlayerMove]
    func move(player: Player, move: PlayerMove)
}

protocol PlayerMove {
    var direction: MapMoveDirection {get set}
    
    var friendlyCommandName: String {get set} 
}

enum MapMoveDirection {
    case up
    case down
    case left
    case right
}

protocol MapTile {
    var type: MapTileType {get set}
    var state: String {get set}
}

enum MapTileType {
    case empty
    case chest
    case wall
    case teleport
    case rock
}

protocol MapGenerator {
    func generate(players:[Player]) -> Map
}


