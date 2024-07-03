//
//  ContentView.swift
//  VisionOS2SamplePushWindow
//
//  Created by Sadao Tokuyama on 7/3/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    
    @Environment(\.pushWindow) private var pushWindow
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        Image("pancakes")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 400, height: 400)
            .clipShape(Circle())
            .scaleEffect(scale)
            .hoverEffect { effect, isActive, _ in
                effect.scaleEffect(isActive ? 1.25 : 1.0)
            }
            .gesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in
                withAnimation {
                    self.scale = 0.85
                }
            }
            .onEnded { _ in
                withAnimation {
                    self.scale = 1.0
                }
                pushWindow(id: "pancakes")
            }
        )
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
