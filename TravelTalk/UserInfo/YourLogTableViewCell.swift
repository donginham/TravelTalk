//
//  YourLogTableViewCell.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class YourLogTableViewCell: UITableViewCell,MyProtocol {

    @IBOutlet var yourImage: UIImageView!
    @IBOutlet var yourDate: UILabel!
    @IBOutlet var yourName: UILabel!
    @IBOutlet var yourChat: UILabel!
    @IBOutlet var yourBubble: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configureChat(chat:Chat) {
        yourName.font = .systemFont(ofSize: 15,weight: .bold)
        yourChat.numberOfLines = 0
        yourChat.font = .systemFont(ofSize: 14)
        yourBubble.layer.borderWidth = 1
        yourBubble.layer.cornerRadius = 10
        yourDate.textColor = .lightGray
        yourDate.font = .systemFont(ofSize: 10)
        yourImage.layer.cornerRadius = yourImage.frame.width /  2
        yourImage.layer.borderWidth = 1
        //yourImage.layer.borderColor =
        yourImage.clipsToBounds = true
        yourImage.contentMode = .scaleAspectFit
        
    }
    func chatData(chat:Chat) {
        print(formatter(date: chat.date))
        yourChat.text = chat.message
        yourDate.text = formatter(date: chat.date)
        yourImage.image = UIImage(named: chat.user.image)
        yourName.text = chat.user.name
    }
    func formatter(date dateStr:String) -> String {
        let dateStr = "2020-08-13 16:30" // Date 형태의 String
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" // 2020-08-13 16:30
        let convertDate = dateFormatter.date(from: dateStr) // Date 타입으로 변환
        
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "M월 d일 h:mm a" // 2020년 08월 13일 오후 04시 30분
        myDateFormatter.locale = Locale(identifier:"ko_KR") // PM, AM을 언어에 맞게 setting (ex: PM -> 오후)
        let convertStr = myDateFormatter.string(from: convertDate!)
        return convertStr
    }
}
