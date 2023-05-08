//
//  TTTGameApp.swift
//  TTTGame
//
//  Created by David Kababyan on 29/04/2023.
//

import SwiftUI
import Firebase

@main
struct TTTGameApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
