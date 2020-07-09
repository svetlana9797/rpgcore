//import SwiftFMIRPCore
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
    var teleportsPositions: [Position]

    required init(players: [Player]) {
        self.players = players

        //set default positions for all players
        self.playersPositions = [String:Position]()
        for player in players{
        self.playersPositions[player.name] = Position(x:0,y:0)
        }
        
        self.teleportsPositions = [Position]()

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
                case (4,0..<players.count*2): x = TileClass(type: .teleport)
                default: x = TileClass(type:.empty)
                 }
                 maze[i][j] = x 
            }
        }

        //shuffle all the values in the maze
        self.maze = shuffleMap(maze)

        //get the teleports positions
        for i in 0..<maze.count {
            for j in 0..<maze[0].count {
                if maze[i][j].type == .teleport{
                    self.teleportsPositions.append(Position(x:i,y:j))
                }
            }
        }

        //set the player's positions after the shuffle
        for player in players {
            var i,j:Int
        //for each player get an empty position
        repeat{
            i = Int.random(in:0..<players.count*3)
            j = Int.random(in:0..<players.count*3)
        }while maze[i][j].type != .empty || (playersPositions.values.contains(Position(x:i,y:j)))

            self.playersPositions[player.name] = Position(x:i,y:j)
            maze[i][j].state = player.hero.race
        }
    }

    func availableMoves(player: Player) -> [PlayerMove] {

        //get the current position of the player
        let x:Int = playersPositions[player.name]?.x ?? 0
        let y:Int = playersPositions[player.name]?.y ?? 0

        var res = [PlayerMove]()
        if(isValid(x: x-1, y: y)) {
        res.append(StandartPlayerMove(direction: .up))
        }
        if(isValid(x:x+1, y:y)) {
        res.append(StandartPlayerMove(direction: .down))
        }
        if(isValid(x:x, y:y+1)) {
        res.append(StandartPlayerMove(direction: .right))
        }
        if(isValid(x:x, y:y-1)) {
        res.append(StandartPlayerMove(direction: .left))
        }
        return res
    }

    func move(player: Player, move: PlayerMove) {
        
        //get the current position of the player
        let x:Int = playersPositions[player.name]?.x ?? 0
        let y:Int = playersPositions[player.name]?.y ?? 0

        //set the current player position to vacant
        maze[x][y].state = "no player"

        //change the player position on the map
        switch move.direction {
            case .up: playersPositions[player.name] = Position(x:x-1,y:y)
            case .down: playersPositions[player.name] = Position(x:x+1,y:y)
            case .left: playersPositions[player.name] = Position(x:x,y:y-1)
            case .right: playersPositions[player.name] = Position(x:x,y:y+1)
        }

        let xNew:Int = playersPositions[player.name]?.x ?? 0
        let yNew:Int = playersPositions[player.name]?.y ?? 0
        //take action based on the map tile
        takeAction(x:xNew,y:yNew,player:player)
        //set the new player position tile with the hero
        maze[xNew][yNew].state = player.hero.race
        
    }

}

extension MapClass{
    //function to shuffle all the elements of the map
    func shuffleMap<T>(_ map: [[T]]) -> [[T]] {
        var iter = map.joined().shuffled().makeIterator()
        
        return map.map { $0.compactMap { _ in iter.next() }}
    }
}

extension MapClass {
    //checks if a given position is valid
        func isValid(x:Int, y:Int)-> Bool {
        return x>=0 && x<players.count*3 && y>=0 && y<players.count*3
        && maze[x][y].type != .wall
    }
}

extension MapClass {
    func takeAction(x:Int,y:Int, player:Player) {
        var tile = maze[x][y]
        //remove 1 energy
        //player.reduceEnergy(x:1)

        //another player is at the same position as us
        if tile.state != "no player" {
            print("Fight! Your oponent is a/an \(tile.state)")
            //if our player won the battle
            //if initiateBattle(player,tile.state) == player {
                //Our player won    
           // }else {
               //Our player died
          // }       
        }
        if tile.type != .empty  {
            switch tile.type {
                case .chest:
                        print("Congratulations you found a treasure chest! You won 5 energy points")
                        tile.type = .empty
                        //player.addEnergy(x:5)

                case .rock:
                    print("Bummer! A rock is blocking your way. You must use 1 energy to break it.")
                    tile.type = .empty
                    //reduceEnergy(player:player)
                
                case .teleport:
                //teleport to a random exit
                playersPositions[player.name] = teleportsPositions.randomElement()
                
                if let pos = playersPositions[player.name] {
                print("You teleported successfully!")
                print("Your new position is (\(pos.y),\(maze.count - pos.x - 1))")
                //remove the teleport from the player's new position
                maze[pos.x][pos.y].type = .empty
                maze[pos.x][pos.y].state = player.hero.race
                } else {
                    print("Sorry, that teleport is broken at the moment :/")
                }
                
                default: ()
            }
        }
        
    }
}