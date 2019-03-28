import UIKit

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

// материалы из методички
// Перечисления. Простые перечисления
let fio = [
        ("Иванов", "Иван", "Иванович"),
        ("Петров", "Петр", "Петрович"),
        ("Сидоров", "Сидор", "Сидорович"),
        ("Александров", "Александр", "Александрович")
    ]

func printFio(_ fio: [(String, String, String)], mode: Int) {
    for i in fio {
        switch mode {
        case 1:
            print(i.0, i.1, i.2)
        case 2:
            print(i.0, i.1)
        case 3:
            print(i.0)
        default:
            fatalError("Поддерживается только три режима")
        }
    }
}
printFio(fio, mode: 3)

enum PrintFioMode {
    case full
    case midlle
    case short
}
func printFio(_ fio: [(String, String, String)], mode: PrintFioMode) {
    for i in fio {
        switch mode {
        case .full:
            print(i.0, i.1, i.2)
        case .midlle:
            print(i.0, i.1)
        case .short:
            print(i.0)
        }
    }
}
printFio(fio, mode: .midlle)

// Перечисления со значением
enum PrintFioMode2: String {
    case full2 = "Подробный режим"
    case midlle2 = "Обычный режим"
    case short2 = "Сокращенный режим"
}
func printFio(_ fio: [(String, String, String)], mode: PrintFioMode2) {
    print(mode.rawValue, "\n") // получение строкового значения через свойство rawValue
    for i in fio {
        switch mode {
        case .full2:
            print(i.0, i.1, i.2)
        case .midlle2:
            print(i.0, i.1)
        case .short2:
            print(i.0)
        }
    }
}
printFio(fio, mode: .short2)

enum Some: String { // мы указали тип
    case one        // но не указали значение
}
Some.one.rawValue // оно автоматически стало равно имени варианта

//перечислим все планеты солнечной системы
enum Planets: Int {
    case sun = 0 // будем указывать их порядковые номера
    case mercury = 1
    case venus = 2
    case earth = 3
    case mars = 4
    case jupiter = 5
    case saturn = 6
    case uranus = 7
    case neptune = 8
}

//можно иницилизировать новую планету с помощью ее значения
let ourPlanet = Planets(rawValue: 3)
// можно выбрать самим
let redPlanet = Planets.mars
// можно получиь порядковый номер
redPlanet.rawValue

// Связанные значения
func solveQuadratic( a: Double, b: Double, c: Double) -> (Double?, Double?) {
    if (a != 0) {
        let discr: Double = pow(b, 2) - 4*a*c
        if (discr > 0) {
            let sqrOne = (-1) * b/(2 * a) + (sqrt(discr) / (2 * a))
            let sqrTwo = (-1) * b/(2 * a) - (sqrt(discr) / (2 * a))
            return (sqrOne, sqrTwo)
        } else if (discr == 0) {
            let sqrOne = (-1) * b/(2 * a)
            return (sqrOne, nil)
        } else {
            return (nil, nil)
        }
    } else {
        let sqrOne = (-1) * c / b
        return (sqrOne, nil)
    }
}
let result = solveQuadratic(a: 3, b: 9, c: -12)
if let sqr1 = result.0, let sqr2 = result.1 {
    print("Два корня", sqr1, sqr2)
} else if let sqr1 = result.0 {
    print("Один корень", sqr1)
} else {
    print("нет корней")
}

enum solveQuadraticResult {
    case twoSqr(one: Double, two: Double)
    case oneSqr(one: Double)
    case zeroSqr(error: String)
}
func solveQuadratic2( a: Double, b: Double, c: Double) -> solveQuadraticResult {
    if (a != 0) {
        let discr: Double = pow(b, 2) - 4*a*c
        if (discr > 0) {
            let sqrOne = (-1) * b/(2 * a) + (sqrt(discr) / (2 * a))
            let sqrTwo = (-1) * b/(2 * a) - (sqrt(discr) / (2 * a))
            return .twoSqr(one: sqrOne, two: sqrTwo)
        } else if (discr == 0) {
            let sqrOne = (-1) * b/(2 * a)
            return .oneSqr(one: sqrOne)
        } else {
            return .zeroSqr(error: "корней нет")
        }
    } else {
        let sqrOne = (-1) * c / b
        return .oneSqr(one: sqrOne)
    }
}
let result2 = solveQuadratic2(a: 3, b: 9, c: -12)
switch result2 {
case let .twoSqr(one, two):
    print("два корня", one, two)
case let .oneSqr(one):
    print("один корень", one)
case let .zeroSqr(error):
    print(error)
}

