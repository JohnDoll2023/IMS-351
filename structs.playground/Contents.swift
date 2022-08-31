import UIKit

var greeting = "Hello, playground"

struct Person {
    var hairColor: String
    var birthMonth: Int
    var lastName: String
    var numberOfHB = 100
    
    mutating func heartBeat() {
        print("thump thump")
        numberOfHB -= 1
        if (numberOfHB < 0) {
            print("you are dead")
        }
    }
    
    mutating func changeHairToBlond() {
        hairColor = "blond"
    }
    
    func tellHairColor() {
        print(hairColor)
    }
}

var john = Person(hairColor: "brown", birthMonth: 1, lastName: "Doll")

john.changeHairToBlond()
john.tellHairColor()

john.heartBeat()
john.heartBeat()
