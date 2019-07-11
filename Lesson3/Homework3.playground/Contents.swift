import UIKit

// Практическое задание 3
/* 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 
 6. Вывести значения свойств экземпляров в консоль.
 */

// 1. Произвольное описание структру легкового и грузового авто

///* закоментировано для выполнения второй задачи
struct Explorer {
    let color: UIColor
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
    var doorState: String
}
 
struct Transit {
    let color: UIColor
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
    var doorState: String
}

var car = Explorer(color: .black, Media: true, transmission: "auto", disk: 20, ABS: true, ESP: true, RSC: true, HSA: true, LAC: false, ROM: false, km: 0.0, doorState: "closed")
var truck = Transit(color: .white, Media: true, transmission: "manual", disk: 16, ABS: true, ESP: true, RSC: false, HSA: true, LAC: true, ROM: true, km: 0.0, doorState: "closed")


// 2.
struct Explorer2 {
    let brand: String // марка
    let color: UIColor
    let yearManuf: Int // год производства
    let trunkVol: Int // объем багажника
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
    var engineState: String // статус работы двигателя
    var windowState: String // статус открытия окон
    var doorState: String
    var trunckState: String // статус заполненности багажника
}

struct Transit2 {
    let brand: String // марка
    let color: UIColor
    let yearManuf: Int // год производства
    let trunkVol: Int // объем багажника
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
    var engineState: String // статус работы двигателя
    var windowState: String // статус открытия окон
    var doorState: String
    var trunckState: String // статус заполненности багажника
}

var car2 = Explorer2(brand: "Ford", color: .black, yearManuf: 2017, trunkVol: 595, Media: true, transmission: "Auto", disk: 20, ABS: true, ESP: true, RSC: true, HSA: true, LAC: false, ROM: false, km: 0.0, engineState: "Start", windowState: "Closed", doorState: "Closed", trunckState: "Half")
var truck2 = Transit2(brand: "Ford", color: .white, yearManuf: 2015, trunkVol: 4500, Media: true, transmission: "Manual", disk: 16, ABS: true, ESP: true, RSC: false, HSA: true, LAC: true, ROM: true, km: 0.0, engineState: "Stop", windowState: "Open", doorState: "Closed", trunckState: "Full")

// 3.

enum engineState: String {
    case Start = "Запустить двигатель"
    case Stop = "Заглушить двигатель"
}

enum windowState: String {
    case Open = "Открыть окна"
    case Close = "Закрыть окна"
}

enum cargoCar {
    case valueCargo(weight: Int)
    case actionCargo(action: Action, place: Place)
    
    enum Action: String {
        case load = "Погрузка"
        case upload = "Выгрузка"
    }
    enum Place: String {
        case body = "Кузов"
        case truck = "Багажник"
    }
}

// 4.
struct Explorer4 {
    let brand: String // марка
    let color: UIColor
    let yearManuf: Int // год производства
    let trunkVol: Int // объем багажника
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
    var engineState: engineState // статус работы двигателя
    var windowState: windowState // статус открытия окон
    var doorState: String
    var trunckState: String // статус заполненности багажника
    
    mutating func startEngine() {
        self.engineState = .Start
    }
    mutating func stopEngine() {
        self.engineState = .Stop
    }
    mutating func openState() {
        self.windowState = .Open
    }
    mutating func closeState() {
        self.windowState = .Close
    }
    func discription() {
        print("Машина \(self.brand) \(self.yearManuf) года выпуска с объемом багажника \(self.trunkVol), двигатель: \(self.engineState), окна: \(self.windowState)\n")
    }
}
struct Transit4 {
    let brand: String // марка
    let color: UIColor
    let yearManuf: Int // год производства
    let trunkVol: Int // объем багажника
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
    var engineState: engineState // статус работы двигателя
    var windowState: windowState // статус открытия окон
    var doorState: String
    var trunckState: String // статус заполненности багажника
    
