//
//  FavoritesViewController.swift
//  DailyTennisProject
//
//  Created by John Doll on 10/13/22.
//

import UIKit
import AVKit

class FavoritesViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func generateThumbnail(path: String) -> UIImage? {
        do {
            let imgGenerator = AVAssetImageGenerator(asset: AVURLAsset(url: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(path)")!, options: nil))
            imgGenerator.appliesPreferredTrackTransform = true
            let thumbnail = UIImage(cgImage: try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil))
            thumbnailDict[path] = thumbnail
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            return thumbnail
        } catch let error {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
    
    // creates cells in main nav controller view with thumbnail and date
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesVideo", for: indexPath) as? FavoritesCollectionViewCell else {
            fatalError("Unable to dequeue FavoritesCollectionVideoCell.")
        }
        
        if thumbnailDict[favorites[indexPath.item]] == nil {
            DispatchQueue.global(qos:.userInteractive).async {
                thumbnailDict[favorites[indexPath.item]] = self.generateThumbnail(path: favorites[indexPath.item])
            }
        }
        
        cell.imageView.image = thumbnailDict[favorites[indexPath.item]]
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.cornerRadius = 50
        
        // creates cell description
        let str = favorites[indexPath.item]
        let splitEnds = str.components(separatedBy: ".")[0]
        let dateParts = splitEnds.components(separatedBy: "-")
        var titleString = splitEnds
        if (dateParts.count >= 3) {
            let month: Int? = Int(dateParts[0])
            let day = dateParts[1]
            let year = dateParts[2]
            let monthstr = Calendar.current.monthSymbols[month! - 1]
            titleString = "\(monthstr) \(day), 20\(year)"
        }
        
        cell.videoLabel.text = titleString
        cell.id = favorites[indexPath.item]
        
        if (favorites.contains(cell.id)){
            cell.favoritesOutlet.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.favoritesOutlet.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("xy")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController {
            // set video to url for the cell
            vc.selectedVideo = favorites[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
