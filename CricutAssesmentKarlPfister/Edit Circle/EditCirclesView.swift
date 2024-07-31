//
//  CircleDetailView.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import SwiftUI

struct EditCirclesView: View {

    @Binding var gridshapesFromContentView: [DrawShape]
//    @ObservedObject var viewModel: MainGridViewModel
//    @StateObject var viewModel: EditCirclesViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: .infinity, maximum: 100)),GridItem(.adaptive(minimum: .infinity, maximum: 100)),GridItem(.adaptive(minimum: .infinity, maximum: 100))]) {
            ForEach(gridshapesFromContentView.filter({$0.name == "circle"})) { shape in
                    Circle()
            }
//            ForEach(viewModel.gridShapes.filter({$0.name == "circle"})) { shape in
//                    Circle()
//            }
        }
        LazyHStack(alignment: .bottom, spacing: 40) {
            Button("Delete All") {
                // removes all circles
                gridshapesFromContentView.removeAll(where: {$0.name == "circle"})
//                viewModel.removeAllCircles()
            }
            Button("Add") {
//                viewModel.addShape(ofType: "circle")
                // Tapping this appends a circle to the grid on this view and the parent view
                        let shape = DrawShape(name: "circle")
                        gridshapesFromContentView.append(shape)
            }
            Button("Remove") {
                // Tapping this removes the last circle on this view and the parent grid
//                viewModel.removeLastCircle()
                        guard let index = gridshapesFromContentView.lastIndex(where: {$0.name == "circle"}) else {return}
                        gridshapesFromContentView.remove(at: index)
            }
        }
    }
}

//#Preview {
////    EditCirclesView(gridshapesFromContentView: )
//}
