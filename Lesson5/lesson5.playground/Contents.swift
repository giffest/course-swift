import UIKit

protocol FullyNamed {
    // определение протокола
    var fullName: String {get}
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "Джон Сноу")

john.fullName

class Straship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
    
}

var ncc1701 = Straship(name: "Enterprise", prefix: "USS")

ncc1701.fullName

protocol randomNumberGenerator {
    func ranod() -> Double
}

class linearRandom: randomNumberGenerator {
    var lastRandom = 42.0
    let m = 14893.0
    let a = 3891.0
    let c = 28903.0
    
    func ranod() -> Double {
        lastRandom = (lastRandom * a + c)
        
        return lastRandom/m
    }
}

let generator = linearRandom()
print(generator.ranod())

print(generator.ranod())

protocol Toggeable {
    mutating func toggle()
}

enum onOffSwitch: Toggeable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var lightSwitch = onOffSwitch.off
lightSwitch.toggle()

protocol someAnotherProtocol {
    init(someParameter: Int)
}

class someAnotherClass: someAnotherProtocol {
    required init(someParameter: Int) {
        //реализация
    }
}

/*
//class someSubClass: someAnotherProtocol, someAnotherProtocol {
    required override init(someParameter: Int) {
        //ff
//    }
//}
*/

// Расширения
extension randomNumberGenerator {
    func randomBool() -> Bool {
        return ranod() > 0.5
    }
}

let g = linearRandom()
print(g.ranod())

print(g.randomBool())

extension Double {
    var km: Double {return self * 1_000.0}
    var m: Double {return self}
    var cm: Double {return self / 100.0}
    var mm: Double {return self / 1_000.0}
}

let b = 25.5.cm

let c = 79.8.km

let marathon = 42.km + 192.m
print(marathon)


// Полиморфизм
protocol Figure {
    func drawFigure()
}

class Rectangle: Figure {
    func drawFigure() {
        print("Рисуем прямогольник")
    }
}

class Triangle: Figure {
    func drawFigure() {
        print("Рисуем треугольник")
    }
}

class Ellipse: Figure {
    func drawFigure() {
        print("Рисуем круг")
    }
}

func draw(_ figure: Figure) {
    figure.drawFigure()
}

draw(Rectangle())

draw(Ellipse())

// Композиция
protocol named {
    var name: String{get}
}


protocol Aged {
    var age: Int{get}
}

struct PersonProtocol: named, Aged {
    var name: String
    var age: Int
}

func happyBithday(to celebration: named & Aged) {
    print("С Днем Рождения, \(celebration.name)! Тебе уже \(celebration.age)")
}

let bp = PersonProtocol(name: "Сашка", age: 34)

happyBithday(to: bp)
