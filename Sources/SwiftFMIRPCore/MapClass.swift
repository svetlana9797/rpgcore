//position
struct Position: Equatable{
    public var x: Int
    public var y: Int
    init (x: Int, y: Int){
        self.x = x
        self.y = y
    }
}

public class MapClass : Map {
    var players: [Player]
    var maze: [[MapTile]]
    var playersPositions: [String:Position]

    required init(players: [Player]) {
        self.players = players

        //set default positions for all players
        self.playersPositions = [String:Position]()
        for player in players{
        self.playersPositions[player.name] = Position(x:0,y:0)
        }

        //initialize the whole maze with empty tiles
        self.maze = Array(repeating:Array(repeating:TileClass(type:.empty), count: players.count*3),count: players.count*3)

        //insert the different tiles
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

        //set the player's positions after the shuffle
        for player in players {
            var i,j:Int
        //for each player get an empty position
        repeat{
            i = Int.random(in:0..<players.count*3)
            j = Int.random(in:0..<players.count*3)
        }while maze[i][j].type != .empty && !(playersPositions.values.contains(Position(x:i,y:j)))
            self.playersPositions[player.name] = Position(x:i,y:j)
        }
    }

    func isValid(x:Int,y:Int)-> Bool {
        return x>=0 && x<players.count*3 && y>=0 && y<players.count*3
        && maze[x][y].type != .wall
    }

    func availableMoves(player: Player) -> [PlayerMove] {

        let pos = playersPositions[player.name]!
        var res = [PlayerMove]()
        if(isValid(x: pos.x + 1, y: pos.y)) {
        res.append(StandartPlayerMove(direction: .up))
        }
        if(isValid(x:pos.x - 1, y:pos.y)) {
        res.append(StandartPlayerMove(direction: .down))
        }
        if(isValid(x:pos.x, y:pos.y + 1)) {
        res.append(StandartPlayerMove(direction: .right))
        }
        if(isValid(x:pos.x - 1, y:pos.y - 1)) {
        res.append(StandartPlayerMove(direction: .left))
        }
        return res
    }

    func move(player: Player, move: PlayerMove) {
        
        //get the current position of the player
        let x:Int = playersPositions[player.name]?.x ?? 0
        let y:Int = playersPositions[player.name]?.y ?? 0

        //change the player position on the map
        switch move.direction {
            case .up: playersPositions[player.name] = Position(x:x,y:y+1)
            case .down: playersPositions[player.name] = Position(x:x,y:y-1)
            case .left: playersPositions[player.name] = Position(x:x+1,y:y)
            case .right: playersPositions[player.name] = Position(x:x-1,y:y)
        }
        //remove 1 energy
        //player.hero.energy = player.hero.energy - 1


    }

    //function to shuffle the elements of the map
    func shuffleMap<T>(_ map: [[T]]) -> [[T]] {
        var iter = map.joined().shuffled().makeIterator()
        
        return map.map { $0.compactMap { _ in iter.next() }}
    }

}
