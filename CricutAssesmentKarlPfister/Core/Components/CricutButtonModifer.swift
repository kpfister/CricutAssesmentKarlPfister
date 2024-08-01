//
//  CricutButtonModifer.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 8/1/24.
//

import Foundation
import SwiftUI

struct CricutButtonModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .background(.black)
            .cornerRadius(8)
    }
}
