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
    func chatData(chat:Chat) {
        myChat.text = chat.message
        myDate.text = chat.date
    }
    func configureChat(chat:Chat) {
        myChat.text = chat.message
        myBubble.layer.borderWidth = 1
        myBubble.layer.cornerRadius = 10
        myChat.numberOfLines = 0
        myChat.font = .systemFont(ofSize: 12)
        myDate.font = .systemFont(ofSize: 8)
        myDate.textColor = .lightGray
    }
    
}
