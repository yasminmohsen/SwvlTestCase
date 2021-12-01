//
//  MovieStruct.swift
//  GuessTheMovie
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import Foundation
struct Movie : Codable {
    let name: String // Movie name will always be more than one word
    let image: String // The local image name
    let wrongAnswers: [String] // Will always be 3 items
    
    
    
    enum CodingKeys : String,CodingKey {
        case name = "name"
        case image = "image"
        case wrongAnswers = "wrong_answers"
        
    
}

}

