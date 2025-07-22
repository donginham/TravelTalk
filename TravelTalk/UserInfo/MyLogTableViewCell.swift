//
//  MyLogTableViewCell.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class MyLogTableViewCell: UITableViewCell,MyProtocol {
    @IBOutlet var myDate: UILabel!
    @IBOutlet var myChat: UILabel!
    @IBOutlet var myBubble: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func chatData(chat:Chat) {
        myChat.text = chat.message
        myDate.text = formatter(date: chat.date)
    }
    func configureChat(chat:Chat) {
        myChat.text = chat.message
        myBubble.layer.borderWidth = 1
        myBubble.layer.cornerRadius = 10
        myBubble.backgroundColor = .lightGray
        myChat.numberOfLines = 0
        myChat.font = .systemFont(ofSize: 12)
        myDate.font = .systemFont(ofSize: 8)
        myDate.textColor = .lightGray
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
