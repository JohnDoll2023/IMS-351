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
    
    @IBAction func segmentAction(_ sender: Any) {
        comicbooks[userSelection].status = segmentedOutlet.selectedSegmentIndex
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(comicbooks) {
            UserDefaults.standard.set(data, forKey: "savedComicBooks")
        }
    }
    @IBOutlet weak var segmentedOutlet: UISegmentedControl!
    @IBOutlet weak var comicBookImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        detailLabel.text = comicbooks[userSelection].title
        comicBookImage.image = UIImage(named: comicbooks[userSelection].coverImage)
        segmentedOutlet.selectedSegmentIndex = comicbooks[userSelection].status
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
