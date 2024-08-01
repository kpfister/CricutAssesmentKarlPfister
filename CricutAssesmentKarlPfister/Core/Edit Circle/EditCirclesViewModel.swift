//
//  EditCircleViewModel.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/31/24.
//

import Foundation
import SwiftUI

class EditCirclesViewModel: ObservableObject {
    
    @Binding var gridShapes: [CricutShape]
   
    init(gridShapes: Binding<[CricutShape]>) {
        self._gridShapes = gridShapes
    }

    func removeAllCircles() {
        gridShapes.removeAll(where: {$0.type == .circle})
    }
    
    func removeLastCircle() {
        guard let index = gridShapes.lastIndex(where: {$0.type == .circle}) else {return}
        gridShapes.remove(at: index)
    }
    
    func addShape(ofType shape: ShapeType) {
        let shape = CricutShape(type: shape)
        gridShapes.append(shape)
    }
}
