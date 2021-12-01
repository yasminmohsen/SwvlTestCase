//
//  Utilities.swift
//  GuessTheMovie
//
//  Created by Yasmin Mohsen on 01/12/2021.
//

import Foundation

func splitMovieName(name:String)->String{
    let split = name.split(separator: " ")
    let last  = String(split.suffix(1).joined(separator: [" "]))
    return last
    
}



func rearrange(array: [String], fromIndex: Int, toIndex: Int) -> [String]{
    var arr = array
    let element = arr.remove(at: fromIndex)
    arr.insert(element, at: toIndex)
    
    return arr
}
