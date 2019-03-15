import UIKit

var str = "Hello, playground"

let max = 10
var cur = 0

var welcome: String = "Hello"
//welcome = "Hello"

var c = max + cur

let t = 3
let point = 0.14159

let pi = Double(t) + point

var g: Int? = 129

var s: String? = "World"

s = nil
g = nil

var future: String?

future = "Галина Ивановна"

print("В следуюшем году учителем будет \(future!)")

//future = nil

//print("В следуюшем году учителем буцдет \(future)")

// пример 1
if future != nil {
    let teacher = future!
    print("В следуюшем году учителем будет \(teacher)")
} else {
    print("Не знаю")
}
// пример 2
if let teacher = future {
    print("В следуюшем году учителем будет \(teacher)")
} else {
    print("Не знаю")
}

let defaultlaunch = "пицца"
var specillunch: String?

var mylunch = specillunch ?? defaultlaunch
print("мой обед \(mylunch)")

specillunch = "пирог"
mylunch = specillunch ?? defaultlaunch
print("Мой обед \(mylunch)")


var nationalParks: [String] = ["Акадия", "Зайон", "Гранд-каньон"]

print("Национальный парк - \(nationalParks[2])")

//print("Национальный парк - \(nationalParks[3])")

nationalParks.append("Бэдленс")

nationalParks.insert("Форест", at: 2)
//nationalParks.append("Форест", at: [2])

nationalParks.removeLast()

nationalParks.remove(at: 2)

nationalParks

var countries = ["IT":"Италия", "RU":"Россия", "FR":"Франция"]

let fractions = [0.25: "1/4", 0.5: "1/2", 0.75: "3/4"]

print(countries["RU"]!)

if let biggestCountry = countries["USA"] {
    print("Страна - \(biggestCountry)")
} else {
    print("Этой страны нет в словаре")
}

countries["AU"] = "Австрия"
countries

countries["IT"] = nil

countries["RU"] = "РФ"
countries

var fav: Set<String> = ["Rock", "Classical", "Hip hop"]

print("У меня \(fav.count) любимых жанра")

fav.insert("Jazz")

if let removeGenre = fav.remove("Rock") {
    print("\(removeGenre) удален")
} else {
    print("Такого нет")
}

if fav.contains("Classical") {
    print("Новый жанр")
} else {
    print("Такого нет")
}
// практические задания
// задание 1
// Сложить две дроби между собой
// Решение
var drob1 = 0.5
var drob2 = 1

var result: Double = drob1 + Double(drob2)

// задание 2
// Есть переменная типа Int, и в ней записано семизначное число. Нужно поменять местами первую и последнюю цифры
// Решение
var chislo: Int = 1234567

var tmpString = ""

let first: Character = String(chislo).characters.first!
let last: Character = String(chislo).characters.last!

tmpString = String(chislo)

tmpString.characters.removeLast()
tmpString.characters.removeFirst()

String(last) + tmpString + String(first)

