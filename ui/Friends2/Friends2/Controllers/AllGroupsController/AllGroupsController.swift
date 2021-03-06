//
//  AllGroupsController.swift
//  Friends2
//
//  Created by 18986602 on 17.02.2022.
//

import UIKit



class AllGroupsController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let reuseIdentifier = "reuseIdentifier"
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        createGroupsArray()
        tableView.reloadData()
    }
    

    func createGroupsArray() {
        let group1 = Group(avatarImagePath: "1", name: "Murchik fans", description: "Mur mur mur")
        groupsArray.append(group1)
        
        let group2 = Group(avatarImagePath: "2", name: "Kiska fans", description: "Kis kis kis")
        groupsArray.append(group2)
        
        let group3 = Group(avatarImagePath: "3", name: "Myaucha fans", description: "Myau myau myau")
        groupsArray.append(group3)
    }
   
}

extension AllGroupsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(groupsArray[indexPath.row].name)")
    }
}

extension AllGroupsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.configure(group: groupsArray[indexPath.row])
        return cell
    }
    
    
}
