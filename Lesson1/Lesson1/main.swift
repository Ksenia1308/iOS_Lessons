import Foundation

//Квадратное уравнение

var a = 6.0
var b = 44.0
var c = 14.0

var d = b * b - (4 * a * c)  //находим дискриминант

if d > 0 { //если дискриминант больше 0
    let x1 = (-1 * b) + sqrt(d)
    let x2 = (-1 * b) - sqrt(d)
    
    print("x1 = " + String(x1) + ", x2 = " + String(x2))
}
else if d == 0 { //если дискриминант равен 0
    let x = (-1 * (b / (2 * a)))
    print("x = " + String(x))
}
else { //в остальных случаях
    print("Корней на множестве действительных числе нет")
}

//Найти площадь, периметр и гипотенузу треугольника

a = 8.0
b = 13.0
//с - нужно найти
c = sqrt(a * a + b * b) //гипотенуза
let p = a + b + c //периметр
let s = (1/2) * a * b //площадь

print("Гипотенуза треугольника равна " + String(c) + ". Периметр треугольника равен " + String(p) + ". Площадь треугольника равна " + String(s))

// Найти сумму вклада через 5 лет

var sum = 100_000.0 //сумма вклада
var pr = 5.8 //годовой процент
let numPr = pr/100 //перевод процента в число
let year1 = sum * numPr + sum //сумма вклада через 1 год
let year2 = year1 * numPr + year1 //сумма вклада через 2 года
let year3 = year2 * numPr + year2 //сумма вклада через 3 года
let year4 = year3 * numPr + year3 //сумма вклада через 4 года
let year5 = year4 * numPr + year4 //сумма вклада через 5 лет

print("Сумма вклада через 5 лет составит: " + String(year5))
