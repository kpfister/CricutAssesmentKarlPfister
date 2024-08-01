//
//  CricutTriangle.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import SwiftUI

struct CricutTriangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.closeSubpath()
        }
    }
}

#Preview {
    CricutTriangle()
}
