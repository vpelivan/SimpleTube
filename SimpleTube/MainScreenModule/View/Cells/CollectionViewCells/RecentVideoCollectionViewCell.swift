//
//  RecentCollectionViewCell.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.08.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class RecentVideoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var thumbLoadIndicator: UIActivityIndicatorView!
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
        thumbLoadIndicator.isHidden = false
        thumbLoadIndicator.startAnimating()
    }
}
