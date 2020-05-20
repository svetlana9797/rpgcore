func readLine<T: LosslessStringConvertible>(as type: T.Type) -> T? {
  return readLine().flatMap(type.init(_:))
}

class Game {
    var mapGenerator: MapGenerator
    var playerGenerator: PlayerGenerator

    init(mapGenerator: MapGenerator, playerGenerator: PlayerGenerator) {
        self.mapGenerator = mapGenerator
        self.playerGenerator = playerGenerator
    }
    
    //implement main logic
    func run() {
        print("Starting the RPG game...")
        var players:[Player] = []
        var totalPlayers = 0
        repeat {
            print("Моля избере брои играчи (2 - 4): ")
            if let number = readLine(as: Int.self) {
                totalPlayers = number
            } else {
              print("Невалиден вход! Моля, опитай пак.")  
            }
        } while totalPlayers < 2 || totalPlayers > 4

        // 1. Избор на брой играчи. Минимум 2 броя.
        
       print("Вие избрахте \(totalPlayers) играчи. Системата сега ще избере вашите герои.")
       for i in 1...totalPlayers {
           print("Генериране на играч...")
           players.append(playerGenerator.generatePlayer(name: "Player #\(i)"))
       }
       
       
       

        let map = mapGenerator.generate(players: players)
        // 1. Избор на брой играчи. Минимум 2 броя.
        // 1. Генериране на карта с определени брой размери на базата на броя играчи.
        // 1. Докато има повече от един оцелял играч, изпълнявай ходове.
        //     * определи енергията за текущия играч
        //     * Текущия играч се мести по картата докато има енергия. 
        //     * Потребителя контролира това като му се предоставя възможност за действие.
        //     * ако се въведе системна команда като `map` се визуализра картата
        // 1. Следващия играч става текущ.

        print("RPG game has finished.")
        
    }
}