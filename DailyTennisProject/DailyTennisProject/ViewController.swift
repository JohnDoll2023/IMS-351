//
//  ViewController.swift
//  DailyTennisProject
//
//  Created by John Doll on 9/20/22.
//

import UIKit
import AVKit

// holds favorited videos
var favorites: [String] = []

// holds thumbnails for quicker reload
var thumbnailDict = [String:UIImage]()

// videos to load from AWS S3
var videos: [String] = [
    "6-17-17.mp4",
    "6-18-17.mp4",
    "6-23-17.mp4",
    "6-25-17.mp4",
    "6-29-17.mp4",
    "7-28-17.mp4",
    "7-30-17.mp4",
    "12-17-17.mp4",
    "1-7-18.mp4"
]

class ViewController: UICollectionViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // thumbnail loader
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
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    // creates cells in main nav controller view with thumbnail and date
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DTVideo", for: indexPath) as? DTCollectionViewCell else {
            fatalError("Unable to dequeue DTVideoCell.")
        }
        
        if thumbnailDict[videos[indexPath.item]] == nil {
            DispatchQueue.global(qos:.userInteractive).async {
                thumbnailDict[videos[indexPath.item]] = self.generateThumbnail(path: videos[indexPath.item])
            }
        }
        
        cell.imageView.image = thumbnailDict[videos[indexPath.item]]
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.cornerRadius = 50
        
        // creates cell description
        let str = videos[indexPath.item]
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
        cell.videoTitle.text = titleString
        cell.id = videos[indexPath.item]
        
        if (favorites.contains(cell.id)){
            cell.favoritesButtonOutlet1.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            cell.favoritesButtonOutlet1.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("x")
        if let vc = storyboard?.instantiateViewController(withIdentifier: "VideoViewController") as? VideoViewController {
            // set video to url for the cell
            vc.selectedVideo = videos[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
