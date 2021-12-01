//
//  MockingNetworkManager.swift
//  GuessTheMovieTests
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import Foundation
@testable import GuessTheMovie

class MockinNetworkManager:ApiServices{
    
    let shouldReturnError :Bool
    
    init(shouldReturnError:Bool) {
        
        self.shouldReturnError = shouldReturnError
        
        
    }
    
    
    
    let mockingObj:[String : Any] =
        [
          "name": "12 Angry Men",
          "image": "12-angry-men.jpg",
          "wrong_answers": [
            "Army",
            "Fast",
            "Rings"
          ]
        ,
        
          "name": "Army Of The Dead",
          "image": "army-of-the-dead.jpg",
          "wrong_answers": [
            "And",
            "Gump",
            "Rings"
          ]
        
        ] 
    
    
    func get(request: URL, completion: @escaping (Result<Data, Error>) -> ()) {
        
        switch shouldReturnError {
        case true:
            completion(.failure(NetworkError.noData))
            
        case false:
            do{
                let data = try JSONSerialization.data(withJSONObject: self.mockingObj, options: .fragmentsAllowed)
            
                
                completion(.success(data))
                
                
            }catch(let error){
                
            }
         
            
            
        
        }
        
        
        
        
        
        
        
        
        
    }
    
    
    
    
    
}
