//
//  MainGridViewModel.swift
//  CricutAssesmentKarlPfister
//
//  Created by Karl Pfister on 7/30/24.
//

import Foundation
import SwiftUI

final class MainGridViewModel: ObservableObject {
    
    @Published var buttons: [CricutButton]?
    @Published var gridShapes: [CricutShape] = []
    
    private let service: ButtonDataProvidable
    
    init(service: ButtonDataProvidable = ButtonDataProvider()) {
        self.service = service
    }
    
    @MainActor
    func fetchButtons() async {
        do {
            self.buttons = try await service.fetchShapes(from: "http://staticcontent.cricut.com/static/test/shapes_001.json")
        } catch {
            print("DEBUG: Error fetching from ViewModel")
        }
    }
    
    func clearAllShapes() {
        gridShapes = []
    }

    func addShape(ofType shape: ShapeType) {
        let shape = CricutShape(type: shape)
        gridShapes.append(shape)
    }
    
}
