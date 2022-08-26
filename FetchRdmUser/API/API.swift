//
//  API.swift
//  FetchRdmUser
//
//  Created by Saúl Pérez on 25/08/22.
//

import Foundation

class API {
    let baseURL = URL(string: "https://randomuser.me/api/?results=10")!
    
    struct EmptyData: Error {}
    
    func getUsers(completion: @escaping(Result<[User], Error>) -> Void) {
        URLSession.shared.dataTask(with: baseURL) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else {
                return completion(.failure(EmptyData()))
            }
            do{
                let result = try JSONDecoder().decode(Users.self, from: data)
                completion(.success(result.results))
            }
            catch{
                print(error)
                completion(.failure(error))
            }
        }.resume()
    }
}

extension Data {
    func printJSON(){
        if let JSONString = String(data: self, encoding: String.Encoding.utf8) {
            print(JSONString)
        }
    }
}
