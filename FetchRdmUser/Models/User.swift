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
    let name: Name
    let email: String
    let dob: Dob
    let phone: String    
}

struct Name: Decodable
{
    var first: String
    var last: String
}

struct Dob: Decodable
{
    var age: Int
    var date: String
}
