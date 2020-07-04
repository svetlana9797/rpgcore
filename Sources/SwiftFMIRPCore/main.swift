/*var mapGenerator = DefaultMapGenerator()
var playerGenerator = DefaultPlayerGenerator(heroGenerator: DefaultHeroGenerator())
var figthGenerator = DefaultFightGenerator()
var equipmentGenerator = DefaultEquipmentGenerator()
var mapRendered = DefaultMapRenderer()
var game = Game(mapGenerator: mapGenerator, playerGenerator: playerGenerator, mapRenderer: mapRendered)

game.run()
*/

/*
var t = TileClass(type:.empty)
t.state = "blah"
var p = TeleportTileClass(position:Position(x:0,y:0))
var t1 = TeleportTileClass(position: Position(x:1,y:2))
print("first tile is of state \(t.state)")
*/

/*
var a=[[1,2],[3,4],[5,6]]
var res = shuffleMap(a)
print(a)
//arr.shuffle()
print(res)
*/

let m = MapGeneration().generate(players: [])

var mapRendered = DefaultMapRenderer()
mapRendered.render(map: m)