import UIKit

print("John Doll")

var fName = "John"
var lName = "Doll"
print("\(fName) \(lName)")

struct Player {
    var characterName: String
    var strength: Int
    var intelligence: Int
    var wisdom: Int
    var dexterity: Int
    var Constitution: Int
    var charisma: Int
    var characterItems: String
    var catchPhrase: String
    var currentHP: Int
    var maxHP: Int
    
    func getCurrentHP() {
        print("Your current HP is \(currentHP)")
    }
    
    func sayCatchPhrase() {
        print("\(catchPhrase)")
    }
    
    mutating func minorDamage() {
        currentHP -= 5
        if (currentHP < 0) {
            currentHP = 0
            print("Player died")
        }
    }
    
    mutating func majorDamage() {
        currentHP -= 25
        if (currentHP < 0) {
            currentHP = 0
            print("Player died")
        }
    }
    
    mutating func healthPack() {
        currentHP += 15
        if (currentHP > maxHP) {
            currentHP = maxHP
        }
        print("Current HP is now \(currentHP)")
    }
    
    mutating func healthRestore() {
        currentHP = maxHP
        print("Current HP is now \(currentHP)")
    }
}

var hero = Player(characterName: "Rumble McSkirmishh", strength: 18, intelligence: 5, wisdom: 3, dexterity: 15, Constitution: 18, charisma: 10, characterItems: "Red headband", catchPhrase: "Fireball! Upper cut! Downer cut! Bowl of punch!", currentHP: 138, maxHP: 145)

hero.sayCatchPhrase()
