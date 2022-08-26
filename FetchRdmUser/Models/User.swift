//
//  User.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 25/08/22.
//


import Foundation

struct Users: Decodable{
    let results: [User]
}

struct User: Decodable{
    let gender: Gender
    let name: Name
    let email: String
    let dob: Dob
    let phone: String
    let location: Location
    let picture: Picture
}

enum Gender: String, Codable {
    case male
    case female
}

struct Location: Codable {
    let city: String
    let state: String
    let country: String
    let coordinates: Coordinates
    
    struct Coordinates: Codable {
        let latitude: String
        let longitude: String
    }
}

struct Picture: Codable {
    let large: URL
    let medium: URL
    let thumbnail: URL
}

struct Name: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Dob: Decodable {
    var age: Int
    var date: String
}
