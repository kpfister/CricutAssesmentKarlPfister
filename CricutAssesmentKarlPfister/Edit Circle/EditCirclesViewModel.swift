//
//  EditCircleViewModel.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/31/24.
//

import Foundation

class EditCirclesViewModel: ObservableObject {
//    @Published var gridShapes: [DrawShape]
//    init(gridShapes: [DrawShape]) {
//        self.gridShapes = gridShapes
//    }
    
    func removeAllCircles() {
//        gridShapes.removeAll(where: {$0.name == "circle"})
    }
    
    func removeLastCircle() {
//        guard let index = gridShapes.lastIndex(where: {$0.name == "circle"}) else {return}
//        gridShapes.remove(at: index)
    }
    
    func addShape(ofType shape: String) {
//        let shape = DrawShape(name: shape)
//        gridShapes.append(shape)
//        print(shape)
    }
}
