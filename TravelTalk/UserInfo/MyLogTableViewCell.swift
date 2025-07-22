//
//  MyLogTableViewCell.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class MyLogTableViewCell: UITableViewCell {

    @IBOutlet var myDate: UILabel!
    @IBOutlet var myChat: UILabel!
    @IBOutlet var myBubble: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
