//
//  API.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 25/08/22.
//

import Foundation

class API {

    var users: [User] = []
    let baseURL = URL(string: "https://randomuser.me/api/?inc=name,email,dob,phone,picture&results=10")!
    
    typealias CompletionHandler = (Error?) -> Void
    
    func getUsers(completion: @escaping CompletionHandler = { _ in}){
        
        URLSession.shared.dataTask(with: baseURL){
            (data, _, error) in
            if let error = error{
                print("Error getting users: \(error)")
            }
            guard let data = data else{
                print("No data returned")
            completion(nil)
            return
            }
            
            do{
                let newUser = try JSONDecoder().decode(Users.self, from: data)
                print(newUser)
                self.users = newUser.results
                
            }
            catch{
                print("Error decoding \(error)")
                completion(error)
            }
            
            completion(nil)
            
            
        }.resume()
    }
}
