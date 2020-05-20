var mapGenerator = DefaultMapGenerator()
var playerGenerator = DefaultPlayerGenerator(heroGenerator: DefaultHeroGenerator())
var game = Game(mapGenerator: mapGenerator, playerGenerator: playerGenerator)

game.run()
