import UIKit

struct ComicBook {
    var title: String
    var issue: Int
    var grade: Double
}

var spiderman = ComicBook(title: "Spiderman", issue: 37, grade: 8.5)

var collection = [ComicBook(title: "spiderman", issue: 75, grade: 3.0),
                  ComicBook(title: "batman", issue: 30, grade: 5.5),
                  ComicBook(title: "xmen", issue: 80, grade: 7.0)]

