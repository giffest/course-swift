import UIKit

// Практическое задание2

// Задача 1. Написать функцию, которая определяет, четное число или нет.

// функция определяет является число четным или нет и сообщает об этом через сообщение
func evenOddNumber(_ number: Int) -> String {
    var returnMessage = "\(number) - "
    if (number % 2) > 0 {
        returnMessage += "нечетное"
    } else {
        returnMessage += "четное"
    }
    return returnMessage
}

var a = 18 // объявлем проверемое значение a
var b = 35 // объявлем проверемое значение b
print(evenOddNumber(a)) // выводим результат работы функции проверки четности и нечетности числа
print(evenOddNumber(b))


// Задача 2. Написать функцию, которая определяет, делится ли число без остатка на 3.

//функция проверки деления числа на 3 без остатка
func division3(_ number: Int) -> String {
    var returnMessage = "\(number) - "
    if (number % 3) > 0 {
        returnMessage += "не делится на 3 без остатка"
    } else {
        returnMessage += "делится на 3"
    }
    return returnMessage
}

print(division3(a)) // выводим результат работы функции деления на 3 без остатка
print(division3(b))


// Задача 3. Создать возрастающий массив из 100 чисел.

var numberArray = [Int]() // объявляем пустой массив Int
// заполняем массив через цикл
for i in 1...100 {
    numberArray.append(i)
}
numberArray.count // проверка количества значений массива


// Задача 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.

for value in numberArray {
    if (value % 2 == 0) || (value % 3 > 0) {
        numberArray.remove(at: numberArray.index(of: value)!)
    }
}
numberArray.count // проверка количества значений массива
numberArray // выводим массив


// Задача 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
// Числа Фибоначчи определяются соотношениями Fn = Fn-1 + Fn-2.

// Вариант 1
func Fibonacci(_ n: Int) -> Double {
    var F: Double = 0 // объявление F0 и F n-ного значения (n>=2)
    var F1: Double = 1 // объявление F1
    var Fa: Double = 0 // объявление Fn-2
    var Fb: Double = 0 // объявление Fn-1
    switch n {
    case _ where n == 0:
        return F
    case _ where n == 1:
        return F1
    default:
        for _ in 1..<n {
            Fb = F1 //
            F = Fa + Fb // основная формула
            Fa = Fb // сдвигаем значение на место Fn-2
            F1 = F // запоминаем новое значение для сдвига
        }
        return F
    }
}

a = 10
Fibonacci(a) // проверка чисел Фибоначчи

// Вариант 2
func Fibonacci2(_ n: Int) -> Double {
    var FF = [Double]()
    FF += [0, 1]
    switch n {
    case _ where n == 0 || n == 1:
        return FF[n]
    default:
        for i in 2...n {
            FF.append(FF[i-2] + FF[i-1])
        }
        return FF[n]
    }
}

Fibonacci2(a)

// Заполнение массива через функцию Фибоначчи
var FibonacciArray = [Double]() // объявляем пустой массив Double
// заполняем массив через цикл
for i in 1...100 {
    FibonacciArray.append(Fibonacci(i)) // для первой фукнции время выполнения около 0.3032909631729
    //FibonacciArray.append(Fibonacci2(i)) // для второй фукнции время выполнения около 0.9048289060592
}
FibonacciArray // выводим массив с числами Фибоначчи

/* Код для проверки времени выполнения цикла
 * let timeStart = Date() // начало интревала, фиксируем перед циклом
 * let timeStop = Date() // конец интревала, фиксируем после цикла
 * let timeF = timeStop.timeIntervalSince(timeStart) // считаем
 * print("\(timeF)")
*/


/* Задача 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
 a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
 b. Пусть переменная p изначально равна двум — первому простому числу.
 c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
 d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
 e. Повторять шаги c и d, пока возможно.
*/
var nutNumber = [Int]() // объявляем пустой массив Int
var m = 100 // параметр опредляет количество простых чисел в массиве

var x = 0
var n = 0
var p = 0
var pInx = 0

repeat {
    n = m + x // параметр пересоздания массива
    nutNumber.removeAll() // создаем чистый массив
    for i in 1...n {
        nutNumber.append(i)
    }
    
    p = 2 // присваиваем p первое простое число 2
    pInx = 2 // первый коэффициент зачеркивания
    
    repeat {
        for i in pInx...n {
            for value in nutNumber where (value % (p*i)) == 0 {
                nutNumber.remove(at: nutNumber.index(of: value)!)
            }
        }
        
        pInx = nutNumber.index(of: p)! + 1 // сокращаем область обработки массива на позицию нового значения p
        n = nutNumber.count // переопределяем новую границу массива
        if pInx < n {
            p = nutNumber[pInx] // p присваиваем большему значению после текущего, кроме крайнего значения массива
        }
    } while pInx < (n-1) // выходим без обработки последнего значения массива (n-1)

    x += (m - n) // вычисление недостающего количества значений массива
} while n != m // не выходим пока не создадим массив с колличеством m простых чисел

nutNumber
nutNumber.count

