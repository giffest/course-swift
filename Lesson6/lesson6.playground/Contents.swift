import UIKit


// Дженерики
func swapTwoValues(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 5
var another = 89

swap(&someInt, &another)
print("\(someInt), \(another)")

func swapTwoValuesString (_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValuesDouble (_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoValue2<T>(_ a: inout T, _ b: inout T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var t = 5
var tt = 90

swap(&t, &tt)
print("\(t), \(tt)")

var s = "Hello"
var ss = "World!"

swap(&s, &ss)
print("\(s), \(ss)")

// Стек
struct inStack {
    var items = [Int]()
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

struct stack<Element> {
    var items = [Element]()
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stackOfString = stack<String>()

stackOfString.push("один")
stackOfString.push("два")
stackOfString.push("три")
stackOfString.push("четыре")

print(stackOfString)

stackOfString.pop()
print(stackOfString)

//






class someClass {
    
}
protocol someProtocol {
    
}
func someFuncion<T: someClass, U: someProtocol>(some: T, someU: U) {
    //инициализация
}

func funIndex(ofString valuetoFind: String, in array: [String]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valuetoFind {
            return index
        }
    }
    return nil
}

let stringArray = ["кот", "собака", "бегемот", "попугая"]

if let foundIndex = funIndex(ofString: "попугай", in: stringArray) {
    print("индекс значения \(foundIndex)")
}

func findIndex<T: Equatable>(ofString valuetoFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valuetoFind {
            return index
        }
    }
    return nil
}

if let found = findIndex(ofString: "кот", in: stringArray) {
    print("индекс значения \(found)")
}

var arrayInt = [1,2,3,4,5,6]
var findArray = findIndex(ofString: 4, in: arrayInt)

print(findArray!)

var stringInArray = findIndex(ofString: "бегемот", in: stringArray)
print(stringInArray!)


// Subscripting
/*subscript(index: Int) -> Int {
    
    get {
        // возвравращает значение
    }
    
    set(newValue) {
        // проводит установки
    }
//} */

/*subscript(index: Int) -> Int {

//}*/
struct timesTables {
    let multi: Int
    subscript(index: Int) -> Int {
        return multi * index
    }
}

let three = timesTables(multi: 3)
print("шесть умножить на три \(three[6])")


var numberOfLegs = ["паук":8, "муравей":6, "кошка":4]
numberOfLegs["птица"] = 2


// Замыкания
let hello = {print("Hello")}
hello()

let names = ["Chris", "Robert", "Ewa", "Barry"]

func backward(_ s1: String, _ s2: String) -> Bool {
   return s1 > s2
}

var reversedNamed = names.sorted(by: backward)
print(reversedNamed)

reversedNamed = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 < s2})

reversedNamed = names.sorted(by: {$0 > $1})
print(reversedNamed)

reversedNamed = names.sorted {$0 < $1}
print(reversedNamed)

// Материалы методички
// Дженерики
class Rectangle {
    var sideA: Double
    var sideB: Double
    func calculatePerimiter() -> Double {
        return sideA + sideB
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
struct StackM {                                   // коллекция типа стек
    private var elements: [Rectangle] = []      // массив, где мы будем хранить элементы
    mutating func push(_ element: Rectangle) { // добавляем элемент в конец массива
        elements.append(element)
    }
    mutating func pop() -> Rectangle? {      // извлекаем элемент из массива
        return elements.removeLast()
    }
}
var stackM = StackM()                          // создаем пустой стек
// добавляем элементы
stackM.push(Rectangle(sideA: 10, sideB: 20))
stackM.push(Rectangle(sideA: 2, sideB: 2))
stackM.push(Rectangle(sideA: 17, sideB: 90))
stackM.push(Rectangle(sideA: 10, sideB: 3))
//извлекаем элементы
stackM.pop()                                 // Rectangle(10,3)
stackM.pop()                                 // Rectangle(17,90)

//
class Circle {
    var radius: Double
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double) {
        self.radius = radius
    }
}
class RectangleM {
    var sideA: Double
    var sideB: Double
    func calculatePerimiter() -> Double {
        return sideA + sideB
    }
    init(sideA: Double, sideB: Double) {
        self.sideA = sideA
        self.sideB = sideB
    }
}
struct StackM2<T> {                   // T - это какой-то пока неизвестный тип
    private var elements: [T] = []           // массив типа Т
    mutating func push(_ element: T) {      // добавляем элемент типа Т
        elements.append(element)
    }
    mutating func pop() -> T? {           // извлекаем элемент типа Т
        return elements.removeLast()
    }
}
var stackRectangle = StackM2<RectangleM>()  // создаем стек типа Rectangle
var stackCircle = StackM2<Circle>()       // создаем стек типа Circle
// добавляем элементы
stackRectangle.push(RectangleM(sideA: 10, sideB: 20))
stackRectangle.push(RectangleM(sideA: 2, sideB: 2))
stackCircle.push(Circle(radius: 5))
stackCircle.push(Circle(radius: 5))

//
protocol Weightabe {                      // создаем протокол поддержки веса
    var weight: Double { get set }
}
class CircleM3: Weightabe {                // имплементируем протокол кругу
    var radius: Double
    var weight: Double
    func calculatePerimiter() -> Double {
        return 2.0 * Double.pi * radius
    }
    init(radius: Double, weight: Double) {
        self.radius = radius
        self.weight = weight
    }
}
class RectangleM3: Weightabe {       // имплементируем протокол прямоугольнику
    var sideA: Double
    var sideB: Double
    var weight: Double
    func calculatePerimiter() -> Double {
        return 2*(sideA + sideB)
    }
    init(sideA: Double, sideB: Double, weight: Double) {
        self.sideA = sideA
        self.sideB = sideB
        self.weight = weight
    }
}
// T - это какой-то пока неизвестный тип, но он поддерживает протокол Weightabe
struct StackM3<T: Weightabe> {
    private var elements: [T] = []           // массив типа Т
    
    mutating func push(_ element: T) {      // добавляем элемент типа Т
        elements.append(element)
    }
    mutating func pop() -> T? {            // извлекаем элемент типа Т
        return elements.removeLast()
    }
    var totalWeight : Double {             // свойство, отражающее общий вес деталей
        var weight = 0.0
        for element in elements {
            weight += element.weight    // мы можем использовать свойство weight
        }
        return weight
    }
}

// Subscripting
struct StackM4<T: Weightabe> {
    private var elements: [T] = []
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    var totalWeight : Double {
        var weight = 0.0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
    subscript(elements: Int ...) -> Double {  // доступ к стеку по индексу
        var weight = 0.0
        // перебираем все элементы по переданным индексам, пропускаем
        // те индексы, которые лежат за пределами массива
        for index in elements where index < self.elements.count {
            weight += self.elements[index].weight
        }
        return weight
    }
}
var stackM4 = StackM4<CircleM3>()
stackM4.push(CircleM3(radius: 4, weight: 12))
stackM4.push(CircleM3(radius: 4, weight: 12))
stackM4.push(CircleM3(radius: 4, weight: 12))
stackM4.push(CircleM3(radius: 4, weight: 12))
stackM4[0,1,2]                                   // 36

// Замыкания
// замыкание имеет тип, его можно присвоить переменной
let closure: (Int, Int) -> Bool = { (itemOne: Int, itemTwo: Int) -> Bool in
    return itemOne == itemTwo
}
closure(2, 2) // true

// функция высшего порядка – это обычная функция, которая в качестве аргументов принимает замыкания

// замыкание: определяет четное число
let odd: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 == 0
}
// замыкание: определяет нечетное число
let even: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 != 0
}
var array = [1,2,3,4,5,6,7,8,9,10]
// принимает два аргумента – массив и замыкание
func filter(array: [Int], predicate: (Int) -> Bool ) -> [Int] {
    var tmpArray = [Int]()               // создает временный массив
    for element in array {
        if predicate(element) {         // вызываем замыкание, чтобы проверить элемент
            tmpArray.append(element)
        }
    }
    return tmpArray                     // возвращаем отфильтрованный массив
}
filter(array: array, predicate: odd)   // [2, 4, 6, 8, 10]
filter(array: array, predicate: even) // [1, 3, 5, 7, 9]

//  объявление замыкание в момент вызова функции высшего порядка
filter(array: array, predicate: { (element: Int) -> Bool in
    return element % 2 == 0
}) // [2, 4, 6, 8, 10]

// закрывающее замыкание. Если замыкание передается последним параметром, его можно вынести за круглые скобки, что сделает синтаксис более привлекательным
filter(array: array) { (element: Int) -> Bool in
    return element % 2 == 0
} // [2, 4, 6, 8, 10]

//Во-первых, мы можем убрать возвращаемый тип, он будет выведен из контекста.
filter(array: array) { (element: Int) in
    return element % 2 == 0
} // [2, 4, 6, 8, 10]
//Во-вторых, мы можем убрать тип у аргументов.
filter(array: array) { (element) in
    return element % 2 == 0
} // [2, 4, 6, 8, 10]
//Если мы не пишем типы у аргументов и возвращаемого значения, можно убрать и круглые скобки.
filter(array: array) { element in
    return element % 2 == 0
} // [2, 4, 6, 8, 10]
//в замыкание будет передан один аргумент, можно убрать и его, а в теле замыкания он будет доступен через переменную «$0». Так как мы убираем имя аргумента, мы обязаны убрать и ключевое слово «in»
filter(array: array) {
    return $0 % 2 == 0
} // [2, 4, 6, 8, 10]
//Так как у нас осталась одна строка в замыкании, компилятор поймет, что ее результат и есть возвращаемое значение, и слово «return» мы тоже можем не писать
filter(array: array) { $0 % 2 == 0 }// [2, 4, 6, 8, 10]
//Это самый сокращенный вариант замыкания. Не всегда получается настолько его сократить, и не всегда стоит это делать.

//если мы сделаем функцию высшего порядка дженериком, мы сможем фильтровать любые массивы
//в стандартной библиотеке есть такая функция высшего порядка
var arrayM = [1,2,3,4,5,6,7,8,9,10]
arrayM.filter{ $0 % 2 == 0 }  // [2, 4, 6, 8, 10]
arrayM.filter{ $0 % 2 != 0 } // [1, 3, 5, 7, 9]

// есть стандартные функции:
//«sort» – сортировки массива.
//«map» – преобразования массива.
//«reduce» – вычисляет результат агрегирования элементов.
//«forEach» – итерирование массива по аналогии с for.
var arrayM2 = [1,2,3,4,5,6,7,8,9,10]
arrayM2.sort { $0 > $1 }        // [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
arrayM2.map { $0 * $0 }         // [100, 81, 64, 49, 36, 25, 16, 9, 4, 1]
arrayM2.reduce(0){ $0 + $1 }    // 55
arrayM2.reduce(1){ $0 * $1 }    // 3628800
arrayM2.forEach{
    print($0)
}


//Последнее, что нужно знать про замыкания, – они захватывают все ссылки как сильные («strong»). Это может сыграть с вами очень злую шутку: вы можете запросто создать цикл удержания.
//Напишем простой пример. Определим два класса – «экран» и «фигура». Экран будет содержать фигуру и цвет для отрисовки фигур. Фигура будет содержать замыкание для отрисовки себя на экране. При создании класса экрана мы создаем фигуру и замыкание для нее, в замыкании используем свойство класса «figureColor», и замыкание захватит его сильной ссылкой.
class Figure {
    var draw: (() -> Void)?    // замыкание
    deinit {
        print("Фигура уничтожена")
    }
}
class Screen { //экран
    var figureColor: String  // цвет, которым рисуем фигуры
    let figure: Figure      // свойство для хранения фигуры
    init(color: String) {
        self.figureColor = color
        figure = Figure()     // создали фигуру
        // создали замыкание для отрисовки, использовали в нем self.figureColor
        figure.draw = { print("Рисуем квадрат \(self.figureColor)  цвета") }
    }
    deinit {
        print("Экран уничтожен")
    }
}
var screen: Screen? = Screen(color: "красного")
screen?.figure.draw?()
screen = nil  // убрали ссылку на screen, но объект из памяти не выгружается
//В результате у нас получился цикл удержания: экран удерживает фигуру, фигура удерживает замыкание, замыкание удерживает экран. Это не совсем очевидно, и нужно быть готовым к таким ситуациям.

//Чтобы разорвать этот круг, надо передать «self» в замыкание по слабой ссылке.
class Figure2 {
    var draw: (() -> Void)?                  // замыкание
    deinit {
        print("Фигура уничтожена")
    }
}
class Screen2 {                             // экран
    var figureColor: String               // цвет, которым рисуем фигуры
    let figure: Figure2                   // свойство для хранения фигуры
    init(color: String) {
        self.figureColor = color
        figure = Figure2()               // создали фигуру
        // создали замыкание для отрисовки, использовали в нем self.figureColor
        figure.draw = { [weak self] in // указываем, что self передается как weak
            print("Рисуем квадрат \(self!.figureColor)  цвета")
        }
    }
    deinit {
        print("Экран уничтожена")
    }
}
var screen2: Screen2? = Screen2(color: "красного")
screen2?.figure.draw?()
screen2 = nil                        // убрали ссылку на screen, объект из памяти выгрузился
