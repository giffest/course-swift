import UIKit

// Практическое задание 4
/*
 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
 
 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
 
 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
 
 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
 
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 
 6. Вывести значения свойств экземпляров в консоль.
*/

class Car {
    enum engineState: String {
        case Start, Stop
    }
    enum windowState: String {
        case Open, Close
    }
    
    let brand: String
    let color: UIColor
    let yearManuf: Int
    let trunkVol: Int
    let Media: Bool
    let transmission: String
    let disk: Double
    let ABS: Bool
    let ESP: Bool
    let RSC: Bool
    let HSA: Bool
    let LAC: Bool
    let ROM: Bool
    var km: Double
    var engineSt: engineState = .Stop
    var windowSt: windowState = .Close
    var doorState: String
    var trunckState: String
    
    init(brand: String, color: UIColor, yearManuf: Int, trunkVol: Int, Media: Bool, transmission: String, disk: Double, ABS: Bool, ESP: Bool, RSC: Bool, HSA: Bool, LAC: Bool, ROM: Bool, km: Double, engineSt: engineState, windowSt: windowState, doorState: String, trunckState: String) {
        self.brand = brand
        self.color = color
        self.yearManuf = yearManuf
        self.trunkVol = trunkVol
        self.Media = Media
        self.transmission = transmission
        self.disk = disk
        self.ABS = ABS
        self.ESP = ESP
        self.RSC = RSC
        self.HSA = HSA
        self.LAC = LAC
        self.ROM = ROM
        self.km = km
        self.engineSt = engineSt
        self.windowSt = windowSt
        self.doorState = doorState
        self.trunckState = trunckState
    }
    
    func startEngine() {
        self.engineSt = .Start
    }
    func stopEngine() {
        self.engineSt = .Stop
    }
    func openState() {
        self.windowSt = .Open
    }
    func closeState() {
        self.windowSt = .Close
    }
    func discription() {
        print("Машина \(brand), \(yearManuf) года выпуска \nобъемом багажника \(trunkVol)\nдвигатель: \(engineSt), окна: \(windowSt)\n")
    }
}

class truckCar: Car {
    enum cargoTruck: String {
        case Open, Close
    }
    var openTruck: cargoTruck = .Close
    init(brand: String, color: UIColor, yearManuf: Int, trunkVol: Int, Media: Bool, transmission: String, disk: Double, ABS: Bool, ESP: Bool, RSC: Bool, HSA: Bool, LAC: Bool, ROM: Bool, km: Double, engineSt: engineState, windowSt: windowState, doorState: String, trunckState: String, openTruck: cargoTruck) {
        self.openTruck = openTruck
        super.init(brand: brand, color: color, yearManuf: yearManuf, trunkVol: trunkVol, Media: Media, transmission: transmission, disk: disk, ABS: ABS, ESP: ESP, RSC: RSC, HSA: HSA, LAC: LAC, ROM: ROM, km: km, engineSt: engineSt, windowSt: windowSt, doorState: doorState, trunckState: trunckState)
    }
    func openCargo() {
        openTruck = .Open
    }
    func closeCargo() {
        openTruck = .Close
    }
    override func discription() {
        print("Машина \(brand), \(yearManuf) года выпуска \nобъемом багажника \(trunkVol)\nдвигатель: \(engineSt), окна: \(windowSt)\nкузов: \(openTruck)\n")
    }
}

class sportCar: Car {
    enum roofCar: String {
        case Open, Close
    }
    var openRoofCar: roofCar = .Close
    init(brand: String, color: UIColor, yearManuf: Int, trunkVol: Int, Media: Bool, transmission: String, disk: Double, ABS: Bool, ESP: Bool, RSC: Bool, HSA: Bool, LAC: Bool, ROM: Bool, km: Double, engineSt: engineState, windowSt: windowState, doorState: String, trunckState: String, openRoofCar: roofCar) {
        self.openRoofCar = openRoofCar
        super.init(brand: brand, color: color, yearManuf: yearManuf, trunkVol: trunkVol, Media: Media, transmission: transmission, disk: disk, ABS: ABS, ESP: ESP, RSC: RSC, HSA: HSA, LAC: LAC, ROM: ROM, km: km, engineSt: engineSt, windowSt: windowSt, doorState: doorState, trunckState: trunckState)
    }
    func openRoof() {
        openRoofCar = .Open
    }
    func closeRoof() {
        openRoofCar = .Close
    }
    override func discription() {
        print("Машина \(brand), \(yearManuf) года выпуска \nобъемом багажника \(trunkVol)\nдвигатель: \(engineSt), окна: \(windowSt)\nкрыша: \(openRoofCar)\n")
    }
}

var car1 = Car(brand: "Ford", color: .black, yearManuf: 2017, trunkVol: 595, Media: true, transmission: "Auto", disk: 20, ABS: true, ESP: true, RSC: true, HSA: true, LAC: false, ROM: false, km: 0.0, engineSt: .Start, windowSt: .Close, doorState: "Closed", trunckState: "Half")
car1.discription()
var car2 = sportCar(brand: "Ferrari", color: .black, yearManuf: 2017, trunkVol: 595, Media: true, transmission: "Auto", disk: 20, ABS: true, ESP: true, RSC: true, HSA: true, LAC: false, ROM: false, km: 0.0, engineSt: .Start, windowSt: .Close, doorState: "Closed", trunckState: "Half", openRoofCar: .Close)
car2.discription()
var car3 = truckCar(brand: "Kamaz", color: .white, yearManuf: 2011, trunkVol: 3500, Media: true, transmission: "manual", disk: 20, ABS: true, ESP: true, RSC: true, HSA: true, LAC: false, ROM: false, km: 0.0, engineSt: .Start, windowSt: .Close, doorState: "Closed", trunckState: "Half", openTruck: .Close)
car3.discription()
car2.openRoofCar = .Open
car2.discription()
car3.openTruck = .Open
car3.discription()
