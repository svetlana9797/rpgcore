extension Player {
    mutating func reduceEnergy(x:Int) {
        hero.energy -= x
    }
    mutating func addEnergy(x:Int) {
        hero.energy += x
    }
}

extension Player {
    func introduce() {
        print("Name: \(name)")
        hero.introduce()
    }
}

protocol PlayerGenerator {
    init(heroGenerator: HeroGenerator)
    func generatePlayer(name: String) -> Player
}

public class PlayerGeneratorClass: PlayerGenerator {
    var heroGenerator: HeroGenerator
    required init(heroGenerator: HeroGenerator) {
        self.heroGenerator = heroGenerator
    }
    
    func generatePlayer(name: String) -> Player {
        var player = DefaultPlayer()
        player.name = name
        player.hero = heroGenerator.getRandom()
        return player
    }
}

public class PlayerClass : Player {
    var name: String
    var hero: Hero
    var isAlive: Bool = true

    required init(name:String){
        self.name = name
        let race = HeroRace.allCases.randomElement()!.rawValue 
        self.hero = HeroClass(race:race)
    }

}

