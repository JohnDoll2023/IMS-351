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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelBookTitle.text = zombieHaiku.title
    }


}

