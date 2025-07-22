//
//  LogViewController.swift
//  TravelTalk
//
//  Created by HDI on 7/22/25.
//

import UIKit

class LogViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
  
    var profile : [Chat] = []
    let mylist = ChatList.list
    let me = "MyLogTableViewCell"
    let you = "YourLogTableViewCell"
    @IBOutlet var ChatTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChatTable.dataSource = self
        ChatTable.delegate = self
        let myLogIB = UINib(nibName: me, bundle: nil)
        let yourLogIB = UINib(nibName: you, bundle: nil)
        ChatTable.register(myLogIB, forCellReuseIdentifier: me)
        ChatTable.register(yourLogIB, forCellReuseIdentifier: you)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mylist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if  profile[indexPath.row].user.name == "김새싹" {
            let chatData = profile[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: me, for: indexPath) as! MyLogTableViewCell
            cell.myChat.text = chatData.message
            cell.myDate.text = chatData.date
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: you, for: indexPath) as! YourLogTableViewCell
            let chatData = profile[indexPath.row]
            cell.yourChat.text = chatData.message
            cell.yourDate.text = chatData.date
            cell.yourImage.image = UIImage(named: chatData.user.image)
            cell.yourName.text = chatData.user.name
            return cell
        }
    }
}