//  Структуры
enum HondaDoorState {
    case open, close
}
enum Transmission {
    case manual, auto
}
let car1Color = UIColor.white
let car1Mp3 = true
let car1Transmission = Transmission.auto
var car1Km = 0.0
var car1DoorState = HondaDoorState.open
//let car2Color = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
let car2Color = UIColor.black
let car2Mp3 = false
let car2Transmission = Transmission.auto
var car2Km = 0.0
var car2DoorState = HondaDoorState.open
//let car3Color = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
let car3Color = UIColor.red
let car3Mp3 = true
let car3Transmission = Transmission.manual
var car3Km = 12.0
var car3DoorState = HondaDoorState.open

enum HondaDoorState2 {
    case open, close
}
enum Transmission2 {
    case manual, auto
}
struct Honda {
    let color2: UIColor
    let mp32: Bool
    let transmission2: Transmission2
    var km2: Double
    var doorState2: HondaDoorState2
}
var car1 = Honda(color2: .white, mp32: true, transmission2: .auto, km2: 0.0, doorState2: .close)
var car2 = Honda(color2: .black, mp32: true, transmission2: .manual, km2: 120.0, doorState2: .open)
var car3 = Honda(color2: .red, mp32: false, transmission2: .manual, km2: 0.0, doorState2: .open)
var car4 = Honda(color2: .green, mp32: true, transmission2: .auto, km2: 0.0, doorState2: .close)

car1.color2
car2.color2
car1.km2 = 120
car1.km2


struct Circle {
    var radius: Double
    
    var diametr: Double {
        get {
            return radius * 2
        }
        set {
            radius = newValue / 2
        }
    }
}
var myCircle = Circle(radius: 12)
myCircle.radius
myCircle.diametr

myCircle.radius = 30
myCircle.radius
myCircle.diametr

myCircle.diametr = 30
myCircle.radius
myCircle.diametr


struct Rectangle {
    var sideA: Double
    var sideB: Double
    
    var perimiter: Double {
        get {
            return sideA * 2 + sideB * 2
        }
    }
}
var myRectangle = Rectangle(sideA: 12.0, sideB: 3.0)
myRectangle.sideA
myRectangle.sideB
myRectangle.perimiter

myRectangle.sideB = 30.0
myRectangle.perimiter

myRectangle.sideA = 1.0
myRectangle.perimiter


struct Honda3 {
    let color3: UIColor
    let mp33: Bool
    let transmission3: Transmission2
    var km3: Double {
        didSet { // Блок будет вызван когда значение уже измениться
            let distance = km3 - oldValue // oldValue содержит значение до изменения
            print("Пройден новый участок пути растоянием \(distance)")
        }
    }
    var doorState3: HondaDoorState2 {
        willSet { // блок будет вызван до того как значение измениться
            if newValue == .open {
                print("Двери сейчас откроются")
            } else {
                print("Двери сейчас закроются")
            }
        }
    }
}
var car5 = Honda3(color3: .white, mp33: true, transmission3: .auto, km3: 0.0, doorState3: .close)

car5.doorState3 = .open
car5.doorState3 = .close
car5.km3 = 120.0
car5.km3 = 140.0


// Методы
struct Honda4 {
    let color4: UIColor
    let mp34: Bool
    let transmission4: Transmission2
    var km4: Double
    var doorState4: HondaDoorState2
    
    mutating func closeDoor() {
        self.doorState4 = .close
    }
    mutating func openDoor() {
        self.doorState4 = .open
    }
    func printDistance() {
        print("Автомобиль проехал \(km4)")
    }
}
var car6 = Honda4(color4: .white, mp34: true, transmission4: .auto, km4: 0.0, doorState4: .close)
car6.km4 = 120.0
car6.printDistance()

// Конструкторы
struct Rectangle​2 {
    var sideA3: Double
    var sideB3: Double
    var perimiter: Double {
        get {
            return sideA3 * 2 + sideB3 * 2
        }
    }
    init() { //объявим простой конструктор,создающий прямоугольник со сторонами 5 и 10
        sideA3 = 5
        sideB3 = 10
    }
    init(sideA3: Double, sideB3: Double) {
        self.sideA3 = sideA3
        self.sideB3 = sideB3
    }
}
let rectangle2 = Rectangle​2()
let rectangle3 = Rectangle​2(sideA3: 12, sideB3: 23)

// Уровень доступа
fileprivate struct Rectangle​3 { // эта структура доступна теперь только внутри файла
    private var sideA3: Double // стороны доступны теперь только внутри структуры
    private var sideB3: Double
    var perimiter: Double {
        get {
            return sideA3 * 2 + sideB3 * 2
        }
    }
    init() { //объявим простой конструктор,создающий прямоугольник со сторонами 5 и 10
        sideA3 = 5
        sideB3 = 10
    }
    init?(sideA3: Double, sideB3: Double) {
        guard sideA3 > 0 && sideB3 > 0 else { // проверим, что стороны положительные
            return nil // если они отрицательные, вернем nil
        } // если все нормально, создаем экземпляр структуры
        self.sideA3 = sideA3
        self.sideB3 = sideB3
    }
}
//let rectangle4 = Rectangle​3() 
