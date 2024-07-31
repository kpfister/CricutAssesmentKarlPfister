//
//  Shape.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation

struct CricutButtonTLD: Decodable, Hashable {
    private enum CodingKeys: String, CodingKey {
        case cricutButtons = "buttons"
    }
    let cricutButtons: [CricutButton]
}

struct CricutButton: Decodable, Hashable {
   
    private enum CodingKeys: String, CodingKey {
        case name
        case drawPath = "draw_path"
    }
    let name: String
    let drawPath: String
}

struct DrawShape: Identifiable {
    var id: Int = UUID().hashValue
    let name: String
}
/**
 {
    "buttons":[
       {
          "name":"Circle",
          "draw_path":"circle",
       },
       {
          "name":"Square",
          "draw_path":"square",
       },
       {
          "name":"Triangle",
          "draw_path":"triangle",
       },
    ]
 }
 
 */
