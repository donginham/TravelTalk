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

    }

    func configureChat(chat:Chat) {
        yourName.font = .systemFont(ofSize: 14)
        yourChat.numberOfLines = 0
        yourChat.font = .systemFont(ofSize: 12)
        yourBubble.layer.borderWidth = 1
        yourBubble.layer.cornerRadius = 10
        yourDate.textColor = .lightGray
        yourDate.font = .systemFont(ofSize: 8)
        yourImage.layer.cornerRadius = yourImage.frame.width /  2
        yourImage.layer.borderWidth = 1
        //yourImage.layer.borderColor = 
        yourImage.clipsToBounds = true
        yourImage.contentMode = .scaleAspectFit
        
    }
    func chatData(chat:Chat) {
        yourChat.text = chat.message
        yourDate.text = chat.date
        yourImage.image = UIImage(named: chat.user.image)
        yourName.text = chat.user.name
    }
}
