/*var mapGenerator = MapGeneration()//var mapGenerator = DefaultMapGenerator()

var playerGenerator = DefaultPlayerGenerator(heroGenerator: DefaultHeroGenerator())
var figthGenerator = DefaultFightGenerator()
var equipmentGenerator = DefaultEquipmentGenerator()
var mapRendered = MapRendererClass()//var mapRendered = DefaultMapRenderer()

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

var playerGenerator = DefaultPlayerGenerator(heroGenerator: DefaultHeroGenerator())
let p = [playerGenerator.generatePlayer(name:"one"),playerGenerator.generatePlayer(name:"two")]
//print(p[0].name)
let m = MapClass(players:p)//MapGeneration().generate(players: p)

print(m.playersPositions)

var mapRendered = MapRendererClass() //DefaultMapRenderer()
mapRendered.renderMap(map: m)
m.move(player: p[0], move: StandartPlayerMove(direction:.up))
mapRendered.renderMap(map: m)
