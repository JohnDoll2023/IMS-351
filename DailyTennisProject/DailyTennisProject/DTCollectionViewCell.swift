//
//  DTCollectionViewCell.swift
//  DailyTennisProject
//
//  Created by John Doll on 9/22/22.
//

import UIKit

class DTCollectionViewCell: UICollectionViewCell {
    
    var id = ""
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func favoritesButtonAction(_ sender: UIButton) {
        if (favoritesButtonOutlet1.currentImage == UIImage(systemName: "star")) {
                favoritesButtonOutlet1.setImage(UIImage(systemName: "star.fill"), for: .normal)
                favorites.append(id)
            } else {
                favoritesButtonOutlet1.setImage(UIImage(systemName: "star"), for: .normal)
                let loc = favorites.firstIndex(of: id)!
                favorites.remove(at: loc)
            }
    }
    @IBOutlet weak var favoritesButtonOutlet1: UIButton!
    @IBOutlet weak var videoTitle: UILabel!
}
