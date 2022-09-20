//
//  ViewController.swift
//  MultiViewController
//
//  Created by John Doll on 9/8/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "avatarSegue" {
            let destination = segue.destination as? avatarViewController
            destination?.avatarImageName = "smiley face"
        }
        
        if segue.identifier == "avatarFrownSegue" {
            let destination = segue.destination as? avatarViewController
            destination?.avatarImageName = "frowny face"
        }
        
        if segue.identifier == "passwordSegue" {
            let destination = segue.destination as? passwordViewController
        }
    }

}

