public class FightClass : Fight {

    var attacker: Hero
    var host: Hero
    var winner: Hero

    init(attacker:Hero, host:Hero){
        self.attacker = attacker
        self.host = host
        self.winner = host
    }

    
    func start(){
        
        let rand = Int.random(in:0...20)

        if rand % 2 == 0 {
            winner = attacker
        } else {
            winner =  host
        }
        //print("random number is \(rand)")
    }

}

