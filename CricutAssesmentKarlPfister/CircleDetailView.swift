//
//  CircleDetailView.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import SwiftUI

struct CircleDetailView: View {

    @ObservedObject var viewModel: MainGridViewModel
    
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: .infinity, maximum: 100)),GridItem(.adaptive(minimum: .infinity, maximum: 100)),GridItem(.adaptive(minimum: .infinity, maximum: 100))]) {
            ForEach(viewModel.gridShapes.filter({$0.name == "circle"})) { shape in
                    Circle()
            }
        }
        LazyHStack(alignment: .bottom, spacing: 40) {
            Button("Delete All") {
                // removes all circles
                viewModel.removeAllCircles()
            }
            Button("Add") {
                viewModel.addShape(ofType: "circle")
                // Tapping this appends a circle to the grid on this view and the parent view
            }
            Button("Remove") {
                // Tapping this removes the last circle on this view and the parent grid
                viewModel.removeLastCircle()
            }
        }
    }
}

//#Preview {
////    CircleDetailView(viewModel: $viewModel)
//}
