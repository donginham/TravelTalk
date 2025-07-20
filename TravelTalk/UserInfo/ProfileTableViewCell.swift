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
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
