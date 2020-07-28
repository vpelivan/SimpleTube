//
//  ChannelTableViewCell.swift
//  SimpleTube
//
//  Created by Victor Pelivan on 21.07.2020.
//  Copyright © 2020 Viktor Pelivan. All rights reserved.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {

    @IBOutlet weak var imageContainerView: UIView!
    @IBOutlet weak var channelLogoImageView: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var subscribersLabel: UILabel!
    @IBOutlet weak var videoQuantityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    private func setupViews() {
        imageContainerView.layer.cornerRadius = imageContainerView.bounds.width / 2
        imageContainerView.layer.borderWidth = 1
        imageContainerView.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageContainerView.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        imageContainerView.layer.shadowOpacity = 1
        imageContainerView.layer.shadowRadius = 3
        imageContainerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        channelLogoImageView.clipsToBounds = true
        channelLogoImageView.layer.cornerRadius = channelLogoImageView.bounds.width / 2
    }
}
