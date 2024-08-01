//
//  CircleDetailView.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import SwiftUI

struct EditCirclesView: View {
    
    @ObservedObject var viewModel: EditCirclesViewModel
    
    private let gridItemLayout = [GridItem(.flexible(minimum: 10, maximum: 100)),GridItem(.flexible(minimum: 10, maximum: 100)),GridItem(.flexible(minimum: 10, maximum: 100))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridItemLayout) {
                ForEach(viewModel.gridShapes.filter({$0.type == .circle})) { shape in
                    Circle()
                        .foregroundStyle(.red)
                }
            }
        }
        Spacer()
        LazyHStack() {
            Button("Delete All") {
                viewModel.removeAllCircles()
            }
            .padding()
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .background(.black)
            .cornerRadius(8)
            
            Button("Add") {
                viewModel.addShape(ofType: .circle)
            }
            .padding()
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .background(.black)
            .cornerRadius(8)
            
            Button("Remove") {
                viewModel.removeLastCircle()
            }
            .padding()
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .background(.black)
            .cornerRadius(8)
        }
//        .frame(height: 4)
        .background(.green)
    }
}

#Preview {
    @State var shapes = [CricutShape(type: .circle),CricutShape(type: .square),CricutShape(type: .triangle)]
    let viewModel = EditCirclesViewModel(gridShapes: $shapes)
    return EditCirclesView(viewModel: viewModel)
}
