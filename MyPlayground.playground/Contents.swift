import UIKit

var greeting = "Hello, playground"

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
zombieHaiku.changeCurrentPage()
