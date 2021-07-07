import UIKit

// Матриалы урока
var a1 = 5

a1 += 5
// a = a + 5

true && true
true && false
false && true
false && false

true || true
true || false
false || true
false || false

!true
!false

let t = 8
let r = 6

(t > r) || (t == 7)

if t == 3 {
    print(t)
} else if r == 6 {
    print(r)
} else {
    print("Все неправильно")
}

// Тернарный оператор

if t == 3 {
    print(t)
} else {
    print(r)
}
t == 5 ? print(r) : print(t)


var h = 100

var i = false

let rowHeight = h + (i ? 20 : 10)
print(rowHeight)

let useMark = 5

switch useMark {
case 1:
    print("Не сдал")
case 4:
    print("Сдал хорошо")
case 5:
    print("Сдал отлично")
default:
    print("Студент не пришел")
}

let level: Character = "A"

switch level {
case "A":
    print("Выключить все электрические приборы")
    fallthrough // для проложения следуюших кейсов
case "B":
    print("Закрыть все окна и двери")
    fallthrough
case "C":
    print("Соблюлать спокойствие")
default:
    break
}

var a = 5
var b = 10
var c = 8

var D = (b * b) - (4 * a * c)

switch D {
case _ where D>0:
    print("2 корня")
case _ where D==0:
    print("1 корень")
default:
    print("Нет корней")
}

var totalSum = 0

for i in 1...10 {
    totalSum += i
}

totalSum
///
var music = ["Rock", "Jazz", "Hip-hop"]

for musicStyle in music {
    print("I love \(musicStyle)")
}
///
var contry = ["Россия":"ЕАЭС", "США":"НАТО", "Франция":"ЕС"]

for (countryName, blockName) in contry {
    print("\(countryName) вступила \(blockName)")
}
///

var q = 1

var result = 0

while q <= 10 {
    result += q
    q += 1
}
result
//
var o = 1
var res = 0

repeat {
    res += o
    o += 1
} while o <= 10
res
///

func myFirstFunction(firstValue someValue: Int, anotherValue: String, _ value: String) ->
    String {
    let cc = String(someValue) + anotherValue + value
        
    return cc
}
///
myFirstFunction(firstValue: 6, anotherValue: "90", "1")

func printMessage() -> () {
    print("Hello World")
}

printMessage()

func changeValue(_ a: inout Int, _ b: inout Int) -> () {
    let tmp = a
    a = b
    b = tmp
}

var a2 = 5
var b2 = 8

changeValue(&a2, &b2)
a2
b2
///

func generate(code: Int, message: String) -> String {
    let returnMessage = "Получение сообщения \(message) с кодом \(code)"
    return returnMessage
}

print(generate(code: 200, message: "Сервер недоступен"))
///

var testArray: [Int] = []
for i in 0...9 {
    testArray.append(i)
}
testArray

//var countI = 0

//for (index, value) in testArray.enumerated() {
//    if (value % 2) > 0 {
//        testArray[index] += 1
//    }
//}
//testArray

for value in testArray {
    if (value % 2) > 0 {
        testArray.remove(at: testArray.index(of: value)!)
    }
}
testArray

// Материалы методички

// Полиморфизм операторов
7 + 5 // сложение
"Привет " + "мир!" //склеивание
7 * 5 // умножение
//"Привет " * "мир!" //ошибка выполнения, не применимо для текста

// Присваивание
var a3 = 5 // Инициализирует переменную "a" значением 5
var b3 = 7 // Инициализирует переменную "b" значением 7
a3 = 9 //Присваиваетпеременной"а"новоезначение 9
b3 = a3 //Присваиваетпеременной"b"новоезначение, равное значению "a"

// Арифмктические операторы
4 + 7
4 - 7
4 * 7
4 / 7
4 % 7 // остаток от деления

