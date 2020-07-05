
public class MapRendererClass : MapRenderer {
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
        //put players on their places on the map
        //"🤖","🧚","🧙","🐉‍"

        print("\(r)")
    }
    
    private func renderMapLegend() {
        print("\nMap legend:")
        print("📦 - Treasure chest (can contain life points, armor or weapons)")
        print("🗿 - Rock (must be broken in order to move to this field)")
        print("💿 - Teleport (transfers the player to a random exit)")
        print("🧱 - Wall (player cannot move to this field)")
        print("🤖, 🧚, 🧙, 🐉‍ - possible Players")
    }
}
