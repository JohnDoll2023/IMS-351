//
//  ViewController.swift
//  Dice Lookup
//
//  Created by John Doll on 9/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    struct singleDie {
        var numberOfFaces =  6
        var faceUp: Int
        
        mutating func rollDie() {
            faceUp = Int(arc4random_uniform(UInt32(numberOfFaces))+1)
        }
    }
    
    var firstDie = singleDie(numberOfFaces: 6, faceUp: 1)
    
    var secondDie = singleDie(numberOfFaces: 6, faceUp: 1)
    
    @IBOutlet weak var rollLabel: UILabel!
    
    @IBOutlet weak var firstDieLabel: UILabel!
    
    @IBOutlet weak var secondDieLabel: UILabel!
    
    @IBAction func rollDie(_ sender: Any) {
        firstDie.rollDie()
        firstDieLabel.text = String(firstDie.faceUp)
        secondDie.rollDie()
        secondDieLabel.text = String(secondDie.faceUp)
        if (firstDie.faceUp == 1) {
            if (secondDie.faceUp == 1) {
                rollLabel.text = "Snake Eyes"
            }
            if (secondDie.faceUp == 2) {
                rollLabel.text = "Australian Yo"
            }
            if (secondDie.faceUp == 3) {
                rollLabel.text = "Little Joe from Kokomo"
            }
            if (secondDie.faceUp == 4) {
                rollLabel.text = "No field five"
            }
            if (secondDie.faceUp == 5) {
                rollLabel.text = "Easy Six"
            }
            if (secondDie.faceUp == 6) {
                rollLabel.text = "Six one you're done"
            }
        } else if (firstDie.faceUp == 2) {
            if (secondDie.faceUp == 1) {
                rollLabel.text = "Ace caught a duece"
            }
            if (secondDie.faceUp == 2) {
                rollLabel.text = "Ballerina"
            }
            if (secondDie.faceUp == 3) {
                rollLabel.text = "The fever"
            }
            if (secondDie.faceUp == 4) {
                rollLabel.text = "Jimmie Hicks"
            }
            if (secondDie.faceUp == 5) {
                rollLabel.text = "Benny Blue"
            }
            if (secondDie.faceUp == 6) {
                rollLabel.text = "Easy Eight"
            }
        } else if (firstDie.faceUp == 3) {
            if (secondDie.faceUp == 1) {
                rollLabel.text = "Easy four"
            }
            if (secondDie.faceUp == 2) {
                rollLabel.text = "OJ"
            }
            if (secondDie.faceUp == 3) {
                rollLabel.text = "Brooklyn Forest"
            }
            if (secondDie.faceUp == 4) {
                rollLabel.text = "Big Red"
            }
            if (secondDie.faceUp == 5) {
                rollLabel.text = "Eighter from Decatur"
            }
            if (secondDie.faceUp == 6) {
                rollLabel.text = "Nina from Pasadena"
            }
        } else if (firstDie.faceUp == 4) {
            if (secondDie.faceUp == 1) {
                rollLabel.text = "Little Phoebe"
            }
            if (secondDie.faceUp == 2) {
                rollLabel.text = "Easy six"
            }
            if (secondDie.faceUp == 3) {
                rollLabel.text = "Skinny McKinney"
            }
            if (secondDie.faceUp == 4) {
                rollLabel.text = "Square Pair"
            }
            if (secondDie.faceUp == 5) {
                rollLabel.text = "Railroad nine"
            }
            if (secondDie.faceUp == 6) {
                rollLabel.text = "Big one on the end"
            }
        } else if (firstDie.faceUp == 5) {
            if (secondDie.faceUp == 1) {
                rollLabel.text = "Sixie from Dixie"
            }
            if (secondDie.faceUp == 2) {
                rollLabel.text = "Skinny Dugan"
            }
            if (secondDie.faceUp == 3) {
                rollLabel.text = "Easy Eight"
            }
            if (secondDie.faceUp == 4) {
                rollLabel.text = "Jesse James"
            }
            if (secondDie.faceUp == 5) {
                rollLabel.text = "Puppy Paws"
            }
            if (secondDie.faceUp == 6) {
                rollLabel.text = "Yo"
            }
        } else if (firstDie.faceUp == 6) {
            if (secondDie.faceUp == 1) {
                rollLabel.text = "The Devil"
            }
            if (secondDie.faceUp == 2) {
                rollLabel.text = "Easy Eight"
            }
            if (secondDie.faceUp == 3) {
                rollLabel.text = "Lou Brown"
            }
            if (secondDie.faceUp == 4) {
                rollLabel.text = "Tennessee"
            }
            if (secondDie.faceUp == 5) {
                rollLabel.text = "Six five no jive"
            }
            if (secondDie.faceUp == 6) {
                rollLabel.text = "Midnight"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstDieLabel.text = ""
        secondDieLabel.text = ""
        rollLabel.text = ""
    }
}
