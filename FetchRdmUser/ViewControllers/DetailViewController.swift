//
//  DetailViewController.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 26/08/22.
//

import UIKit


class DetailViewController: UIViewController {
    
    private lazy var emailLabel = UILabel()
    private lazy var phoneLabel = UILabel()
    private lazy var dobLabel = UILabel()
        
        var user: User?{
            didSet{
                updateViews()
                
            }
        }
    
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
            setupLayout()
            updateViews()
        }
        
        func updateViews()
        {
            guard isViewLoaded,
             let user = user else {return}
            title = user.name.first.capitalized
            emailLabel.text = user.email
            dobLabel.text = String(user.dob.age)
            phoneLabel.text = user.phone

        }

    required init?(coder: NSCoder) {
         fatalError("Error.")
      }

      private func setupUI() {

         navigationItem.title = "User"

         view.addSubview(emailLabel)
         view.addSubview(phoneLabel)
         view.addSubview(dobLabel)

         view.backgroundColor = UIColor.systemBackground

         dobLabel.contentMode = .left
         dobLabel.font = UIFont.systemFont(ofSize: 17)
         dobLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
         dobLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
         dobLabel.text = "Label"
         dobLabel.textAlignment = .center
         dobLabel.translatesAutoresizingMaskIntoConstraints = false

         phoneLabel.contentMode = .left
         phoneLabel.font = UIFont.systemFont(ofSize: 17)
         phoneLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
         phoneLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
         phoneLabel.text = "Label"
         phoneLabel.textAlignment = .center
         phoneLabel.translatesAutoresizingMaskIntoConstraints = false

         emailLabel.contentMode = .left
         emailLabel.font = UIFont.systemFont(ofSize: 17)
         emailLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
         emailLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .vertical)
         emailLabel.text = "Label"
         emailLabel.textAlignment = .center
         emailLabel.translatesAutoresizingMaskIntoConstraints = false
      }

      private func setupLayout() {

         emailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 52).isActive = true
         dobLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
         phoneLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 217).isActive = true
         emailLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
         dobLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 121).isActive = true
         phoneLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
      }


    }
