//
//  DetailViewController.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 26/08/22.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    let userImageView = UIImageView()
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let pinImageView = UIImageView()
    let locationLabel = UILabel()
    let mapView = MKMapView()
    let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        navigationItem.title = "Detail"
        view.backgroundColor = UIColor.secondarySystemBackground
        
        
        view.addSubview(userImageView)
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,
                                               constant: 10),
            userImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            userImageView.widthAnchor.constraint(equalTo: userImageView.heightAnchor)
        ])
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        userImageView.layer.masksToBounds = true
        userImageView.downloadImage(from: user.picture.large)
        userImageView.layer.borderWidth = 12
        userImageView.layer.borderColor = UIColor.white.cgColor
        
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                               constant: -20),
            nameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 10)
        ])
        nameLabel.font = UIFont.boldSystemFont(ofSize: 32)
        nameLabel.textAlignment = .left
        nameLabel.text = "\(user.name.first) \(user.name.last)"
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        
        view.addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,
                                               constant: 20),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,
                                               constant: -20),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ])
        emailLabel.font = UIFont.systemFont(ofSize: 24)
        emailLabel.textColor = emailLabel.textColor.withAlphaComponent(0.6)
        emailLabel.text = user.email
        emailLabel.textAlignment = .center

        
        view.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,
                                               constant: 10)
        ])
        locationLabel.font = UIFont.systemFont(ofSize: 20)
        locationLabel.textColor = locationLabel.textColor.withAlphaComponent(0.5)
        locationLabel.text = "\(user.location.state). \(user.location.country)"
        locationLabel.textAlignment = .center
        
        view.addSubview(pinImageView)
        pinImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pinImageView.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            pinImageView.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor,
                                                   constant: -5),
            pinImageView.heightAnchor.constraint(equalToConstant: 16),
            pinImageView.widthAnchor.constraint(equalToConstant: 16),
        ])
        pinImageView.alpha = 0.6
        pinImageView.image = UIImage(named: "location")
    
        
        view.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.topAnchor.constraint(equalTo: pinImageView.bottomAnchor, constant: 40),
        ])
        
        guard let lat = Double(user.location.coordinates.latitude),
              let lon = Double(user.location.coordinates.longitude) else {
                  return
              }
        mapView.setCenter(CLLocationCoordinate2D(latitude: lat, longitude: lon), animated: false)
        
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: lat,
                                                      longitude: lon)
        annotation.coordinate = centerCoordinate
        annotation.title = "Location"
        mapView.addAnnotation(annotation)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        userImageView.layer.cornerRadius = userImageView.frame.height / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
