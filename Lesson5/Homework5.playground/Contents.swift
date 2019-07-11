import UIKit
import Foundation

// Практическое задание 5
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести сами объекты в консоль.
*/

protocol BasicCar {
    var brand: String {get}
    var yearManuf: Int {get}
    var trunkVol: Int {get}

    var doorState: String {get}

    func startEngine() -> String
    func stopEngine() -> String
    func openCloseState() -> String
    func closeState() -> String
}

extension BasicCar {

    func startEngine() -> String {
        return "Start"
    }
    func stopEngine() -> String {
        return "Stop"
    }
    func openCloseState() -> String {
        return "Open"
    }
    func closeState() -> String {
        return "Close"
    }
}

class truckCar: BasicCar {
    var brand: String
    var yearManuf: Int
    var trunkVol: Int
    var doorState: String
    
    enum cargoTruck: String {
        case Open, Close
    }
    var openTruck: cargoTruck = .Close
    
    init(brand: String, yearManuf: Int, trunkVol: Int, doorState: String, openTruck: cargoTruck) {
        self.brand = brand
        self.yearManuf = yearManuf
        self.trunkVol = trunkVol
        self.doorState = doorState
        self.openTruck = openTruck
    }
    
    func openCargo() {
        openTruck = .Open
    }
    func closeCargo() {
        openTruck = .Close
    }
}

class sportCar: BasicCar {
    var brand: String
    var yearManuf: Int
    var trunkVol: Int
    var doorState: String
    
    enum roofCar: String {
        case Open, Close
    }
    var openRoofCar: roofCar = .Close
    
    init(brand: String, yearManuf: Int, trunkVol: Int, doorState: String, openRoofCar: roofCar) {
        self.brand = brand
        self.yearManuf = yearManuf
        self.trunkVol = trunkVol
        self.doorState = doorState
        self.openRoofCar = openRoofCar
    }
    
    func openRoof() {
        openRoofCar = .Open
    }
    func closeRoof() {
        openRoofCar = .Close
    }

}

extension truckCar: CustomStringConvertible {
    var description: String{
        return "Машина \(brand), \(yearManuf) года выпуска \nобъемом багажника \(trunkVol)\nбагажник: \(openTruck)\n"
    }
}

extension sportCar: CustomStringConvertible {
    var description: String{
        return "Машина \(brand), \(yearManuf) года выпуска \nобъемом багажника \(trunkVol)\nкрыша: \(openRoofCar)\n"
    }
}

var car1 = sportCar(brand: "Ferrari", yearManuf: 2017, trunkVol: 595, doorState: "Closed", openRoofCar: .Close)
print(car1)
var car2 = truckCar(brand: "Kamaz", yearManuf: 2011, trunkVol: 3500, doorState: "Closed", openTruck: .Close)
print(car2)
car1.openRoofCar = .Open
print(car1)
car2.openTruck = .Open
print(car2)
