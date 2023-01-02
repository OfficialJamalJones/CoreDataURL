//
//  Response.swift
//  Core_Data
//
//  Created by Consultant on 1/2/23.
//

import Foundation

struct Response:Codable {
    var results:[Result]
}

struct Result:Codable {
    var trackId:Int
    var trackName:String
    var collectionName:String
}
