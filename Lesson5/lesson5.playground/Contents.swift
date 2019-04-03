import UIKit
import Foundation

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

// Материалы методички
// Протокол
class Figure2 {                                // базовый класс
    func calculatePerimiter() -> Double {    // расчет периметра
        return 0
    }
}
class Rectangle2: Figure2 {
    var sideA: Double
    var sideB: Double
    override func calculatePerimiter() -> Double {
        return  (2.0 * (sideA + sideB))
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
class Circle: Figure2 {
    var radius: Double
    override func calculatePerimiter() -> Double {
        return 2.0 * M_PI * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}
var figures: [Figure2] = [              // Можно создать массив базового класса
    Rectangle2(sideA: 10.0, sideB: 12.0),  // и добавлять туда наследников
    Circle(radius: 18)                   // разных наследников
]
for figure in figures {
    // считаем периметр и выводим в консоль
    let perimiter = figure.calculatePerimiter()
    print(perimiter)
}
//
protocol Figure3 {                            // Протокол
    func calculatePerimeter() -> Double     // просто описание метода
}
class Rectangle3: Figure3 {                  // имплементируем протокол
    var sideA: Double
    var sideB: Double
    func calculatePerimeter() -> Double { // реализуем свойство, override не нужен
        return 2.0 * (sideA + sideB)
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
class Circle3: Figure3 {
    var radius: Double
    
    func calculatePerimeter() -> Double {
        return 2.0 * M_PI * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}
var figures3: [Figure3] = [               // Можно создать массив типа протокола
    Rectangle3(sideA: 10.0, sideB: 12.0),// и добавлять туда классы, имплементирующие протокол
    Circle3(radius: 18)
]
for figure3 in figures3 {
    // считаем периметр и выводим в консоль
    let perimeter3 = figure3.calculatePerimeter()
    print(perimeter3)
}
//
protocol PerimterCalculatable {           // Протокол
    func calculatePerimiter() -> Double  // просто описание метода
}
class House: PerimterCalculatable {     // у дома можно посчитать периметр
    var sideA: Double?
    var sideB: Double?
    func calculatePerimiter() -> Double {
        return 2.0 * (sideA! + sideB!)
    }
}
class Circle4: PerimterCalculatable {   // у круга можно посчитать периметр
    var radius: Double!
    
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
}

// Расширения
/*
extension Circle3 {                    // используем ключевое слово extension
    func diameter() -> Double {     // и можем добавлять новые методы
        return radius * 2.0
    }
//}
let circle5 = Circle3(radius: 12)
circle5.diameter()                  // 24
*/
//
extension Circle3 {             // используем ключевое слово extension
    var diameter: Double {   // теперь периметр – вычисляемое свойство
        return radius * 2.0
    }
}
let circle6 = Circle3(radius: 12)
circle6.diameter             // 24
//
/*
extension String {
    func oddChars() -> String {
        var oddChars: [Character] = []
        for char in self.characters.enumerated() {
            if char.offset % 2 == 0 {
                oddChars.append(char.element)
            }
        }
        return String(oddChars)
    }
//}
let newString = "qwertyy".oddChars()
print(newString) // qety
*/
class Circle7 {
    var radius: Double!
}
extension Circle7: PerimterCalculatable {   // теперь вся информация о имплементации протокола сгруппирована в одном месте
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
}

//
protocol ConsolePrintable: CustomStringConvertible{ // наш протокол наследует другой протокол
    func printDescription()
}

extension ConsolePrintable{                        // расширяем протокол
    func printDescription() {                     // реализуем метод для вывода в консоль поля description
        print(description)                       // само поле description определено в CustomStringConvertible
    }
}
class Circle8: PerimterCalculatable, ConsolePrintable {
    var radius: Double
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
    // так как протокол унаследован от CustomStringConvertible, мы должны реализовать и его требования
    var description: String {
        return String(describing: radius)
    }
}
let circle8 = Circle8(radius: 30)
circle8.printDescription()                                                          // выведет в консоль 30

// Полиморфизм
class Hand{
    let redPen = RedPen()
    let bluePen = BluePen()
    let pencil = Pencil()
    let marker = Marker()
    let pen = Pen()
}
class RedPen {
    func writeText(_ text: String) {
        print("Пишем красной пастой: \(text)")
    }
}
class BluePen {
    func writeText(_ text: String) {
        print("Пишем синей пастой: \(text)")
    }
}
class Pencil {
    func writeText(_ text: String) {
        print("Пишем грифелем: \(text)")
        print("При этом слышим скрип")
    }
}
class Marker {
    func writeText(_ text: String) {
        print("Пишем фломастером : ~~\(text)~~")
        print("При этом пахнет спиртом")
    }
}
class Pen {
    func writeText(_ text: String) {
        print("Пишем пером : ~~\(text)~~", "Остаются кляксы")
    }
}
let hand = Hand()
hand.bluePen.writeText("Текст")
hand.redPen.writeText("Текст")
hand.pencil.writeText("Текст")
hand.marker.writeText("Текст")
hand.pen.writeText("Текст")
//
protocol LetterBelonging{                    // объявляем протокол принадлежности для письма
    func writeText(_ text: String)
}
class Hand2{
    var letterBelonging:LetterBelonging?   // объявляем свойство руки держать принадлежность
    func write(_ text: String) {          // говорим руке писать
        letterBelonging?.writeText(text) // и она уже пишет принадлежностью
    }
}
class RedPen2: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем красной пастой: \(text)")
    }
}
class BluePen2: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем синей пастой: \(text)")
    }
}
class Pencil2: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем грифелем: \(text)")
        print("При этом слышим скрип")
    }
}
class Marker2: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем фломастером : ~~\(text)~~")
        print("При этом пахнет спиртом")
    }
}
class Pen2: LetterBelonging {
    func writeText(_ text: String) {
        print("Пишем пером : ~~\(text)~~", "Остаются кляксы")
    }
}
let hand2 = Hand2()
hand2.letterBelonging = RedPen2()
hand2.write("Привет")
hand2.letterBelonging = BluePen2()
hand2.write("Мир")
hand2.letterBelonging = Pencil2()
hand2.write("Я написал")
hand2.letterBelonging = Marker2()
hand2.write("первую программу")
hand2.letterBelonging = Pen2()
hand2.write("с полиморфизмом!")

