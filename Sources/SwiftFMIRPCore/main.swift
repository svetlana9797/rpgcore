/*var mapGenerator = DefaultMapGenerator()
var playerGenerator = DefaultPlayerGenerator(heroGenerator: DefaultHeroGenerator())
var figthGenerator = DefaultFightGenerator()
var equipmentGenerator = DefaultEquipmentGenerator()
var mapRendered = DefaultMapRenderer()
var game = Game(mapGenerator: mapGenerator, playerGenerator: playerGenerator, mapRenderer: mapRendered)

game.run()
*/

var t = TileClass(type: .empty)
t.state = "blah"
var t1 = TeleportTileClass(position: Position(x:1,y:2))
print("first tile is of state \(t.state)")