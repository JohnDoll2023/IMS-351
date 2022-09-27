//
//  ViewController.swift
//  DnDDice
//
//  Created by John Doll on 9/20/22.
//

import UIKit

class ViewController: UIViewController {

    var diceSides = 4
    
    @IBAction func diceRollButton(_ sender: Any) {
        diceOutput.text = String(Int(arc4random_uniform(UInt32(diceSides))+1))
    }
    @IBOutlet weak var diceControllerOutlet: UISegmentedControl!
    @IBOutlet weak var diceOutput: UILabel!

    @IBAction func diceController(_ sender: Any) {
//        diceSides = diceControllerOutlet.selectedSegmentIndex
        switch diceControllerOutlet.selectedSegmentIndex {
            case 0:
                diceSides = 4
            case 1:
                diceSides = 6
            case 2:
                diceSides = 8
            case 3:
                diceSides = 10
            case 4:
                diceSides = 12
            case 5:
                diceSides = 20
            default:
                diceSides = 4
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        diceOutput.text = ""
    }


}

