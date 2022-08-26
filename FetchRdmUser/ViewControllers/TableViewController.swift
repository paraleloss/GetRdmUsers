//
//  TableViewController.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 26/08/22.
//

import UIKit

class TableViewController: UITableViewController {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    let apiController = API()
    var users = [User]()

    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Users"
        
        tableView.backgroundView = activityIndicator
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.alwaysBounceVertical = true
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tableView.backgroundColor = UIColor.systemBackground
        tableView.clipsToBounds = true
        tableView.sectionFooterHeight = 28
        tableView.sectionHeaderHeight = 28
        tableView.register(UserTableViewCell.self,
                           forCellReuseIdentifier: "ItemCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchData()
    }
    
    private func fetchData() {
        activityIndicator.startAnimating()
        apiController.getUsers { result in
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                switch result {
                case .success(let users):
                    self.users = users
                    self.tableView.reloadData()
                case .failure(let error):
                    self.presentAlertError(error)
                }
            }
        }
    }
    
    private func presentAlertError(_ error: Error) {
        let alert = UIAlertController(title: "Error",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        present(alert, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? UserTableViewCell else {
            return UITableViewCell()
        }
        cell.user = users[indexPath.item]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.item]
        navigationController?.pushViewController(DetailViewController(user: user), animated: true)
    }
}
