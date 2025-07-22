//
//  YourLogTableViewCell.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class YourLogTableViewCell: UITableViewCell {

    @IBOutlet var yourImage: UIImageView!
    @IBOutlet var yourDate: UILabel!
    @IBOutlet var yourName: UILabel!
    @IBOutlet var yourChat: UILabel!
    @IBOutlet var yourBubble: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
