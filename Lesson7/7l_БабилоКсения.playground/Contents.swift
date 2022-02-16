import UIKit

enum accountError: Error {
    case noMoney
}

class account: CustomStringConvertible {
    var description: String {
        return "Баланс: \(money)"
    }
    
    var money: Double
    init(value: Double){
        money = value
    }
    func check(summ: Double) throws -> Bool? {
        if money - summ >= 0{
            money -= summ
            return true
        }
        throw accountError.noMoney
    }
}

var accmine = account(value:6000.0)
let summ = 9000.0
if let a = try accmine.check(summ: summ) {
    print("Списано: \(summ)")
}

let summ1 = 500.0
do {
    try accmine.check(summ: summ1)
    print ("Списано еще: \(summ1)")
} catch accountError.noMoney{
    print("Недостаточно денег")
}
print(accmine)
