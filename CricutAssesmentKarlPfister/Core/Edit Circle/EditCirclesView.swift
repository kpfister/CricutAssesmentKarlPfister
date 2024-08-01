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
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItemLayout) {
                    ForEach(viewModel.gridShapes.filter({$0.type == .circle})) { shape in
                        Circle()
                            .foregroundStyle(.red)
                    }
                }
            }
            
            Spacer()
            
            HStack(alignment: .bottom, spacing: 40) {
                Button("Delete All") {
                    viewModel.removeAllCircles()
                }
                .modifier(CricutButtonModifer())
                
                Button("Add") {
                    viewModel.addShape(ofType: .circle)
                }
                .modifier(CricutButtonModifer())
                
                Button("Remove") {
                    viewModel.removeLastCircle()
                }
                .modifier(CricutButtonModifer())
            }
        }
    }
}


#Preview {
    @State var shapes = [CricutShape(type: .circle),CricutShape(type: .square),CricutShape(type: .triangle)]
    let viewModel = EditCirclesViewModel(gridShapes: $shapes)
    return EditCirclesView(viewModel: viewModel)
}
