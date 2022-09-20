//
//  ViewController.swift
//  Comic Book Tracker
//
//  Created by John Doll on 9/6/22.
//

import UIKit

struct ComicBook {
    var title: String
    var issueNumber: Int
    var grade: Double
    var coverImage: String
}

var comicbooks = [
    ComicBook(title: "spiderman", issueNumber: 5, grade: 9.5, coverImage: "AmazingSpiderman"),
    ComicBook(title: "batman", issueNumber: 012, grade: 4.5, coverImage: "batman"),
    ComicBook(title: "xmen", issueNumber: 87, grade: 8.0, coverImage: "xmen")]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicbooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell")
        
        cell?.textLabel?.text = comicbooks[indexPath.row].title
        
        return cell!
    }

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailSegue" {
            let destination = segue.destination as? detailViewController
            destination?.userSelection = myTableView.indexPathForSelectedRow!.row
        }
    }
}
