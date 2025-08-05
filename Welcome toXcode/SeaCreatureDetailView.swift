//
//  SeaCreatureDetailView.swift
//  Welcome toXcode
//
//  Created by Rachel  on 5/8/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct SeaCreatureDetailView: View {
    let modelName: String
    var body: some View {
        Model3D(named: modelName, bundle: realityKitContentBundle)
    }
}

#Preview {
    SeaCreatureDetailView(modelName: "FishScene")
}
