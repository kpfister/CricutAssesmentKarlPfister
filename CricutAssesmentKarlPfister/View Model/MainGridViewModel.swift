//
//  MainGridViewModel.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation
import SwiftUI

class MainGridViewModel: ObservableObject {
    
    @Published var buttons: [CricutButton]?
    @Published var gridShapes: [DrawShape] = []
    
    private let service: ButtonDataProvidable
    
    init(service: ButtonDataProvidable = ButtonDataProvider()) {
        self.service = service
    }
    
    @MainActor
    func fetchButtons() async {
        do {
            self.buttons = try await service.fetchShapes(from: "https://staticcontent.cricut.com/static/test/shapes_001.json")
        } catch {
            print("DEBUG: Error fetching from ViewModel")
        }
    }
    
    func clearAllShapes() {
        gridShapes = []
    }

    func addShape(ofType shape: String) {
        let shape = DrawShape(name: shape)
        gridShapes.append(shape)
        print(shape)
    }
    
    /// Detail View
    func removeAllCircles() {
        gridShapes.removeAll(where: {$0.name == "circle"})
    }
    
    func removeLastCircle() {
        guard let index = gridShapes.lastIndex(where: {$0.name == "circle"}) else {return}
        gridShapes.remove(at: index)
    }

}
