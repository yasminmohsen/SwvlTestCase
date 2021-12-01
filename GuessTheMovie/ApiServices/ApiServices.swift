//
//  ApiServices.swift
//  GuessTheMovie
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import Foundation

protocol ApiServices {
    func get(request: URL, completion: @escaping (Result<Data, Error>) -> ())
}

protocol RequestProtocol {
    var url: URL { get }
}
