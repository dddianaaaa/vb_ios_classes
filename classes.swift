import UIKit

class Worker {
    var name: String
    var age : Int
    init(_ name: String,_ age: Int){
            self.name = name
            self.age = age
       }
}
class Engineer :Worker{
    var expirience : Int
    init(exp: Int, name: String, age : Int) {
        self.expirience = exp
        super.init(name, age)
    }
}

class Director : Worker{
    var isQulified : Bool
    init( isQulified: Bool,name: String,age: Int){
        self.isQulified = isQulified
        super.init(name ,age)
    }
}

class House{
    var width : Int
    var lenght : Int
    var height : Int
    init(_ width :Int ,_ lenght : Int,_ height : Int ) {
        self.width = width
        self.lenght = lenght
        self.height = height
    }
    func create(){
        print("square equals \(width * lenght * height)")
    }
    func destroy(){
        self.width = 0
        self .lenght = 0
        self.height = 0
        print("House was succesfully destroyed width = \(width) lenght = \(lenght) height = \(height)")
    }
}
var house  = House(35,40,20)
house.create()
house.destroy()
print(house.width)

class Group{
    var pupils : [String]
    init(pupils: [String]){
        self.pupils = pupils
    }
    func info(){
        var tempPupils = self.pupils
        for name in tempPupils{
            print(name)
        }
    }
    func sortByAlphabet(){
        self.pupils.sort()
    }
    func sortByLongName(){
        self.pupils.sort(by: {$0.count > $1.count})
    }
}
var names = ["Vika","Masha","Alex"]
var classG = Group(pupils: names)
classG.info()
classG.sortByAlphabet()
classG.info()
classG.sortByLongName()
classG.info()

//difference between class and struct
class HumanClass{
    var height: Int
    var age :Int
    init(height: Int, age: Int){ //in structure we dont need to write a initializer
        self.height = height
        self.age = age
    }
}

struct HumanStruct{
    var height : Double
    var age : Int
    mutating func birthday(){ //if we want to write a method in sctucture we need to put prefix mutating before func
        self.age+=1
        print("I'm \(age) years of age")
    }
}
var human = HumanStruct(height: 185,age: 18)
human.age = 25 // in structure we can change value ONLY when object var and value var. //But in class it doesnt matter
human.birthday()


var humanCl1 = HumanClass(height: 180,age: 15)
var humanCl2 = humanCl1
humanCl2.age = 56
print(humanCl1.age) //as we can see below we changed object's field but ALSO changed humanCl1 beacuse classes in swift have reference type
//lets try the same with structures
var humanSt1 = HumanStruct(height: 150, age: 16)
var humanSt2 = humanSt1
humanSt1.height = 170
print(humanSt2.height) // as we can see we did the same but it doesnt worked because Struct in swift has value type so it's just copying values in other object, in the other hand classes refers values
//▸ Напишите простую программу, которая отбирает комбинации в покере из рандомно выбранных 5 карт
//▸ Сохраняйте комбинации в массив
//▸ Если выпала определённая комбинация - выводим соответствующую запись в консоль
//▸ Результат в консоли примерно такой: 'У вас бубновый стрит флеш'.


class Combination{
//    enum mast : String{ wanted to do with enums but didnt invented method
//        case spade = "Spade"
//        case Diamonds = "diamonds"
//        case Clubs = "Clubs"
//        case Hearts = "Hearts"
//    }
//    enum value :String{
//        case A = "Ace"
//        case K = "King"
//        case Q = "Queen"
//        case J = "Jack"
//        case ten = "10"
//        case nine = "9"
//        case eight = "8"
//        case seven = "7"
//        case six = "6"
//        case five = "5"
//        case four = "4"
//        case three = "3"
//        case two = "2"
//    }
    var card = Array(repeating: Array(repeating: 0, count: 13), count: 4)
    func getCards(){
        for i in 0...3{
            for j in 0...12{
                self.card[i][j]+=1
            }
        }
    }
    func getCombination(){
        var rank: Int
        var value :Int
        var cards = Array(repeating: Array(repeating: 0, count: 2), count: 5)

        for i in 0...4{
            rank = Int.random(in:0...3)
            value = Int.random(in: 0...12)
            while(self.card[rank][value] == 0){
                rank = Int.random(in:0...3)
                value = Int.random(in: 0...12)
        }
            self.card[Int.random(in:0...3)][Int.random(in: 0...12)]-=1
            cards[i][0] = rank
            cards[i][1] = value
            if(cards[i][0] == 0){
                print("Spade \(cards[i][1])")
            }
            else if(cards[i][0] == 1){
                print("diamonds \(cards[i][1])")
            }
            else if(cards[i][0] == 2){
                print("clubs \(cards[i][1])")
            }
            else if(cards[i][0] == 3){
                print("hearts \(cards[i][1])")
            }
    }
        for i in 0...4{
            var k = i+1
            for j in k...4{
                if(cards[i][1] == cards[j][1]){
                    print("You have a pair")
                }
                //have to write other case
            }
        }
        
    
    
    
}
}
var table = Combination()
table.getCards()
table.getCombination()

//class Student {
//    var name : String
//    var age : Int
//    init(){
//        name = "Undefined"
//        age = 20
//    }
//    init(_ name: String,_ age: Int){
//        self.name = name
//        self.age = age
//    }
//}
//struct StudentSctruct{
//    var name: String
//    var age: Int
//}
//let student = Student("Alex", 20)
//var studentClass = student
//studentClass.name = "Vasya"
//studentClass.age = 20
//print(student.name,student.age)
//
//let student2 = StudentSctruct(name: "Bob", age: 15)

//class Account{
//    var sum: Double
//    var rate : Double = 0.01
//
//    var profit: Double{
//        get{
//            return sum+sum*rate
//        }
//        set(newValue){
//            self.sum = newValue / (1+rate)
//        }
//    }
//    init(sum: Double,rate: Double){
//        self.sum = sum
//        self.rate = rate
//    }
//}
//let acc = Account(sum: 300,rate: 0.1)
//print(acc.profit)
//acc.profit = 1000
//print(acc.sum)



