import UIKit
// Практическое задание 7
/*
 1. Придумать класс, методы которого могут создавать непоправимые ошибки. Реализовать их с помощью try/catch.
 
 2. Придумать класс, методы которого могут завершаться неудачей. Реализовать их с использованием Error.
 */

enum TicketError: Error {
    case invalideSelection // неверный выбор
    case outOfStock // распродано
    case insufficientFunds(moneyNeeded: Int) // недостаточно средств
}

struct ticket {
    var price: Int
    var count: Int
    let product: Product
}

struct Product{
    let name: String
}

// > 1 <
class RZD_Ticket {
    var train = [
        "068Ы": ticket(price: 10_988, count: 100, product: Product(name: "068Ы")),
        "096Н": ticket(price: 7_955, count: 59, product: Product(name: "096Н")),
        "005МЯ": ticket(price: 7_012, count: 0, product: Product(name: "005МЯ"))
    ]
    
    var moneyDeposied = 0
    
    func buy(ticketNames name: String) throws -> Product {
        // защита от неправильного выбора спекталя
        guard let ticket = train[name] else {
            throw TicketError.invalideSelection
        }
        // защита на наличие билетов
        guard ticket.count > 0 else {
            throw TicketError.outOfStock
        }
        // защита на нехватку денег
        guard ticket.price <= moneyDeposied else {
            throw TicketError.insufficientFunds(moneyNeeded: ticket.price - moneyDeposied)
        }
        
        moneyDeposied -= ticket.price
        
        var newTicket = ticket
        newTicket.count -= 1
        train[name] = newTicket
        
        return newTicket.product
    }
}
let trainTicket = RZD_Ticket()
do {
    let trainTicket1 = try trainTicket.buy(ticketNames: "005")
} catch TicketError.invalideSelection {
    print("Билеты на поезд отсутсвуют в продаже")
} catch TicketError.outOfStock {
    print("Билеты на поезд закончились")
} catch TicketError.insufficientFunds(let coinsNeeded) {
    print("Введенная сумма недостаточна. Необходимо еще \(coinsNeeded) монет")
} catch let error {
    print(error)
}

// > 2 <
class TicketMachine {
    var event = [
        "Мастер и Маргарита": ticket(price: 600, count: 100, product: Product(name: "Мастер и Маргарита")),
        "Лебединое озеро": ticket(price: 800, count: 59, product: Product(name: "Лебединое озеро")),
        "Юнона и Авось": ticket(price: 2000, count: 0, product: Product(name: "Юнона и Авось"))
    ]
    
    var moneyDeposied = 600
    
    func sell(ticketNames name: String) -> (Product?, TicketError?){
        // защита от неправильного выбора спекталя
        guard let ticket = event[name] else {
             return (nil, TicketError.invalideSelection)
        }
        // защита на наличие билетов
        guard ticket.count > 0 else {
             return (nil, TicketError.outOfStock)
        }
        // защита на нехватку денег
        guard ticket.price <= moneyDeposied else {
             return (nil, TicketError.insufficientFunds(moneyNeeded: ticket.price - moneyDeposied))
        }
        
        moneyDeposied -= ticket.price
        
        var newTicket = ticket
        newTicket.count -= 1
        event[name] = newTicket
        
        return (newTicket.product, nil)
    }
}

let sellEvent = TicketMachine()
let event1 = sellEvent.sell(ticketNames: "Мастер и Маргарита")   // nil, invalidSelection - если ticketNames: "Ревизор"
let event2 = sellEvent.sell(ticketNames: "Лебединое озеро") // nil, (insufficientFunds, 12)
let event3 = sellEvent.sell(ticketNames: "Юнона и Авось") // nil, outOfStock
if let product = event3.0 {
    print("Мы купили билеты на: \(product.name)")
} else if let error = event3.1 {
    print("Произошла ошибка: \(error)")
}

