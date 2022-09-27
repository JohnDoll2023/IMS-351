//
//  addcomicViewController.swift
//  Comic Book Tracker
//
//  Created by John Doll on 9/27/22.
//

import UIKit

class addcomicViewController: UIViewController {

    @IBAction func saveButton(_ sender: Any) {
        var newComicBook = ComicBook(title: addComicTextField.text!, issueNumber: 0, grade: 0, coverImage: "0", description: "", status: 0)
        comicbooks.append(newComicBook)
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(comicbooks) {
            UserDefaults.standard.set(data, forKey: "savedComicBooks")
        }
        
    }
    
    @IBOutlet weak var addComicTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
