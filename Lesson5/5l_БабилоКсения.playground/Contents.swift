import Foundation

enum EngineState {
    case on, off
}
enum DoorState {
    case open, close
}
enum WindowsUp {
    case up, down
}
enum Action {
    case loading(volume : Double)
    case unloading(volume : Double)
    case openDoors
    case closeDoors
    case startEngine
    case stopEngine
    case upBody
    case takeTurbo
}
//1
protocol Car {
    var carBrand: String { get }
    var releaseYear: Int { get }
    var maxVolumeTrunk: Double {get }
    var DoorState: DoorState {get set}
    var EngineState: EngineState {get set}
    var WindowsUp: WindowsUp {get set}
    
}
//2
extension Car {
    mutating func Doors(action: DoorState) {
        if action == .open {
            print("Двери открыты")
            self.DoorState = .open
        }else {
            print("Двери закрыты")
            self.DoorState = .close
        }
    }
    mutating func Engine(action: EngineState) {
        if action == .on {
            print("Двигатель запущен")
            self.EngineState = .on
        }else {
            print("Двигатель заглушен")
            self.EngineState = .off
        }
    }
    mutating func Windows(action: WindowsUp) {
        if action == .up {
            print("Окна подняты")
            self.WindowsUp = .up
        }else {
            print("Окна опущены")
            self.WindowsUp = .down
        }
    }
}
//3
class TrunkCar: Car {
    var carBrand: String
    
    var releaseYear: Int
    
    var maxVolumeTrunk: Double
    
    var DoorState: DoorState = .close
    
    var EngineState: EngineState = .off
    
    var WindowsUp: WindowsUp = .up
    enum BodyState {
        case up, down
    }
    var bodyState: BodyState = .down
    init(carBrand: String, releaseYear: Int, maxVolumeTrunk: Double) {
        self.carBrand = carBrand
        self.releaseYear = releaseYear
        self.maxVolumeTrunk = maxVolumeTrunk
    }

}
class SportCar: Car {
    var carBrand: String
    
    var releaseYear: Int
    
    var maxVolumeTrunk: Double
    
    var DoorState: DoorState = .close
    
    var EngineState: EngineState = .off
    
    var WindowsUp: WindowsUp = .up
    enum Turbo {
        case yes, no
    }
    var turbo: Turbo = .yes
    init(carBrand: String, releaseYear: Int, maxVolumeTrunk: Double) {
        self.carBrand = carBrand
        self.releaseYear = releaseYear
        self.maxVolumeTrunk = maxVolumeTrunk
    }
    
    
}
//4
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки: \(carBrand), год выпуска: \(releaseYear), максимальный объем багажника: \(maxVolumeTrunk), \(DoorState), \(EngineState), \(WindowsUp), \(bodyState)"
    }
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return "Автомобиль марки: \(carBrand), год выпуска: \(releaseYear), максимальный объем багажника: \(maxVolumeTrunk), \(DoorState), \(EngineState), \(WindowsUp), \(turbo)"
    }
}
//5
var bmw = SportCar(carBrand: "BMW", releaseYear: 2019, maxVolumeTrunk: 400.0)
bmw.Windows(action: .down)
bmw.Doors(action: DoorState.close)
bmw.Engine(action: .on)
print(bmw)
var gazel = TrunkCar(carBrand: "LADA", releaseYear: 2020, maxVolumeTrunk: 1000.0)
gazel.Windows(action: .up)
gazel.Doors(action: .close)
gazel.Engine(action: .off)
print(gazel)
