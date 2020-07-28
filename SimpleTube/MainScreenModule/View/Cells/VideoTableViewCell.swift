//
//  VideoTableViewCell.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var thumbLoadIndicator: UIActivityIndicatorView!
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
    }
}
