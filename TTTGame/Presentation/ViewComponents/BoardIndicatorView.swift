//
//  BoardIndicatorView.swift
//  TTTGame
//
//  Created by David Kababyan on 30/04/2023.
//

import SwiftUI

struct BoardIndicatorView: View {
    
    var imageName: String
    @State private var scale = 1.5
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .frame(width: 40, height: 40)
            .scaledToFit()
            .foregroundColor(.indigo)
            .scaleEffect(scale)
            .animation(.spring(), value: scale)
            .shadow(radius: 5)
            .onChange(of: imageName) { newValue in
                self.scale = 2.5
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.scale = 1.5
                }
            }
        
    }
}

struct BoardIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        BoardIndicatorView(imageName: "applelogo")
    }
}
