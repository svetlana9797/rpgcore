public class MapClass : Map {
    var players: [Player]
    var maze: [[MapTile]]

    required init(players: [Player]) {
        self.players = players

        //initialize the whole maze with empty tiles
        self.maze = Array(repeating:Array(repeating:TileClass(type:.empty), count: players.count*3),count: players.count*3)

        for i in 0..<players.count*3 {
            for j in 0..<players.count*3{

            var x:TileClass

            switch (i,j) {
                case (1,_): x = TileClass(type:.wall)
                case (2,_): x = TileClass(type:.chest)
                case (3,_): x = TileClass(type:.rock)
                case (4,0..<players.count*2): x = TeleportTileClass()
                default: x = TileClass(type:.empty)
                 }
                 maze[i][j] = x 
            }
        }

        //shuffle all the values in the maze
        self.maze = shuffleMap(maze)
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

}
