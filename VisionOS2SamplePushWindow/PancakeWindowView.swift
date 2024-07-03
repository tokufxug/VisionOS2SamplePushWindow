//
//  PushWindowView.swift
//  VisionOS2SamplePushWindow
//
//  Created by Sadao Tokuyama on 7/3/24.
//

import SwiftUI
import RealityKit

struct PancakeWindowView: View {
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    @State private var r:Double = 0
    
    var body: some View {
        RealityView { content in
            let model = try! await ModelEntity(named: "pancakes")
            model.scale*=1.5
            content.add(model)
        }
        .rotation3DEffect(.degrees(r), axis: (x: 0.0, y: 1.0, z: 0.0))
        .onReceive(timer) { _ in
            self.r+=0.5
        }
    }
    
}

#Preview {
    PancakeWindowView()
}
