//
//  GameMode.swift
//  TTTGame
//
//  Created by David Kababyan on 29/04/2023.
//

import SwiftUI

enum GameMode: CaseIterable, Identifiable {
    
    var id: Self { return self }
    
    case vsHuman, vsCPU, online
    
    var name: String {
        switch self {
        case .vsHuman:
            return AppStrings.vsHuman
        case .vsCPU:
            return AppStrings.vsCpu
        case .online:
            return AppStrings.online
        }
    }
    
    var color: Color {
        switch self {
        case .vsHuman:
            return Color.indigo
        case .vsCPU:
            return Color.red
        case .online:
            return Color.green
        }
    }
}
