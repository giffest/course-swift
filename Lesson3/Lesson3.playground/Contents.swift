import Foundation

var russuainCurrency: String = " Rouble"
var euroCurrency: String = "Dollar"
var dollarCeurrency: String = "Euro"

print(russuainCurrency)

var currency: [String] = ["Rouble", "Dollar", "Euro"]

print(currency[2])

enum currency_enum {
    case Rouble
    case Euro
    case Dollar
}

print(currency_enum.Dollar)
var rouble: currency_enum = .Rouble

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Int)
    case Stop
    case Turn(direction:Direction)
    
    enum Direction: String {
        case Left = "Left"
        case Right = "Right"
    }
}

var action = Action.Run(meters: 100, speed: 5)
//action = .Stop
//action = .Walk(meters: 210)
action = .Turn(direction: .Left)

switch action {
case .Stop:
    print("Остановиться")
case .Walk(let meters) where meters < 100:
    print("Прогулка \(meters)")
case .Walk:
    print("Длинная прогулка")
case .Run(let meters, let speed):
    print("Пробежали \(meters) метров со скоростью \(speed) метров")
case .Turn(let direction) where direction == .Left:
    //print("Повернули налево")
    print(Action.Direction.Left.rawValue)
    
default:
    break
}


struct playerChess {
    //let name: String
    var name: String
    var wins: Int
    
    func description() {
        print("Игрок \(name) выиграл \(wins) игр")
    }
    
    mutating func addWins(countOfWins: Int) {
        self.wins += countOfWins
    }
    
    init(namePlayer: String, winsPlayer: Int) {
        self.name = namePlayer
        self.wins = winsPlayer
    }
    
}

var oleg = playerChess(namePlayer: "Oleg", winsPlayer: 4)

var maks = playerChess(namePlayer: "Maksim", winsPlayer: 5)

print(oleg)

if maks.wins > oleg.wins {
    print("Максим играет лучше")
} else {
    print("Олег играет лучше")
}

maks.description()

maks.addWins(countOfWins: 4)
maks.description()

var evgeniy = playerChess(namePlayer: "Евгений", winsPlayer: 8)

evgeniy.name = "Женя"

evgeniy.description()
