//
//  UserTableViewCell.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 26/08/22.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    let userImageView = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let emailImageView = UIImageView()
    let phoneLabel = UILabel()
    let phoneImageView = UIImageView()
    
    var user: User? {didSet{
        guard let user = user else {
            return
        }
        userImageView.downloadImage(from: user.picture.thumbnail)
        nameLabel.text = "\(user.name.first) \(user.name.last)"
        emailLabel.text = user.email
        phoneLabel.text = user.phone
    }}
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.heightAnchor.constraint(equalToConstant: 60),
            userImageView.widthAnchor.constraint(equalToConstant: 60),
            userImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                   constant: 20)
        ])
        userImageView.clipsToBounds = true
        userImageView.layer.masksToBounds = true
        userImageView.contentMode = .scaleAspectFill
        
        contentView.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor,
                                               constant: 10),
            nameLabel.bottomAnchor.constraint(equalTo: userImageView.centerYAnchor,
                                              constant: -5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -10)
        ])
        nameLabel.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        contentView.addSubview(emailImageView)
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailImageView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor,
                                               constant: 10),
            emailImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                                constant: 5),
            emailImageView.heightAnchor.constraint(equalToConstant:  16),
            emailImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
        emailImageView.contentMode = .scaleAspectFit
        emailImageView.image = UIImage(named: "email")
    
        
        contentView.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: emailImageView.trailingAnchor,
                                               constant: 5),
            emailLabel.centerYAnchor.constraint(equalTo: emailImageView.centerYAnchor),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -10)
        ])
        emailLabel.font = UIFont.systemFont(ofSize: 15)

        
        contentView.addSubview(phoneImageView)
        phoneImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneImageView.leadingAnchor.constraint(equalTo: emailImageView.leadingAnchor),
            phoneImageView.topAnchor.constraint(equalTo: emailImageView.bottomAnchor, constant: 2),
            phoneImageView.heightAnchor.constraint(equalToConstant:  16),
            phoneImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
        phoneImageView.contentMode = .scaleAspectFit
        phoneImageView.image = UIImage(named: "phone")


        contentView.addSubview(phoneLabel)
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneLabel.leadingAnchor.constraint(equalTo: phoneImageView.trailingAnchor,
                                               constant: 5),
            phoneLabel.centerYAnchor.constraint(equalTo: phoneImageView.centerYAnchor),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -10)
        ])
        phoneLabel.font = UIFont.systemFont(ofSize: 14)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UIImageView {
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
    func downloadImage(from url: URL) {
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = UIImage(data: data)
            }
        }
    }
}
