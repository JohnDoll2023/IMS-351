//
//  avatarViewController.swift
//  MultiViewController
//
//  Created by John Doll on 9/8/22.
//

import UIKit

class avatarViewController: UIViewController {

    @IBOutlet weak var avatarLabel: UILabel!
    
    var avatarImageName = "default"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        avatarLabel.text = avatarImageName
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
