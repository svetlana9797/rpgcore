enum HeroRace : String, CaseIterable {
    case elf = "elf"
    case wizard = "wizard"
    case dragon = "dragon"
    case ghost = "ghost"
    }

extension Hero {
    func introduce() {
        print("Race: \(race)")
        print("Weapon: attack \(weapon!.attack), defence \(weapon!.defence)")
        print("Armor: attack \(armor!.attack), defence \(armor!.defence)")
    }
}

public class HeroClass: Hero {
   var race: String

    var energy: Int = 5
    var lifePoitns: Int = 7

    var weapon: Weapon?  = nil
    var armor: Armor? = nil

   public init(race:String) {
       self.race = race
        getDefaultWeapon()
        getDefaultArmor()
        }
    

    public func getDefaultWeapon() {
        switch race {
            case "elf": self.weapon = WeaponClass(name:"bow&arrow", attack:3, defence:1)
            case "wizard": self.weapon = WeaponClass(name:"wand", attack:4, defence:3)
            case "dragon": self.weapon = WeaponClass(name:"diamond claws", attack:5, defence:2)
            case "ghost": self.weapon = WeaponClass(name:"enchanted orbs", attack:4, defence:3)
            default: self.weapon = WeaponClass(name:"no weapon", attack: 0, defence:0)
        }
    }

    public func getDefaultArmor() {
        switch race {
            case "elf": self.armor = ArmorClass(name:"helmet", attack:3, defence:1)
            case "wizard": self.armor = ArmorClass(name:"invisible coat", attack:4, defence:3)
            case "dragon": self.armor = ArmorClass(name:"scales", attack:5, defence:2)
            case "ghost": self.armor = ArmorClass(name:"energy shield", attack:4, defence:3)
            default: self.armor = ArmorClass(name:"no armor", attack: 0, defence:0)
        }
    }

}

public class HeroGeneratorClass: HeroGenerator {

    func getRandom() -> Hero {
        let race = HeroRace.allCases.randomElement()! 
            return HeroClass(race:race.rawValue)
    }
}
