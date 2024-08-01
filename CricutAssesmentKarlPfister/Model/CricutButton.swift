//
//  Shape.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation

struct CricutButtonTLD: Decodable, Hashable {
    let buttons: [CricutButton]
}

struct CricutButton: Decodable, Hashable {
    let name: String
    let drawPath: ShapeType
}

enum ShapeType: String, Decodable {
    case square, circle, triangle
}
