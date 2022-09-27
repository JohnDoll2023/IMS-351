//
//  ViewController.swift
//  Comic Book Tracker
//
//  Created by John Doll on 9/6/22.
//

import UIKit

struct ComicBook:Codable {
    var title: String
    var issueNumber: Int
    var grade: Double
    var coverImage: String
    var description:String
    var status:Int
    // 0 means not read, 1 means read, 2 means borrowed
}

var comicbooks = [
    ComicBook(title: "Default", issueNumber: 0, grade: 0.0, coverImage: "", description: "", status: 0)]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicbooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell")
        if (comicbooks[indexPath.row].status == 0) {
            cell?.textLabel?.text = comicbooks[indexPath.row].title
        } else if (comicbooks[indexPath.row].status == 1) {
            cell?.textLabel?.text = "☑️" + comicbooks[indexPath.row].title
        } else if (comicbooks[indexPath.row].status == 2) {
            cell?.textLabel?.text = "✋" + comicbooks[indexPath.row].title
        } else {
            cell?.textLabel?.text = "🟩" + comicbooks[indexPath.row].title
        }
        
        return cell!
    }

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        if (UserDefaults.standard.object(forKey: "savedComicBooks") != nil) {
            comicbooks = try! JSONDecoder().decode([ComicBook].self, from: UserDefaults.standard.object(forKey: "savedComicBooks") as! Data)
        } else {
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        myTableView.reloadData()
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
