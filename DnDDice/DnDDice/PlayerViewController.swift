//
//  PlayerViewController.swift
//  DnDDice
//
//  Created by John Doll on 9/20/22.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var nameEntry: UITextField!
    
    @IBOutlet weak var maxHPEntry: UITextField!
    
    @IBOutlet weak var strengthEntry: UITextField!
    
    @IBOutlet weak var intelligenceEntry: UITextField!
    
    @IBOutlet weak var charismaEntry: UITextField!
    
    @IBOutlet weak var constitutionEntry: UITextField!
    
    @IBOutlet weak var wisdomEntry: UITextField!
    
    @IBOutlet weak var dexterityEntry: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        var attributes = [nameEntry.text, maxHPEntry.text, strengthEntry.text, intelligenceEntry.text, charismaEntry.text, constitutionEntry.text, wisdomEntry.text, dexterityEntry.text]
        UserDefaults.standard.set(attributes, forKey: "attributes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (UserDefaults.standard.object(forKey: "attributes") != nil) {
            var attributes = (UserDefaults.standard.object(forKey: "attributes")) as! [String]
            nameEntry.text = attributes[0]
            maxHPEntry.text = attributes[1]
            strengthEntry.text = attributes[2]
            intelligenceEntry.text = attributes[3]
            charismaEntry.text = attributes[4]
            constitutionEntry.text = attributes[5]
            wisdomEntry.text = attributes[6]
            dexterityEntry.text = attributes[7]
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
