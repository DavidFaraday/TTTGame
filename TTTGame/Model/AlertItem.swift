//
//  AlertItem.swift
//  TTTGame
//
//  Created by David Kababyan on 30/04/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    var title: Text
    var message: Text
    var buttonTitle: Text
    
    init(title: String, message: String, buttonTitle: String = AppStrings.rematch) {
        self.title = Text(title)
        self.message = Text(message)
        self.buttonTitle = Text(buttonTitle)
    }
}
