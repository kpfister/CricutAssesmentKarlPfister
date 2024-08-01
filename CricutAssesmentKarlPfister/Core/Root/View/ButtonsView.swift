//
//  ButtonsView.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 8/1/24.
//

import SwiftUI

struct ButtonsView: View {
    @ObservedObject var viewModel: MainGridViewModel
    
    var body: some View {
        // add background
        HStack(alignment: .bottom, spacing: 40) {
            ForEach(viewModel.buttons ?? [], id: \.self) { shape in
                Button(shape.name) {
                    viewModel.addShape(ofType: shape.drawPath)
                }
                .modifier(CricutButtonModifer())
            }
        }
    }
}

#Preview {
    let vm = MainGridViewModel()
    vm.buttons = [CricutButton(name: "Circle", drawPath: .circle),CricutButton(name: "Square", drawPath: .square),CricutButton(name: "Triangle", drawPath: .triangle)]
    return ButtonsView(viewModel: vm)
}
