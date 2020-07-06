
public class MapRendererClass : MapRenderer {
    func renderMap(map:MapClass) {
        render(map:map)
        print("\nCurrent player's positions:")
        for player in map.playersPositions.keys {
            print("\(player) -> (x:\(map.playersPositions[player]!.y),y:\(map.maze.count - map.playersPositions[player]!.x - 1))")
        }
        //map.playersPositions.forEach { print("\($0): \($1)") }
        
    } 

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
                switch tile.state {
                case "elf": r += "🧚"
                case "wizard": r += "🧙"
                case "dragon": r += "🐉‍"
                case "ghost": r += "👻"
                default: r += "  "
            }
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
        print("🧚, 🧙, 🐉, 👻‍ - possible Players")
    }
}
