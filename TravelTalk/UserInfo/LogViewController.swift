//
//  LogViewController.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class LogViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITextViewDelegate {
  
    var profile : [Chat] = []
    var chatroomName: String = ""
    let mylist = ChatList.list
    let me = "MyLogTableViewCell"
    let you = "YourLogTableViewCell"
    @IBOutlet var sendChat: UIButton!
    @IBOutlet var ChatTable: UITableView!
    @IBOutlet var roomTitle: UINavigationItem!
    @IBOutlet var addChat: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatTable.dataSource = self
        ChatTable.delegate = self
        sendChat.setTitle("", for: .normal)
        sendChat.setImage(UIImage(systemName: "paperplane"), for: .normal)
        addChat.delegate = self
        addChat.text = "메세지를 입력하세요."
        addChat.textColor = .lightGray
        let myLogIB = UINib(nibName: me, bundle: nil)
        let yourLogIB = UINib(nibName: you, bundle: nil)
        ChatTable.register(myLogIB, forCellReuseIdentifier: me)
        ChatTable.register(yourLogIB, forCellReuseIdentifier: you)
        roomTitle.title = chatroomName

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if profile[indexPath.row].user.name == "김새싹" {
            let cell = tableView.dequeueReusableCell(withIdentifier: me, for: indexPath) as! MyLogTableViewCell
            let readChat = profile[indexPath.row]
            sendChat.tag = indexPath.row
            sendChat.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
            //roomTitle.title = mylist[indexPath.row].chatroomName
            cell.configureChat(chat: readChat)
            cell.chatData(chat: readChat)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: you, for: indexPath) as! YourLogTableViewCell
            let readChat = profile[indexPath.row]
            cell.chatData(chat: readChat)
            cell.configureChat(chat: readChat)
            return cell
        }
        
    }
    //chat
    @objc func sendButtonClicked(_ sender: UIButton) {
        guard let inputText = addChat.text, !inputText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return
        } // !inputText.trimmingCharacters(in: .whitespacesAndNewlines - 공백이나 줄바꿈인지 확인하는 구문. 스페이스바 \n 이런거
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        let currentDateString = formatter.string(from: Date())
        let newChat = Chat(
            user: ChatList.me,
            date: currentDateString,
            message: inputText
        )
        profile.append(newChat)
        addChat.text = ""
        addChat.resignFirstResponder()
        //누르면 채팅뷰 값을 초기화, 창내려줌.
        ChatTable.reloadData()
        let lastIndex = IndexPath(row: profile.count - 1, section: 0)
        ChatTable.scrollToRow(at: lastIndex, at: .bottom, animated: true)
        //최신 메시지가 있는 위치까지 스크롤해줌
    }
}
