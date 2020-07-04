public class MapClass : Map {
    var players: [Player]
    var maze: [[MapTile]]

    required init(players: [Player]) {
        self.players = players

        //initialize the whole maze with empty tiles
        self.maze = Array(repeating:Array(repeating:TileClass(type:.empty), count: 6),count: 6)//players.count*3

        for i in 0..<6{//players.count*3 {
            for j in 0..<6{//players.count*3{

            var x:TileClass

            switch i {
                case 1: x = TileClass(type:.wall)
                case 2: x = TileClass(type:.chest)
                case 3: x = TileClass(type:.rock)
                default: x = TileClass(type:.empty)
                 }
                 maze[i][j] = x 
            }
        }

        //set teleports
        for i in 0..<players.count*2 {
            maze[4][i] = TeleportTileClass(position:Position(x:0,y:0))
        }

        //shuffle all the values in the maze
        self.maze = shuffleMap(maze)
        linkTeleports(map: &maze)
    }

    func availableMoves(player: Player) -> [PlayerMove] {
        return []
    }

    func move(player: Player, move: PlayerMove) {
        //check for possible moves
        //remove 1 energy
    }

    //function to shuffle the elements of the map
    func shuffleMap<T>(_ map: [[T]]) -> [[T]] {
        var iter = map.joined().shuffled().makeIterator()
        
        return map.map { $0.compactMap { _ in iter.next() }}
    }

    //link the teleports 2 by 2
    func linkTeleports(map: inout [[MapTile]]) {
        //TODO:
    }

}
