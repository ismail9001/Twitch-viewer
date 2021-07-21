//
//  ChannelTableViewCell.swift
//  Twitch viewer
//
//  Created by macbook on 21.07.2021.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {
    
    @IBOutlet var viewersLabel: UILabel!
    @IBOutlet var boxImage: UIImageView!
    @IBOutlet var gameLabel: UILabel!
    @IBOutlet var channelsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        boxImage.kf.cancelDownloadTask()
        boxImage.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
