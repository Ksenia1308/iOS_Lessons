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
}
struct SportCar {
    let carBrand: String
    let releaseYear: Int
    let maxVolumeTrunk: Double
    var engineState: EngineState = .off
    var doorState: DoorState = .close
    var currentVolumeTrunk: Double = 0.0
    
    mutating func doAction(action: Action) {
        switch action {
        case let .loading(volume):
            if doorState == .open {
                if currentVolumeTrunk + volume <= maxVolumeTrunk {
                    print("Погружено: \(volume)л")
                    currentVolumeTrunk += volume
                }
                else {
                    print("Груз превышает вместимость багажника. В багажнике места только на груз обьемом не больше: \(maxVolumeTrunk - currentVolumeTrunk)л")
                }
            } else {
                print("Сначала открой дверь, чтобы погрузить груз")
            }
        case let .unloading(volume):
            if doorState == .open {
                if currentVolumeTrunk - volume == 0 {
                    print("Выгружено все что было в багажнике: \(volume)л")
                } else if currentVolumeTrunk - volume > 0 {
                        currentVolumeTrunk -= volume
                        print("Осталось выгрузить: \(currentVolumeTrunk)л")
                } else {
                    print("В багажнике не такой большой груз, всего лишь: \(currentVolumeTrunk)л")
                }
            } else {
                print("Сначала открой дверь, чтобы погрузить груз")
            }
        case .openDoors:
            if doorState == .open {
                print("Двери уже открыты")
            } else {
                doorState = .open
                print("Двери открываются")
            }
        case .closeDoors:
            if doorState == .close {
                print("Двери уже зарыты")
            } else {
                doorState = .close
                print("Двери закрываются")
            }
        case .startEngine:
            if engineState == .on {
                print("Двигатель уже запущен")
            } else {
                engineState = .on
                print("Двигатель запущен")
            }
        case .stopEngine:
            if engineState == .off {
                print("Двигатель уже остановлен")
            } else {
                engineState = .on
                print("Двигатель выключен")
            }
    }
  }
}
struct TrunkCar {
    let carBrand: String
    let releaseYear: Int
    let maxVolumeTrunk: Double
    var engineState: EngineState = .off
    var doorState: DoorState = .close
    var currentVolumeTrunk: Double = 0.0
    
    mutating func doAction(action: Action) {
        switch action {
        case let .loading(volume):
            if doorState == .open {
                if currentVolumeTrunk + volume <= maxVolumeTrunk {
                    print("Погружено: \(volume)л")
                    currentVolumeTrunk += volume
                }
                else {
                    print("Груз превышает вместимость багажника. В багажнике места только на груз обьемом не больше: \(maxVolumeTrunk - currentVolumeTrunk)л")
                }
            } else {
                print("Сначала открой дверь, чтобы погрузить груз")
            }
        case let .unloading(volume):
            if doorState == .open {
                if currentVolumeTrunk - volume == 0 {
                    print("Выгружено все что было в багажнике: \(volume)л")
                } else if currentVolumeTrunk - volume > 0 {
                        currentVolumeTrunk -= volume
                        print("Осталось выгрузить: \(currentVolumeTrunk)л")
                } else {
                    print("В багажнике не такой большой груз, всего лишь: \(currentVolumeTrunk)л")
                }
            } else {
                print("Сначала открой дверь, чтобы погрузить груз")
            }
        case .openDoors:
            if doorState == .open {
                print("Двери уже открыты")
            } else {
                doorState = .open
                print("Двери открываются")
            }
        case .closeDoors:
            if doorState == .close {
                print("Двери уже зарыты")
            } else {
                doorState = .close
                print("Двери закрываются")
            }
        case .startEngine:
            if engineState == .on {
                print("Двигатель уже запущен")
            } else {
                engineState = .on
                print("Двигатель запущен")
            }
        case .stopEngine:
            if engineState == .off {
                print("Двигатель уже остановлен")
            } else {
                engineState = .on
                print("Двигатель выключен")
            }
    }
  }
}

var astonMartinVanquish = SportCar (carBrand: "Aston Martin", releaseYear: 2020, maxVolumeTrunk: 300.0)
astonMartinVanquish.doAction(action: .openDoors)
astonMartinVanquish.doAction(action: .loading(volume: 800))
astonMartinVanquish.doAction(action: .closeDoors)
astonMartinVanquish.doAction(action: .startEngine)

var audiR8 = SportCar (carBrand: "Audi", releaseYear: 2019, maxVolumeTrunk: 500, engineState: .off, doorState: .close, currentVolumeTrunk: 158)
audiR8.doAction(action: .openDoors)
audiR8.doAction(action: .unloading(volume: 200))
audiR8.doAction(action: .closeDoors)
audiR8.currentVolumeTrunk = 600

var hyundaiMighty = TrunkCar (carBrand: "Hyundai", releaseYear: 2018, maxVolumeTrunk: 1000, currentVolumeTrunk: 350.0)
hyundaiMighty.doAction(action: .unloading(volume: 242.0))

print(astonMartinVanquish, audiR8, hyundaiMighty)
