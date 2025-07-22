//
//  ViewController.swift
//  TravelTalk
//
//  Created by HDI on 7/18/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var FriendTableView: UITableView!
    @IBOutlet var searchFriends: UISearchBar!
    var searching: Bool = false
    var filterList = ChatList.list
    var allChat = ChatList.list
    let identifier = "ProfileTableViewCell"
    let list = ChatList.list
    override func viewDidLoad() {
        super.viewDidLoad()
        FriendTableView.dataSource = self
        FriendTableView.delegate = self
        let xib = UINib(nibName: identifier, bundle: nil)
        FriendTableView.register(xib, forCellReuseIdentifier: identifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ChatList.list.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ProfileTableViewCell
        let chatRoom = ChatList.list[indexPath.row]
        
            if let lastChat = chatRoom.chatList.last { //last : 마지막 채팅내용을 따와서 트래블톡에 넣어주는 구문
                cell.nameLabel.text = lastChat.user.name
                cell.chatLabel.text = lastChat.message
                cell.profileImage.image = UIImage(named: lastChat.user.image)
                cell.dateLabel.text = lastChat.date
            } else {
                cell.nameLabel.text = "이거 넘어가면 안됨"
                cell.chatLabel.text = "제발"
                cell.dateLabel.text = "과연"
                cell.profileImage.image = UIImage(systemName: "heart")
            }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row  = list[indexPath.row]
        let log = "LogViewController"
        let logView = UIStoryboard(name: "Main", bundle: nil)
        let lV = logView.instantiateViewController(withIdentifier: log) as! LogViewController
        lV.profile = row.chatList
        present(lV,animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

