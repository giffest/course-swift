import UIKit

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
///
//var countI = 0

/*for (index, value) in testArray.enumerated() {
    if (value % 2) > 0 {
        testArray[index] += 1
    }
}
testArray */
///

for (index, value) in testArray.enumerated() {
    if (value % 2) > 0 {
        testArray.remove(at: testArray.index(of: value)!)
    }
}
testArray
///для записуска с ошибкой поставить автозапуск
