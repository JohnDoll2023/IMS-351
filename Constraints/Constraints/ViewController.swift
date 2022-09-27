//
//  ViewController.swift
//  Constraints
//
//  Created by John Doll on 9/20/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    @IBOutlet weak var userTextField: UITextField!
    @IBAction func myButton(_ sender: Any) {
        UserDefaults.standard.set(userTextField.text, forKey: "savedUserInput")
        myLabel.text = userTextField.text
        
    }
    @IBAction func mySegmentedControlAction(_ sender: Any) {
        print(mySegmentedControl.selectedSegmentIndex)
    }
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (UserDefaults.standard.object(forKey: "savedUserInput") != nil) {
            myLabel.text = UserDefaults.standard.object(forKey: "savedUserInput") as! String
        }
    }
}