// Композиция
class Base {
    var health = 0
}
/*
class Tower {
    func shoot() {
    }
//}
class Enemy  {
    func move() {
    }
//}
class ShootEnemy: Tower {            // если мы наследуемся от башни
    func move() {                   // надо скопировать метод move от врага
    }
//}
*/
class ShootEnemy {
    func move() {
    }
    func shoot() {
    }
}
class Tower: ShootEnemy { // теперь наша башня умеет двигаться
}
class Enemy: ShootEnemy {// а наш обычный враг стрелять
}
//
protocol Healthable {                    // Протокол, добавляющий жизни
    var health: Int { get set }
}
protocol Movable {                      // Протокол передвижения
    func move()
}
extension Movable {                    // Реализация передвижения по умолчанию
    func move(){}
}
protocol Shootable2 {                  // Протокол стрельбы
    func shoot()
}
extension Shootable2{                 // Реализация стрельбы по умолчанию
    func shoot() {}
}
class Base2: Healthable {            // База теперь имеет жизни
    var health = 0
}
class Tower2: Shootable2 {           // Башня может стрелять
}
class Enemy2: Movable {             // Враг — двигаться
}
class ShootEnemy2: Shootable2, Movable { // Стреляющий враг может стрелять и двигаться
}

// Стандартные протоколы
// «CustomStringConvertible» – определяет, как ваш класс выводится командой «print»
// «Comparable» – определяет правила сравнения для вашего объекта
// «Hashable» – правила хэширования объекта. После его имплементации объект может помещаться в «set» и использоваться в качестве ключа в словаре
class Rectangle4 {
    var sideA: Double
    var sideB: Double
    func calculatePerimiter() -> Double {
        return sideA * 2 + sideB * 2
    }
    var square: Double {
        return sideA * sideB
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
extension Rectangle4: CustomStringConvertible{  // имплементируем протокол для вывода в консоль
    var description: String{
        return "sideA: \(sideA), sideB: \(sideB)"    // определяем, что именно будет выводиться
    }
}
extension Rectangle4: Comparable {     // имплементируем протокол для сравнения
    // в рамках протокола перегружаем оператор сравнения для нашего прямоугольника
    static func <(lhs: Rectangle4, rhs: Rectangle4) -> Bool{
        return lhs.square < rhs.square
    }
    static func <=(lhs: Rectangle4, rhs: Rectangle4) -> Bool{
        return lhs.square <= rhs.square
    }
    static func >=(lhs: Rectangle4, rhs: Rectangle4) -> Bool{
        return lhs.square >= rhs.square
    }
    static func >(lhs: Rectangle4, rhs: Rectangle4) -> Bool{
        return lhs.square > rhs.square
    }
    static func ==(lhs: Rectangle4, rhs: Rectangle4) -> Bool{
        return lhs.square == rhs.square
    }
}
extension Rectangle4: Hashable {     // имплементируем протокол для хэширования
    var hashValue: Int{            // определяем, как рассчитывать хэш
        let hashBase = sideA + sideB + square
        return hashBase.hashValue
    }
}
let smallRectangle = Rectangle4(sideA: 2, sideB: 4)
let bigRectangle = Rectangle4(sideA: 20, sideB: 40)
smallRectangle < bigRectangle   // true
smallRectangle == bigRectangle // false
let dictionary = [
    smallRectangle: 7,
    bigRectangle: 90
]

