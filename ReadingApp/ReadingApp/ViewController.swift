//
//  ViewController.swift
//  ReadingApp
//
//  Created by John Doll on 8/30/22.
//

import UIKit

class ViewController: UIViewController {
    
    struct Book {
        let title: String
        let author: String
        var currentPage: Int
        let totalPages: Int
        var status: Int
        
        mutating func changeCurrentPage() {
            if (currentPage == totalPages) {
                print("you finished")
                status = 1
            } else {
                currentPage += 1
            }
        }
    }

    var zombieHaiku = Book(title: "Zombie Haiku", author: "Ryan Mecum", currentPage: 0, totalPages: 160, status: 0)
    
    @IBOutlet weak var labelBookTitle: UILabel!
    
    @IBOutlet weak var labelAuthor: UILabel!
    
    @IBOutlet weak var labelStatus: UILabel!
    
    @IBOutlet weak var labelPage: UILabel!
  
    @IBAction func buttonTurnPage(_ sender: Any) {
        zombieHaiku.changeCurrentPage()
        labelPage.text = String("Current page: \(zombieHaiku.currentPage)/\(zombieHaiku.totalPages)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelBookTitle.text = zombieHaiku.title
        labelAuthor.text = zombieHaiku.author
        
        if (zombieHaiku.status == 0) {
            labelStatus.text = "Not Complete"
        } else {
            labelStatus.text = "Complete"
        }
        
        labelPage.text = String("Current page: \(zombieHaiku.currentPage)/\(zombieHaiku.totalPages)")
        
    }
}
