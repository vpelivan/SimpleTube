//
//  RecentTableViewCell.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 23.08.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit
import Foundation

class RecentTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let playlistNib = UINib(nibName: "RecentPlaylistCollectionViewCell", bundle: nil)
        collectionView.register(playlistNib, forCellWithReuseIdentifier: "recentPlaylistCell")
        let videoNib = UINib(nibName: "RecentVideoCollectionViewCell", bundle: nil)
        collectionView.register(videoNib, forCellWithReuseIdentifier: "recentVideoCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0...2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentPlaylistCell", for: indexPath) as! RecentPlaylistCollectionViewCell
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recentVideoCell", for: indexPath) as! RecentVideoCollectionViewCell
            return cell
        }
    }
    
}

