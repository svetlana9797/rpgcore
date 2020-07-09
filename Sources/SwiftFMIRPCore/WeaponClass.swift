
public class WeaponClass : Weapon {
    var name:String
    var attack: Int
    var defence: Int

    public init(name:String, attack:Int, defence:Int){
        self.name = name
        self.attack = attack
        self.defence = defence
        
    }
}

public class ArmorClass : Armor {
    var name:String
    var attack:Int
    var defence:Int

    public init(name:String,attack:Int,defence:Int) {
        self.name = name
        self.attack = attack
        self.defence = defence
    }
}

public class EquipmentGeneratorClass : EquipmentGenerator {
    var allArmors: [Armor]
    
    var allWeapons: [Weapon]
    
    init() {
        allArmors = [NoArmor()]
        allWeapons = [WoodenStick()]
    }
}