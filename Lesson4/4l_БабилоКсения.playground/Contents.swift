import Foundation

enum EngineState {
    case on, off
}
enum DoorState {
    case open, close
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
class Car {
    let carBrand: String
    let releaseYear: Int
    let maxVolumeTrunk: Double
    var engineState: EngineState = .off
    var doorState: DoorState = .close
    var currentVolumeTrunk: Double = 0.0
    
    init(carBrand: String, releaseYear: Int, maxVolumeTrunk: Double) {
        self.carBrand = carBrand
        self.releaseYear = releaseYear
        self.maxVolumeTrunk = maxVolumeTrunk
    }
    
    func doAction(action: Action) {
        
    }
    func description() {
        print("Автомобиль бренд:  \(carBrand), год выпуска: \(releaseYear), обьем кузова: \(maxVolumeTrunk)")
    }
}
class TrunkCar: Car {
    enum BodyState {
        case up, down
    }
    var bodyState: BodyState = .down
    override func doAction(action: Action) {
        switch action {
        case .upBody:
            if bodyState == .up {
                print("Кузов уже поднят")
            } else {
                print("Кузов поднимается")
                bodyState = .up
            }
        case .takeTurbo:
            print("у грузовика нет педали ускорения")
        default:
            break
        }
    }
    
    override func description() {
        super.description()
        print("У грузовика кузов \(bodyState)")
    }
}
class SportCar: Car {
    enum Turbo {
        case yes, no
    }
    var turbo: Turbo = .yes
    override func doAction(action: Action) {
        switch action {
        case .upBody:
                print("У машины неподьемный кузов")
        case .takeTurbo:
            if turbo == .yes {
                print("у машины есть педаль ускорения")
            } else {
                print("у машины нет педали ускорения")
            }
            
        default:
            break
        }
    }
    override func description() {
        super.description()
        print("У машины есть педаль ускорения: \(turbo)")
    }
}

var bmw = SportCar(carBrand: "BMW", releaseYear: 2000, maxVolumeTrunk: 400)
bmw.doAction(action: .upBody)
bmw.turbo = .no
bmw.description()

var gazel = TrunkCar(carBrand: "WAZ", releaseYear: 2020, maxVolumeTrunk: 1100)
gazel.doAction(action: .upBody)
gazel.doAction(action: .takeTurbo)
gazel.description()
