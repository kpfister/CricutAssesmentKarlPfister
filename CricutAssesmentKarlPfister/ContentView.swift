//
//  ContentView.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MainGridViewModel()
    
    let testArray = ["Circle", "Square", "Triangle"]
    
    var body: some View {
        NavigationStack {
            VStack {
                //                        let threeColomns = [GridItem(.adaptive(minimum: .infinity, maximum: 100))]
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum: .infinity, maximum: 100)),GridItem(.adaptive(minimum: .infinity, maximum: 100)),GridItem(.adaptive(minimum: .infinity, maximum: 100))]) {
                    ForEach(viewModel.gridShapes) { shape in
                        if shape.name == "circle" {
                            Circle()
                        } else if shape.name == "square" {
                            Rectangle()
                                .aspectRatio(1.0, contentMode: .fit)
                        } else {
                            CricutTriangle()
                                .frame(width: 100, height: 100)
                        }
                    }
                }
                
                Spacer()
                
            }
            LazyHStack(alignment: .bottom, spacing: 40) {
                ForEach(viewModel.buttons ?? [], id: \.self) { shape in
                    Button(shape.name) {
                        viewModel.addShape(ofType: shape.drawPath)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Clear All") {
                        viewModel.clearAllShapes()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        EditCirclesView(viewModel: viewModel)
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
