
// Материалы методички

// Error
// nil

// Наша фабрика
class Factory {
    // зарплата рабочих
    fileprivate var employee = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    // получаем зарплату рабочего
    func salary(atFio fio: String) -> Int {
        // так как такого рабочего может и не быть, разворачиваем опциональную переменную
        return employee[fio]!
    }
}
//
class Factory2 {
    fileprivate var employee = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    func salary(atFio fio: String) -> Int {
        // если рабочего нет, вернем 0
        return employee[fio] ?? 0
    }
}
//
class Factory3 {
    private var employee = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    // теперь метод возвращает опциональное значение
    func salary(atFio fio: String) -> Int? {
        return employee[fio]
    }
}
let factory = Factory3()
factory.salary(atFio: "Иванов Иван Иванович")// 3000
factory.salary(atFio: "Брюс Вейн Бэтмэнович")// nil

// Guard
class Factory4 {
    private var employes = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    // теперь наш метод возвращает опциональное значение
    func salary(atFio fio: String) -> Int? {
        return employes[fio]
    }
    func averageSalary() -> Int {
        var totalSalary = 0
        for employee in employes {
            totalSalary += employee.value
        }
        return totalSalary / employes.count
    }
}
let factory4 = Factory4()
factory4.salary(atFio: "Иванов Иван Иванович")// 3000
factory4.salary(atFio: "Брюс Вейн Бэтмэнович")// nil
factory4.averageSalary()                     // 7706

// добавим проверку на деление на 0
class Factory5 {
    private var employes = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    func salary(atFio fio: String) -> Int? {
        return employes[fio]
    }
    func averageSalary() -> Int {
        // если на предприятии есть рабочие, считаем среднюю зарплату
        if employes.count > 0 {
            var totalSalary = 0
            for employee in employes {
                totalSalary += employee.value
            }
            return totalSalary / employes.count
        } else {  // если нет работников, возвращаем 0
            return 0
        }
    }
}
let factory5 = Factory5()
factory5.salary(atFio: "Иванов Иван Иванович")// 3000
factory5.salary(atFio: "Брюс Вейн Бэтмэнович")// nil
factory5.averageSalary()                     // 7706

// через guard
class Factory6 {
    private var employes = [
        "Иванов Иван Иванович": 3000,
        "Сидоров Сидор Сидорович": 12080,
        "Петров Петр Петрович": 8040
    ]
    func salary(atFio fio: String) -> Int? {
        return employes[fio]
    }
    func averageSalary() -> Int {
        // нам необходимо, чтобы на предприятии работали сотрудники
        guard employes.count > 0 else { // иначе возвращаем 0
            return 0
        }
        // если наше требование удовлетворено, просто переходим к выполнению метода
        var totalSalary = 0
        for employee in employes {
            totalSalary += employee.value
        }
        return totalSalary / employes.count
    }
}
let factory6 = Factory6()
factory6.salary(atFio: "Иванов Иван Иванович")// 3000
factory6.salary(atFio: "Брюс Вейн Бэтмэнович")// nil
factory6.averageSalary()                     // 7706

