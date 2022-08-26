//
//  TableViewController.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 26/08/22.
//

import UIKit

class TableViewController: UITableViewController {
    
//    required init?(coder: NSCoder) {
//       fatalError(".")
//    }

    private func setupUI() {

       tableView.dataSource = self
       tableView.delegate = self

       tableView.alwaysBounceVertical = true
       tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       tableView.backgroundColor = UIColor.systemBackground
       tableView.clipsToBounds = true
       tableView.sectionFooterHeight = 28
       tableView.sectionHeaderHeight = 28
    }
    
    let apiController = API()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ItemCell")
        setupUI()
        
        apiController.getUsers { (error) in
            if let error = error{
                print("Error performing datatask \(error)")
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiController.users.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let user = apiController.users[indexPath.row]
        cell.textLabel?.text = user.name.first.capitalized + " " + user.name.last.capitalized
        
        
        return cell
    }

    
    
}
