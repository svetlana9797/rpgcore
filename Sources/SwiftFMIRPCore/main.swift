
var mapGenerator = MapGeneration()//var mapGenerator = DefaultMapGenerator()

var playerGenerator = PlayerGeneratorClass(heroGenerator: HeroGeneratorClass())
var figthGenerator = DefaultFightGenerator()
var equipmentGenerator = DefaultEquipmentGenerator()
var mapRendered = MapRendererClass()//var mapRendered = DefaultMapRenderer()

var game = Game(mapGenerator: mapGenerator, playerGenerator: playerGenerator, mapRenderer: mapRendered)

game.run()

/*
var playerGenerator = DefaultPlayerGenerator(heroGenerator: DefaultHeroGenerator())
let p = [playerGenerator.generatePlayer(name:"one"),playerGenerator.generatePlayer(name:"two")]

let m = MapClass(players:p)//MapGeneration().generate(players: p)

//print(m.playersPositions)

var mapRendered = MapRendererClass() //DefaultMapRenderer()
mapRendered.renderMap(map: m)
let moves = m.availableMoves(player: p[0])
let move = moves.randomElement()!
print("player \(p[0].name) moves to move = \(move.friendlyCommandName)")

m.move(player: p[0], move: move)
mapRendered.renderMap(map: m)


if let race = HeroRace.allCases.randomElement() {
    var h = HeroClass(race:race.rawValue)
    print(h.race)
    }else {
    print ("Error while generating hero!")
}
*/

