//
//  ViewController.swift
//  DailyTennisProject
//
//  Created by John Doll on 9/20/22.
//

import UIKit
import AVKit

class ViewController: UICollectionViewController {

    var videos: [String] = [
        "6-17-17.mp4",
        "6-18-17.mp4",
        "6-23-17.mp4",
        "6-25-17.mp4",
        "6-29-17.mp4",
        "7-28-17.mp4",
        "7-30-17.mp4"
    ]
    
    var thumbnailDict = [String:UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("view")
        
    }
    
    // thumbnail loader
    func generateThumbnail(path: String) -> UIImage? {
        do {
            let imgGenerator = AVAssetImageGenerator(asset: AVURLAsset(url: URL(string: "https://dailytennis.s3.us-east-2.amazonaws.com/\(path)")!, options: nil))
            imgGenerator.appliesPreferredTrackTransform = true
            let thumbnail = UIImage(cgImage: try imgGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil))
            thumbnailDict[path] = thumbnail
            print("here" + path)
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
            self.thumbnailDict[self.videos[indexPath.item]] = self.generateThumbnail(path: self.videos[indexPath.item])
            
        }
        
        cell.imageView.image = thumbnailDict[videos[indexPath.item]]
        cell.imageView.layer.borderColor = UIColor(white: 0, alpha: 0.3).cgColor
        cell.imageView.layer.cornerRadius = 50
        
        return cell
    }
}
