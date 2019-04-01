import UIKit
import Foundation

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


// из материлов методички
// КЛАССЫ
// Ссылочный тип
enum HondaDoorState {
    case open, close
}
enum Transmission{
    case manual, auto
}
enum HondaHatchState {
    case open, close
}

struct Honda {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
}

var car1 = Honda(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car2 =  Honda(color: .white, mp3: false, transmission: .auto, km: 120.0, doorState: .close)
print(car1.km, ", ", car2.km) //0.0, 120.0
car2 = car1
print(car1.km, ", ", car2.km) //0.0,0.0
car1.km = 500.0
print(car1.km, ", ", car2.km) //500.0, 0.0

class Honda2 {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    }
}
var car_1 = Honda2(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car_2 =  Honda2(color: .white, mp3: false, transmission: .auto, km: 120.0, doorState: .close)
print(car_1.km, ", ", car_2.km) //0.0, 120.0
car_2 = car_1
print(car_1.km, ", ", car_2.km) //0.0,0.0
car_1.km = 500.0
print(car_1.km, ", ", car_2.km) //500.0, 0.0

// Свойства и методы класса
class Honda3 {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    // ключевое слово static указывает на то, что это свойство класса
    static var carCount = 0
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    // в конструкторе будем увеличивать переменную на 1
        Honda3.carCount += 1
    }
    static func countInfo() {
        print("Выпущен \(self.carCount) автомобилей")
    }
}
let car1_1 = Honda3(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
let car2_1 =  Honda3(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
let car3_1 =  Honda3(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
// обратимся к имени класса для доступа к свойству
print(Honda3.carCount) // 3
Honda3.countInfo() // ​Выпущено 3 автомобилей

// Вспомогательные конструкторы
class Rectangle {
    var sideA: Double // обязательные переменные
    var sideB: Double
    init(sideA: Double, sideB: Double) { // обязательный конструктор
        self.sideA = sideA
        self.sideB = sideB
    }
    convenience init(side: Double) { // вспомогательный конструктор
        self.init(sideA: side, sideB: side)
    }
}
let ugol = Rectangle(side: 11)
let ugol2 = Rectangle(sideA: 11, sideB: 22)

// Наследование
class HondaSport {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    var hatchState: HondaHatchState // состояние люка
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState, hatchState: HondaHatchState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
        self.hatchState = hatchState
    }
    // нам надо открывать люк
    func openHatch() {
        hatchState = .open
    }
    // и закрывать
    func closeHatch() {
        hatchState = .close
    }
}
let car1_2 = Honda3(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
let car2_2 =  HondaSport(color: .red, mp3: true, transmission: .manual, km: 0.0, doorState: .close, hatchState: .close)

class Honda4 {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
    }
}
class HondaSport2: Honda4 {
    // наследуем HondaSport от Honda
    // мы ничего не пишем здесь
    // и наш новый класс имеет все те же свойства и методы, что и его родитель
}
let car1_3 = Honda4(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
let car2_3 =  HondaSport2(color: .red, mp3: true, transmission: .manual, km: 0.0, doorState: .close)

class HondaSport3: Honda4 {
    var hatchState: HondaHatchState // Новое свойство
    // Перечисляем все свойства
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState, hatchState: HondaHatchState) {
        self.hatchState = hatchState // инициализируемновоесвойство
        // используем конструктор из родителя, чтобы завершить инициализацию класса
        super.init(color: color, mp3: mp3, transmission: transmission, km: km, doorState: doorState)
    }
    func openHatch() { // новый метод
        hatchState = .open
    }
    func closeHatch() { // новый метод
        hatchState = .close
    }
}
let car1_4 = Honda4(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
let car2_4 =  HondaSport3(color: .red, mp3: true, transmission: .manual, km: 0.0, doorState: .close, hatchState: .close)

final class DecorativeHondaSport: HondaSport3 {
    // переопределить метод открытия люка
    override func openHatch() {
        //super.openHatch() // вызываем реализацию родителя
        print("Пииип, открывать люк запрещено") // произносим уведомление
    }
}

// Деинициализация
class Honda5 {
    let color: UIColor
    let mp3: Bool
    let transmission: Transmission
    var km: Double
    var doorState: HondaDoorState
    // ключевое слово static указывает на то, что это свойство класса
    static var carCount = 0
    
    init(color: UIColor, mp3: Bool, transmission: Transmission, km: Double, doorState: HondaDoorState) {
        self.color = color
        self.mp3 = mp3
        self.transmission = transmission
        self.km = km
        self.doorState = doorState
        // в конструкторе будем увеличивать переменную на 1
        Honda5.carCount += 1
    }
    deinit { // в деструкторе уменьшим количество машин
        Honda5.carCount -= 1
    }
    static func countInfo() {
        print("Выпущен \(self.carCount) автомобилей")
    }
}
let car1_5 = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car2_5: Honda5? = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
print(Honda5.carCount) // 2
car2_5 = nil
print(Honda5.carCount) // 1
car2_5 = nil

// ARC и управление памятью
// Счетчик ссылок
// car1_5 определен выше
var car2_5_ = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car3_5_ = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car4_5_ = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
var car5_5_ = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
Honda5.carCount // существует 5 машин
// присвоим каждой переменной значение car1_5
car2_5_ = car1_5
car3_5_ = car1_5
car4_5_ = car1_5
car5_5_ = car1_5
// теперь на первый автомобиль указывает 5 переменных
// на оставшиеся 4 автомобиля не указывает ни одна переменная.
Honda5.carCount // существует 1 машина

// создадим 1 объект
// car1_6 опередене в car1_5, код ниже закоментирован
//let car1_6 = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
let x = 10
// объявим if. Как вы помните, он создает новую область видимости
if x == 10 {
    // внутри if создадим еще 4 объекта
    var car2_6 = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
    var car3_6 = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
    var car4_6 = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
    var car5_6 = Honda5(color: .white, mp3: true, transmission: .auto, km: 0.0, doorState: .close)
    Honda5.carCount // существует 5 машин
}
Honda5.carCount // существует 1 машина

// Циклы удержания и слабые ссылки
class Car {
    // помечаем переменную ключевым словом weak
    weak var driver: Man?
    deinit {
        print("машина удалена из памяти")
    }
}
class Man {
    var myCar: Car?
    deinit {
        print("мужчина удален из памяти")
    }
}
// Объявим переменные как опциональные, чтобы иметь возможность присвоить им nil
var car: Car? = Car()
var man: Man? = Man()
// машина теперь имеет ссылку на мужчину
car?.driver = man
// а мужчина на машину
man?.myCar = car
// присвоим nil переменным, удалим эти ссылки
car = nil
// руками очистим ссылку на машину у водителя
//man?.myCar = nil
man = nil
// мы больше не можем никак обратиться к нашим объектам, но они продолжают существовать в памяти


// пример для констант
class Man2 {
    var myPassort: Passport?
    deinit {
        print("мужчина удален из памяти")
    }
}
class Passport {
    unowned let man: Man2
    init(man: Man2) {
        self.man = man
    }
    deinit {
        print("паспорт удален из памяти")
    }
}
var man2: Man2? = Man2()
var passport: Passport? = Passport(man: man2!)
passport = nil // объект еще не удален, его удерживает мужчина
man = nil //теперь удалены оба объекта

    