    mutating func startEngine() {
        self.engineState = .Start
    }
    mutating func stopEngine() {
        self.engineState = .Stop
    }
    mutating func openState() {
        self.windowState = .Open
    }
    mutating func closeState() {
        self.windowState = .Close
    }
    func discription() {
        print("Машина \(self.brand) \(self.yearManuf) года выпуска с объемом багажника \(self.trunkVol), двигатель: \(self.engineState), окна: \(self.windowState)\n")
    }
}


// 5.
var car5 = Explorer4(brand: "Ford", color: .black, yearManuf: 2017, trunkVol: 595, Media: true, transmission: "Auto", disk: 20, ABS: true, ESP: true, RSC: true, HSA: true, LAC: false, ROM: false, km: 0.0, engineState: .Start, windowState: .Close, doorState: "Closed", trunckState: "Half")
var truck5 = Transit4(brand: "Ford", color: .white, yearManuf: 2015, trunkVol: 4500, Media: true, transmission: "Manual", disk: 16, ABS: true, ESP: true, RSC: false, HSA: true, LAC: true, ROM: true, km: 0.0, engineState: .Stop, windowState: .Open, doorState: "Closed", trunckState: "Full")
car5.engineState = .Stop
truck5.windowState = .Close
car5.discription()
truck5.discription()

// варианты решения из примеров
import Foundation

enum VehicleType: CustomStringConvertible {
    case passengerCar, truck
    
    var description: String {
        switch self {
        case .passengerCar:
            return "🚗"
        case .truck:
            return "🚛"
        }
    }
}

enum EngineStatus: CustomStringConvertible {
    case on, off
    
    var description: String {
        switch self {
        case .on:
            return "Двигатель заведён"
        case .off:
            return "Двигатель заглушен"
        }
    }
}

enum WindowsStatus: CustomStringConvertible {
    case opened, closed
    
    var description: String {
        switch self {
        case .opened:
            return "Окна открыты"
        case .closed:
            return "Окна закрыты"
        }
    }
}

enum Action {
    case switchEngine(EngineStatus)
    case switchWindows(WindowsStatus)
    case loadCargo(Double)
}

struct Vehicle: CustomStringConvertible {
    let type: VehicleType
    let brand: String
    let productionYear: Int
    let maxCargoSpace: Double
    var engine: EngineStatus = .off
    var windows: WindowsStatus = .closed
    var currentCargoSpace: Double = 0
    
    var description: String {
        return "\(type) \(brand)\nГод выпуска: \(productionYear)\nСостояние: \(engine) | \(windows) | Загрузка \(currentCargoSpace)/\(maxCargoSpace)\n"
    }
    
    init(type:VehicleType, brand: String, productionYear:Int, maxCargoSpace:Double) {
        self.type = type
        self.brand = brand
        self.productionYear = productionYear
        self.maxCargoSpace = maxCargoSpace
    }
    
    mutating func perform(action: Action) {
        switch action {
        case .switchEngine(let status):
            engine = status
        case .switchWindows(let status):
            windows = status
        case .loadCargo(let load):
            let expectedLoad = load + currentCargoSpace
            switch expectedLoad {
            case _ where expectedLoad > maxCargoSpace:
                currentCargoSpace = maxCargoSpace
            case _ where expectedLoad < 0:
                currentCargoSpace = 0
            default:
                currentCargoSpace += load
            }
        }
    }
}

var honda = Vehicle(type: .passengerCar, brand: "Honda Civic", productionYear: 2017, maxCargoSpace: 15.1)
honda.perform(action: .loadCargo(7.6))
honda.perform(action: .loadCargo(-3))
honda.perform(action: .switchEngine(.on))
print(honda)

var manTruck = Vehicle(type: .truck, brand: "MAN LION PRO 640", productionYear: 2019, maxCargoSpace:3000)
manTruck.perform(action: .switchWindows(.opened))
manTruck.perform(action: .loadCargo(3001))
print(manTruck)

