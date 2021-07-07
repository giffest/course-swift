import UIKit

var str = "Hello, playground"

//  Практическое задание

// 1. Решить квадратное уравнение

// ax*x+bx+c=0 - квадратное уравнение
// D = b*b - 4*a*c - дискриминант

var a: Double = 1
print("Число a: \(a)")

var b: Double = -8
print("Число b: \(b)")

var c: Double = 12
print("Число c: \(c)")

if ((b*b - 4*a*c) >= 0 ) {
    var x: Double = (-1*b + sqrt(b*b - 4*a*c)) / (2 * a)
    print("Первый корень равен: \(x)")
    x = (-1*b - sqrt(b*b - 4*a*c)) / (2 * a)
    print("Второй корень равен: \(x)")
} else {
    print("Дискриминант меньше 0, корни не вещественные")
}

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

// Плошать прямоугольного треугольника S = a * b / 2

a = 3
print("Сторона a: \(a) треугольника")

b = 4
print("Сторона b: \(b) треугольника")

var S: Double = a * b / 2
print("Площать прямоугольного треугольника: \(S)")

// Гипотенуза прямоугольного треугольника c = sqrt(a*a + b*b)

c = sqrt(a*a + b*b)
print("Гипотенуза прямоугольного треугольника: \(c)")

// Периметр прямоугольного треугольника P = a + b + c

var P: Double = a + b + c
print("Периметр прямоугольного треугольника: \(c)")

// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет

var vklad: Double = 10000
var procent: Double = 10
var year: Int = 1
repeat {
    vklad = vklad * (1 + procent/100)
    year += 1
} while(year <= 5)
print("Сумма вклада через 5 лет будет: \(vklad)")
