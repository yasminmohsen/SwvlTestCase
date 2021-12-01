//
//  NetworkManager.swift
//  GuessTheMovie
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import Foundation
class Networkmanager :ApiServices{
    
    func get(request: URL, completion: @escaping (Result<Data, Error>) -> ()){
        //let urlRequest = URLRequest(url: request.url)
        let urlRequest  = request
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if error != nil {
                completion(.failure(NetworkError.networkError))
                return
            }
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            completion(.success(data))
        }.resume()
    }
}

enum NetworkError: Error {
    case noData
    case networkError
}
    
    
    
    
    
    
    

