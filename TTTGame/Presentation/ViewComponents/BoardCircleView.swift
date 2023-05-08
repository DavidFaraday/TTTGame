//
//  BoardCircleView.swift
//  TTTGame
//
//  Created by David Kababyan on 30/04/2023.
//

import SwiftUI

struct BoardCircleView: View {
    
    var geometry: GeometryProxy
    
    @State var sizeDivider: CGFloat = 3
    @State var padding: CGFloat = 15
    
    
    var body: some View {
        Circle()
            .fill(.white)
            .frame(width: geometry.size.width / sizeDivider - padding,
                   height: geometry.size.width / sizeDivider - padding)
            .onAppear {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    sizeDivider = 5
                }
            }
    }
}

struct BoardCircleView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            BoardCircleView(geometry: geometry)

        }
    }
}
