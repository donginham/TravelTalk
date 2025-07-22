//
//  LogViewController.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class LogViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate {
  
    var profile : [Chat] = []
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
        
        let myLogIB = UINib(nibName: me, bundle: nil)
        let yourLogIB = UINib(nibName: you, bundle: nil)
        ChatTable.register(myLogIB, forCellReuseIdentifier: me)
        ChatTable.register(yourLogIB, forCellReuseIdentifier: you)
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print(textView.text)
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
        //메세지에 addChat.text값을 append - 어떻게 잘 접근해서 message까지 가야함
        //어떻게? 으ㅡ으으으
        
        ChatTable.reloadData()
    }
}
