import UIKit

struct queue<T: Comparable> {
    var datas = [T] ()
    mutating func addOne(data: T) {
        datas.append(data)
    }
    mutating func load() -> T {
        print("Now this data: \(datas.first!)")
        return datas.removeFirst()
    }
    subscript (index: Int) -> T? {
        if index >= datas.count {
            return nil
        }
        return datas[index]
    }
    func filter(filter: (T) -> Bool) -> queue<T> {
        var result = queue<T>()
        for i in datas {
            if filter(i){
                result.addOne(data: i)
            }
        }
        return result
    }
    func sorted(comparator: (T, T) -> Bool) -> queue<T> {
        var result = queue<T>()
        for i in datas.sorted(by: comparator) {
            result.addOne(data: i)
        }
        return result
    }
    
}
var idData = queue<Int> ()
idData.addOne(data: 12345)
idData.addOne(data: 6789)
idData.addOne(data: 56754)
idData.addOne(data: 32)
idData.addOne(data: 9856)
idData.load()
print(idData.filter(filter: {$0 < 10000}))
print(idData.sorted(comparator: {$0 < $1}))
print(idData[0])
print(idData[10])

var nameData = queue<String> ()
nameData.addOne(data: "AmAmAm")
nameData.addOne(data: "OmNomNom")
nameData.addOne(data: "kukareku")
nameData.addOne(data: "blablabla")
nameData.addOne(data: "ronDonDon")
nameData.load()
print(nameData.filter(filter: {$0.contains("a")}))
print(nameData.sorted(comparator: {$0 < $1}))
print(nameData[0])
print(nameData[10])

