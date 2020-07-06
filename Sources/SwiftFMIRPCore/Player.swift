protocol Player {
    var name: String {get set}
    var hero: Hero {get set}
    var isAlive: Bool {get set}
}

extension Player {
    mutating func reduceEnergy() {
        hero.energy -= 1
    }
    mutating func addEnergy(x:Int) {
        hero.energy += x
    }
}
protocol PlayerGenerator {
    init(heroGenerator: HeroGenerator)
    func generatePlayer(name: String) -> Player
}
