//
//  RecentPlaylistCollectionViewCell.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.08.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class RecentPlaylistCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var thumbVideoQuantityLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        imageContainerView.layer.cornerRadius = 5.0
        thumbImageView.layer.cornerRadius = 5.0
        thumbImageView.clipsToBounds = true
        infoContainerView.layer.cornerRadius = 5.0
        infoContainerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
    }
}
