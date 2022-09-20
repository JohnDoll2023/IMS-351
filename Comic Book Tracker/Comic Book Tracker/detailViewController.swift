//
//  detailViewController.swift
//  Comic Book Tracker
//
//  Created by John Doll on 9/8/22.
//

import UIKit

class detailViewController: UIViewController {

    var userSelection = 0
    
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var comicBookImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailLabel.text = comicbooks[userSelection].title
        comicBookImage.image = UIImage(named: comicbooks[userSelection].coverImage)
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
