import UIKit

class Automobile{}

var bmw: Automobile
//

struct Resolution {
    var width = 0
    var height = 0
}

let hd = Resolution(width: 1920, height: 1080)

var cinema = hd

cinema.width = 2048

cinema.width
hd.width
//

class VideoMode {
    var frameRate = 0.0
    var name: String?
}

let tenEighty = VideoMode()

tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoFrameRate = tenEighty

alsoFrameRate.frameRate = 30.0
tenEighty.frameRate
//

class Chessman {
    
    // перечисления для класса, для сокращения памяти внутри класса, т.е. если класс не вызван то перечисления не занимают память
    enum chessmanType {
        case king
        case queen
        case castle
        case khight
    }
    
    enum chessmanColor {
        case white
        case black
    }
    
    let type: chessmanType
    let color: chessmanColor
    
    var coordinate: (String, Int)? = nil
    
    // инициализатор с двумя свойствами
    init(type: chessmanType, color: chessmanColor) {
        self.color = color
        self.type = type
    }
    
    // инициализатор с тремя свойствами
    init(type: chessmanType, color: chessmanColor, coordinate: (String, Int)) {
        self.type = type
        self.color = color
        self.setCoordinate(char: coordinate.0, num: coordinate.1)
    }
    
    // метод класса
    // если добавить final то это будет означать что нельзя переопределить метод в дочернем классе, final так же сокращает время выполнения операции
    func setCoordinate(char c: String, num n: Int) {
        self.coordinate = (c, n)
    }
    
    // метод класса
    func kill() {
        self.coordinate = nil
    }
    
}

var King = Chessman(type: .king, color: .black)

King.setCoordinate(char: "E", num: 5)

var queen = Chessman(type: .queen, color: .white, coordinate: ("D", 8))

var link = Chessman.chessmanColor.black //пример для вызова типа из класса

// Наследование (дочерний класс)
class someSumClass: Chessman {
    // метод нового класса
    func printChessmanType() {
        print(self.type)
    }
    
    // override для переопредления метода(func) в основном классе
    override func setCoordinate(char c: String, num n: Int) {
        self.coordinate = (c, n*2)
        print(self.coordinate!)
    }
    
}

var knight = someSumClass(type: .khight, color: .white)

knight.printChessmanType()

knight.setCoordinate(char: "E", num: 5)
//

// Деиницилизация
class superClass {
    init?(isNil: Bool) {
        if isNil == true {
            return nil
        } else {
            print("Экземпляр создан")
        }
    }
    
    deinit {
        print("Класс деиницилизирован")
    }
}

class subClass: superClass {
    deinit {
        print("Подкласс деиницилизирован")
    }
}

var object = subClass(isNil: false)

object = nil

// Arc - пример работы:
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) иницилизация")
    }
    
    deinit {
        print("\(name) деиницилизация")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "Антов Алексей")

reference2 = reference1
reference3 = reference1

reference1 = nil
reference3 = nil
reference2 = nil

// утечка памяти
// в файле Command Tools Line
