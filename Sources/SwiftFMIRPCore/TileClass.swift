//import SwiftFMIRPCore
public class TileClass: MapTile {
    var type: MapTileType
    var state: String

    init(type: MapTileType) {
        self.type = type
        state = "no player"
    }
}