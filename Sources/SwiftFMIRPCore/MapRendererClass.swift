
public class MapRendererClass : MapRenderer {
    func renderMap(map:MapClass) {
        render(map:map)
        //renderPlayers(map:map)
        print("\nCurrent player's positions:")
        map.playersPositions.forEach { print("\($0): \($1)") }
        
    }
/*
    func renderPlayers(map:MapClass) {
        for player in map.players {
            let x: Int = map.playersPositions[player.name]?.x ?? 0
            let y: Int = map.playersPositions[player.name]?.y ?? 0
            switch player.hero.race {
                case "elf": map.maze[x][y] = "🧚"
                case "wizard": map.maze[x][y] = "🧙"
                case "dragon": map.maze[x][y] = "🐉‍"
                case "ghost": map.maze[x][y] = "👻"
                default: map.maze[x][y] = "🤖"
                //"🤖","🧚","🧙","🐉‍","👻"
            }
            //map.maze[x][y]
        }
    }
    */

    func render(map: Map) {
        for row in map.maze {
            self.renderMapRow(row: row)
        }

        renderMapLegend()
        
    }
    
    private func renderMapRow(row: [MapTile]) {
        var r = ""
        for tile in row {
            switch tile.type {
            case .chest:
                r += "📦"
            case .rock:
                r += "🗿"
            case .teleport:
                r += "💿"
            case .empty: 
                r += "  "
            case .wall:
                r += "🧱"
            default:
                //empty
                r += " "
            }
        }

        print("\(r)")
    }
    
    private func renderMapLegend() {
        print("\nMap legend:")
        print("📦 - Treasure chest (can contain life points, armor or weapons)")
        print("🗿 - Rock (must be broken in order to move to this field)")
        print("💿 - Teleport (transfers the player to a random exit)")
        print("🧱 - Wall (player cannot move to this field)")
        print("🤖, 🧚, 🧙, 🐉,👻‍ - possible Players")
    }
}