// Составные выражения
a = 4 + 7 // сначала выполнится оператор сложения, и его результат будет присвоен переменной "a"
a = 4 + 7 + 5 // сначала выполняется первый оператор сложения, результат его выполнения будет использован вторым оператором сложения, итоговый результат будет использован оператором присваивания
a = 4 + 7 * 5 // сначала выполняется умножение, потом сложение, затем присваивание
a = (4 + 7) * 5 // сначала выполняется сложение, потом умножение, затем присваивание
a = a + a // оператор сложения сложит 55 и 55, результат присвоит переменной "a"
a = a + 18 //операторсложениявозьметзначение переменной "a" и 18, результат присвоит переменной "a"

// Составное присваивание
var x = 4
x = x + 4 // использовать значение переменной x в качестве аргумента оператора присваивания, результат присвоить переменной "x"
x += 2 //эквивалентновыражениювыше,ноиспользуется составной оператор
x *= 3
x /= 15

// Операторы сравнения
5 < 4
5 > 4
5 == 4
5 != 4
5 <= 4
5 >= 4
let a4 = 10
let b1 = 2
let x1 = a4 > b1

// Логические операторы
true && true
false && true
true && false
false && false

true || true
false || true
true || false
false || false

!false
!true

5 > 10 && 5 < 10
(5 > 10) && (5 < 10) // аналог выражения выше
(5 > 10) || (5 < 10)

// Ветвление
let x2 = 10
if x2 == 10 {
    print("perform")
}
if x == 20 {
    print("perform again")
}

if x2 == 20 {
    print("perform")
} else if x2 == 10 {
    print("perform again")
}

if x2 == 20 {
    print("perform")
} else if x2 == 30 {
    print("perform again")
} else {
    print("default")
}

if x2 == 10 {
    print("perform")
} else if x2 <= 10 {
    print("perform again")
} else {
    print("default")
}

a = 7
if a == 7 {
    print("one")
}
print("=======")

if a == 7 {
    print("one")
} else {
    print("no")
}
print("=======")

if a == 8 {
    print("one")
} else {
    print("no")
}
print("=======")

// Тернарный оператор
let a5 = 7
let b4 = a5 == 7 ? "yes":"no"
let c3 = a5 != 7 ? "yes":"no"
// аналогично
var bb: String!
if a5 == 7 {
    bb = "yes"
} else {
    bb = "no"
}

// Switch
let a6 = 7

switch a6 {
case 1:
    print("case 1")
case 7,8:
    print("case 2")
default:
    print("default")
}
print("=======")

switch a6 {
case 1:
    print("case 1")
case 9,8:
    print("case 2")
default:
    print("default")
}
print("=======")

switch a6 {
case 7:
    print("case 1")
    fallthrough // продолжение в следующем case
case 9,8:
    print("case 2")
    fallthrough // продолжение в следующем case
default:
    print("default")
}
print("=======")

// Проверка на вхождение в диапазон
let a7 = 56

switch a7 {
case 0...9:
    print("case 1")
case 9...40:
    print("case 2")
case 40...70:
    print("case 3")
case 70...100:
    print("case 4")
default:
    print("default")
}
print("=======")

// Проверка на вхождение в диапазон с кортежем
let a8 = 56
let b5 = 77
let c4 = 12

switch (a8, b5, c4) {
case (1, 78 , 9):
    print("case 1")
case (2, 45 , 87):
    print("case 2")
case (56, 77 , 12):
    print("case 3")
case (12, 44 , 66):
    print("case 4")
default:
    print("default")
}
print("=======")

/*
switch (a8, b5, c4) {
case (1, 78 , let x2):
    print("case 1")
case (2, 45 , let x2):
    print("case 2")
case (56, 77 , let x2):
    print("case 3", x2)
case (12, 44 , let x2):
    print("case 4")
default:
    print("default") }
print("=======")
*/

let a9 = 7
let b6 = 8
let c5 = 9

switch a9 {
case 1:
    print("case 1")
case 7 where b6 == c5:
    print("case 2")
case 7 where b6 != c5:
    print("case 3")
default:
    print("default")
}
print("=======")

//  Циклические операторы

let array1 = [5, 12, 7, 32]

for element in array1 {
    let z = element * 2
    print(z)
}
print("=======")
for _ in (1...5) {
    print("Повтор")
}

