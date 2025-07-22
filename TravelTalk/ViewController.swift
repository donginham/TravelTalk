//
//  ViewController.swift
//  TravelTalk
//
//  Created by HDI on 7/18/25.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate {
    
    @IBOutlet var FriendTableView: UITableView!
    @IBOutlet var searchFriends: UISearchBar!
    var searching: Bool = false
    var filteredChatRooms: [ChatRoom] = []
    let identifier = "ProfileTableViewCell"
    let list = ChatList.list
    override func viewDidLoad() {
        super.viewDidLoad()
        FriendTableView.dataSource = self
        FriendTableView.delegate = self
        searchFriends.delegate = self
        let xib = UINib(nibName: identifier, bundle: nil)
        FriendTableView.register(xib, forCellReuseIdentifier: identifier)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
                searching = false
                filteredChatRooms = []
            } else {
                searching = true
                filteredChatRooms = list.filter { chatRoom in
                    if let lastChat = chatRoom.chatList.last {
                            return lastChat.user.name.localizedCaseInsensitiveContains(searchText)
                        } else {
                            return false
                        }
                }
            }
            FriendTableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? filteredChatRooms.count : list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! ProfileTableViewCell
        let chatRoom = searching ? filteredChatRooms[indexPath.row] : list[indexPath.row]
        //서치Bool에 따라 필터된 값을 출력하거나 아님 전체값 출력
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
        let row = searching ? filteredChatRooms[indexPath.row] : list[indexPath.row]
        //서치Bool에 따라 로우에 맞는 값을 전달.
        let log = "LogViewController"
        let logView = UIStoryboard(name: "Main", bundle: nil)
        let lV = logView.instantiateViewController(withIdentifier: log) as! LogViewController
        lV.profile = row.chatList
        navigationController?.pushViewController(lV, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

}

