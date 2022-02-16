//
//  ViewController.swift
//  Friends4
//
//  Created by 18986602 on 13.02.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var names = ["Petr", "Vasilii", "Ludmila", "Jhon Snow", "Mr.Aleksandr", "Alisa", "Adam", "Vasilii", "Ludmila", "Jhon Snow", "Mr.Aleksandr", "Alisa", "Adam", "Vasilii", "Ludmila", "Jhon Snow", "Mr.Aleksandr", "Alisa", "Adam", "Vasilii", "Ludmila", "Jhon Snow", "Mr.Aleksandr", "Alisa", "Adam", "Vasilii", "Ludmila", "Jhon Snow", "Mr.Aleksandr", "Alisa", "Adam"]
    let reuseIdentifier = "reuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
       // tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: reuseIdentifier)
    }


}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
            return 50
       
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Select \(indexPath.row) row")
    }
}










extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as? CustomTableViewCell else {return UITableViewCell()}
        cell.photo.image = UIImage(systemName: "heart")
        cell.name.text = names[indexPath.row]
        cell.descriptionLable.text = "description"
        
        
        return cell
    }
    
    
    
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        names.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .top)
        //tableView.reloadData()
    }
    
}