for i in stride(from: 0, to: 5, by: 2) {
    print(i)
}
print("=======")
for i in stride(from: 0, through: 9, by: 3) {
    print(i)
}
print("=======")
for element in array1 where element % 2 == 0 {
    print(element)
}

// while
let timeFuture = Date().addingTimeInterval(10) // получам дату через 10 секунд от текущего момента

// пока дата в переменной больше чем текущая выполняем цикл
while timeFuture > Date() {
    print(Date()) // выводим в консоль текущую дату
    sleep(1) // пауза на 1 секунду, чтобы не засорять консоль
}

// repeat-while
let i2 = 10

while i2 < 10 {
    print("while итерация")
}
print("=======")

repeat {
    print("while итерация")
} while i2 < 10

// Функции
func example() {
    print("Функция вызвана")
}

for _ in (0..<5) {
    example()
}

sqrt(4)
let x3 = sqrt(4)
let y = 7 + sqrt(4)

//
func fomatArray( // имя функции
    _ array: [String], // первый параметр. Прочерк говорить, что нет внешнего имени
    good: String, // второй параметр. Имя указано одно, оно будет внешним и внутренним
    andRemovEvil evil: String // третий параметр. Указаны и внешние и внутренние имена
    ) -> [String] // тип возвращаемого значения
{
    var newArray = array // параметры переданны в функцию нельзя менять, скопируем массив
    newArray.append(good) // добавив добра, переменная good содержит переданный параметр
    // удалим зло, обартите внимание, что переменная доступна по внутреннему имени
    if let index = newArray.index(of: evil) {
        newArray.remove(at: index)
    }
    return newArray // вернем форматированный массив
}
let array = ["яблоко", "персик", "лук"]
// вызываем функцию, имя первого параметра не указывается, мы поставили там прочерк
// имя второго параметра совпадает с тем что мы использовали в функции
// имя третьего параметра отличается от внутреннего
// функция вернет новый массив, мы присвоим его переменной
let gooArray = fomatArray(array, good: "клубника", andRemovEvil: "лук")
// Злой лук удален, добро добавлено

func formatArray(_ array: [String], good: String, evil: String?) -> [String] {
    var newArray = array
    newArray.append(good)
    
    if let evil = evil { // разворачиваем опшенал
        if let index = newArray.index(of: evil) {
            newArray.remove(at: index)
        }
    }
    return newArray
}

let array2 = ["яблоко", "персик", "лук"]
// не будем удалять зло
// обатите внимание, без внешних параметров стало сложнее понимать зачем нужны параметры
let goodArrayWithEvil = formatArray(array2, good: "клубника", evil: nil)
// удалим зло
let goodArrayWithoutEvil = formatArray(array2, good: "клубника", evil: "лук")
//
func newformatArray(_ array: [String], good: String = "клубника", evil: String? = nil) -> [String] {
    var newArray = array
    newArray.append(good)
    
    if let evil = evil { // разворачиваем опшенал
        if let index = newArray.index(of: evil) {
            newArray.remove(at: index)
        }
    }
    return newArray
}
let array3 = ["яблоко", "персик", "лук"]
// не указываем второй и третий параметры, будут использованы значения по умолчанию
let goodArrayWithEvil2 = newformatArray(array3)
// укажем только третий параметр
let goodArrayWithoutEvil2 = newformatArray(array3, evil: "лук")
//
func formatArray2(_ array: [String], good: String ...) -> [String] {
    var newArray = array
    if !good.isEmpty {
        newArray += good
    }
    return newArray
}
let array4 = ["яблоко", "персик", "лук"]
// можем передать несколько видом добра
let goodArrayWithEvil3 = formatArray2(array4, good: "клубника", "банан", "черешня")

// Выход из области видимости
let z = 4

for i in 0...10 { // начало действия области видимости цикла
    guard i == 5 else { // если условие ложно то выполняем блок else
        continue // переходим к следующей итерации
    }
    // если условие в guard истинно, то продолжем выполнение блока кода
    print(i) // переменная i доступна
} // конец дейсвтия области видимости цикла
