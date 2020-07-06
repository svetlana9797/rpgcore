
public class TileClass: MapTile {
    var type: MapTileType
    var state: String

    init(type: MapTileType) {
        self.type = type
        state = "no player"
    }
}

public class TeleportTileClass:TileClass {
    var used: Bool

 init(){
        self.used = false
        super.init(type:.teleport) //call the base class initializer
    }

}