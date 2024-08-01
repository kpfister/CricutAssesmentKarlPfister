//
//  ContentView.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = MainGridViewModel()
    
    private let gridItemLayout = [GridItem(.flexible(minimum: 10, maximum: 100)),GridItem(.flexible(minimum: 10, maximum: 100)),GridItem(.flexible(minimum: 10, maximum: 100))]
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottom) {
                ScrollView {
                    LazyVGrid(columns: gridItemLayout) {
                        ForEach(viewModel.gridShapes) { shape in
                            switch shape.type {
                            case .circle:
                                Circle()
                                    .foregroundStyle(.red)
                            case .square:
                                Rectangle()
                                    .aspectRatio(1.0, contentMode: .fit)
                                    .foregroundStyle(.teal)
                            case .triangle:
                                CricutTriangle()
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                }
                ButtonsView(viewModel: viewModel)
                    .padding()
                
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Clear All") {
                        viewModel.clearAllShapes()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        EditCirclesView(viewModel: EditCirclesViewModel(gridShapes: self.$viewModel.gridShapes))
                    } label: {
                        Text("Edit Circles")
                    }
                }
            }
        }
        .task {
            await viewModel.fetchButtons()
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
