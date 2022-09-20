//
//  ViewController.swift
//  Swiss Cheese
//
//  Created by John Doll on 9/15/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var groceries = ["skyline", "cheese", "spaghetti"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groceries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "myCell")
        cell?.textLabel?.text = groceries[indexPath.row]
        return cell!
    }
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}
