//
//  ProfileTableViewCell.swift
//  TravelTalk
//
//  Created by HDI on 7/18/25.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var chatLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImage.layer.cornerRadius = profileImage.frame.width /  2
        profileImage.layer.borderWidth = 1
        profileImage.clipsToBounds = true
        profileImage.contentMode = .scaleAspectFit
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
