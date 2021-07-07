
// Практическое задание 6
/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

struct queue<T> { // коллекция "очередь"
    var itemsArray: [T] = []
    // метод добавляет элемент массива
    mutating func push(_ item: T) {
        itemsArray.append(item)
    }
    // метод удаляет последний элемент массива
    mutating func pop() -> T? {
        return itemsArray.removeLast()
    }
    // метод фильтрует
    mutating func filter(order: (T) -> Bool ) -> [T] {
        var tmpArray = [T]()
        for item in itemsArray {
            if order(item) {
                tmpArray.append(item)
            }
        }
        return tmpArray // возвращаем результат фильтра
    }
    // метод subscript, выводим значение по индексу в массиве или nil если индекс не существует
    subscript(index: Int) -> T? {
        switch index {
        case _ where index < self.itemsArray.count:
            return itemsArray[index]
        default:
            return nil
        }
    }
}

// замыкание: определяет четное число
let odd: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 == 0
}

// замыкание: определяет нечетное число
let even: (Int) -> Bool = { (element: Int) -> Bool in
    return element % 2 != 0
}

// Проверка: типа коллекции, методов и subscript
var queue_main = queue<Int>() // объявляем основную очередь Int

queue_main.push(1)
queue_main.push(2)
queue_main.push(3)
queue_main.push(4)
print(queue_main) // queue<Int>(itemsArray: [1, 2, 3, 4])

queue_main[4] // nil - нет такого индекса
queue_main[2] // 3

var queue_filter1 = queue_main.filter(order: odd) // фильтруем четные
print(queue_filter1) // [2, 4]

var queue_filter2 = queue_main.filter(order: even) // фильруем нечетные
print(queue_filter2) // [1, 3]

queue_main.pop() // удвляем последний элемент
queue_main[3] // nil
