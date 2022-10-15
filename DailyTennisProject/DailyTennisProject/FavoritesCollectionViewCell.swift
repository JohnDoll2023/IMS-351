//
//  FavoritesCollectionViewCell.swift
//  DailyTennisProject
//
//  Created by John Doll on 10/13/22.
//

import UIKit

class FavoritesCollectionViewCell: UICollectionViewCell {
    var id = ""
    
    @IBAction func favoritesAction(_ sender: UIButton) {
        if (favoritesOutlet.currentImage == UIImage(systemName: "star")) {
            favoritesOutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
            favorites.append(id)
        } else {
            favoritesOutlet.setImage(UIImage(systemName: "star"), for: .normal)
            let loc = favorites.firstIndex(of: id)!
            favorites.remove(at: loc)
        }
    }
    @IBOutlet weak var favoritesOutlet: UIButton!
    @IBOutlet weak var videoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
}
