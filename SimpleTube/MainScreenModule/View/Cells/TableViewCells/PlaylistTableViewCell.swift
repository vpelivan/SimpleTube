//
//  SearchTableViewCell.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 17.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var infoContainerView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var thumbVideoQuanlityLabel: UILabel!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
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