// Error
/* Это простой вендинговый автомат: у нас есть продукты, позиции в наличии и само хранилище в автомате. Покупатель бросает монетки и заказывает товар */
// позиции в автомате
struct Item0 {
    var price: Int
    var count: Int
    let product: Product
}
// товар
struct Product{
    let name: String
}
// вендинговая машина
class VendingMachine0 {
    // хранилище
    var inventory = [
        "Candy Bar": Item0(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item0(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item0(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]
    // количество денег, переданное покупателем
    var coinsDeposited = 0
    // продаем товар
    func vend(itemNamed name: String) -> Product? {
        // если наша машина не знает такого товара вообще, возвращаем nil
        guard let item = inventory[name] else {
            return nil
        }
        // если товара нет в наличии, возвращаем nil
        guard item.count > 0 else {
            return nil
        }
        // если недостаточно денег, возвращаем nil
        guard item.price <= coinsDeposited else {
            return nil
        }
        // продаем товар
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        print("Dispensing \(name)")
        return newItem.product
    }
}
let vendingMachine0 = VendingMachine0()
vendingMachine0.vend(itemNamed: "Snikers")    // nil
vendingMachine0.vend(itemNamed: "Candy Bar")  // nil
vendingMachine0.vend(itemNamed: "Pretzels")   // nil

//
enum VendingMachineError0: Error {            // ошибки автомата
    
    case invalidSelection                    // нет в ассортименте
    case outOfStock                          // нет в наличии
    case insufficientFunds(coinsNeeded: Int) // недостаточно денег, передаем недостаточную сумму
}
// Вендинговая машина
class VendingMachine00 {
    // Хранилище
    var inventory = [
        "Candy Bar": Item0(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item0(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item0(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]
    // Количество денег, переданное покупателем
    var coinsDeposited = 0
    // Продаем товар
    func vend(itemNamed name: String) -> (Product?, VendingMachineError0?) { // Возвращаем кортеж из товара и ошибки
        // Если наша машина не знает такого товара вообще
        guard let item = inventory[name] else {
            // возвращаем nil вместо продукта и ошибку
            return (nil, VendingMachineError0.invalidSelection)
        }
        // Если товара нет в наличии
        guard item.count > 0 else {
            // возвращаем nil вместо продукта и ошибку
            return (nil, VendingMachineError0.outOfStock)
        }
        // Если недостаточно денег
        guard item.price <= coinsDeposited else {
            // возвращаем nil вместо продукта и ошибку
            return (nil, VendingMachineError0.insufficientFunds(coinsNeeded: item.price - coinsDeposited))
        }
        // продаем товар
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        // Возвращаем nil вместо ошибки и продукт
        return (newItem.product, nil)
    }
}
let vendingMachine00 = VendingMachine00()
let sell1 = vendingMachine00.vend(itemNamed: "Snikers")   // nil, invalidSelection
let sell2 = vendingMachine00.vend(itemNamed: "Candy Bar") // nil, (insufficientFunds, 12)
let sell3 = vendingMachine00.vend(itemNamed: "Pretzels") // Product("Pretzels"), nil
if let product = sell1.0 {
    print("Мы купили: \(product.name)")
} else if let error = sell1.1 {
    print("Произошла ошибка: \(error.localizedDescription)")
}

// Try/Catch
// Throws
// Вендинговая машина
class VendingMachine000 {
    // Хранилище
    var inventory = [
        "Candy Bar": Item0(price: 12, count: 7, product: Product(name: "Candy Bar")),
        "Chips": Item0(price: 10, count: 4, product: Product(name: "Chips")),
        "Pretzels": Item0(price: 0, count: 11, product: Product(name: "Pretzels"))
    ]
    // Количество денег,  переданное покупателем
    var coinsDeposited = 0
    // продаем товар
    // возвращаем продукт,
    // но помечаем метод как «throws», это означает, что он может завершиться с ошибкой
    func vend(itemNamed name: String) throws -> Product {
        // Если наша машина не знает такого товара вообще,
        guard let item = inventory[name] else {
            // генерируем ошибку
            throw VendingMachineError0.invalidSelection
        }
        // если товара нет в наличии,
        guard item.count > 0 else {
            // генерируем ошибку
            throw VendingMachineError0.outOfStock
        }
        // если недостаточно денег,
        guard item.price <= coinsDeposited else {
            // генерируем ошибку
            throw VendingMachineError0.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        // продаем товар
        coinsDeposited -= item.price
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        // возвращаем продукт
        return newItem.product
    }
}

// Обработка ошибок
do {
    // помечаем метод как try и помещаем его вызов в блок do
    let sell1 = try vendingMachine00.vend(itemNamed: "Snikers")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

do {
    let sell1 = try vendingMachine00.vend(itemNamed: "Snikers")
} catch VendingMachineError0.invalidSelection {
    print("Такого товара не существует")
} catch VendingMachineError0.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}

// добавляем ? после try, и результат становится опциональным, в случае ошибки получаем nil
let sell = try? vendingMachine00.vend(itemNamed: "Snikers")

enum BuyError0: Error {  // ошибки покупки
    case buyerNotFound  // покупатель не найден
}
// список покупателей и товаров, которые они хотят купить
let favoriteSnacks0 = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
// метод покупки, тоже генерирует исключение
func buyFavoriteSnack0(person: String, vendingMachin: VendingMachine000) throws -> Product {
    // если покупатель не найден, генерируем исключение
    guard let snackName0 = favoriteSnacks0[person] else {
        throw BuyError0.buyerNotFound
    }
    // иначе покупаем товар
    return try vendingMachin.vend(itemNamed: snackName0)
}
let vendingMachine000 = VendingMachine000()
do {
    let sell = try buyFavoriteSnack0(person: "Alice", vendingMachin: vendingMachine000)
} catch VendingMachineError0.invalidSelection {
    print("Такого товара не существует")
} catch VendingMachineError0.insufficientFunds(let coinsNeeded0) {
    print("введенная сумма недостаточна. Необходимо еще \(coinsNeeded0) монет")
} catch BuyError0.buyerNotFound {
    print("Покупатель не найден")
} catch let error0 {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error0.localizedDescription)
}


//  Материалы урока

enum vendingMachineError: Error {
    case invalideSelection
    case outOfStock
    case insuffinciendtFunds(coinsNedded: Int)
}

throw vendingMachineError.insuffinciendtFunds(coinsNedded: 5)

func canThrowError() throws -> String {
    // Ошибка
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Газировка": Item(price: 12, count: 7),
        "Чипсы": Item(price: 10, count: 4),
        "Шоколад": Item(price: 0, count: 11)
    ]
    
    var coinsDeposied = 0
    
    func vend(itemNames name: String) throws {
        guard let item = inventory[name] else {
            throw vendingMachineError.invalideSelection
        }
        guard item.count > 0 else {
            throw vendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposied else {
            throw vendingMachineError.insuffinciendtFunds(coinsNedded: item.price - coinsDeposied)
        }
        
        coinsDeposied -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
    }
}

// Try/Catch
let favoriteSnacks = [
    "Bob":"Чипсы",
    "Alice":"Газировка",
    "Adam":"Шоколад",
]

func buyFavoriteSnacks(person: String, vendigMashine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? ""
    try vendigMashine.vend(itemNames: snackName)
}

var vending = VendingMachine()

vending.coinsDeposied = 0

do {
    try buyFavoriteSnacks(person: "Bob", vendigMashine: vending)
} catch vendingMachineError.invalideSelection {
    print("Выбор неверен, товаров нет")
} catch vendingMachineError.outOfStock {
    print("Товар закончился")
} catch vendingMachineError.insuffinciendtFunds(let coinsNedeed) {
    print("введенная сумма недостаточна. Необходимо еще \(coinsNedeed) монет")
}

//
func someThrowFunction() throws -> Int {
    // ...
}

let x = try? someThrowFunction()
let y : Int?

do {
    y = try someThrowFunction()
} catch {
    y = nil
}

// примеры преподавателя
func fetchData() -> Data? {
    if let data = try? fetchDataFromeDisk() {return data}
    if let data = try? fetchDataFromeServer() {return }
    return nil
}

// примеры преподавателя
try!

let loadPhoto = try! loadImage(atPath: "./Resourses/car.jpeg")
