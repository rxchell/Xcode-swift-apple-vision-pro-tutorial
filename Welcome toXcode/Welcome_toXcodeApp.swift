//
//  Welcome_toXcodeApp.swift
//  Welcome toXcode
//
//  Created by Rachel  on 5/8/25.
//

import SwiftUI

@main
struct Welcome_toXcodeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        WindowGroup(id: "PopupWindow") {
            PopupView()
        }
    }
}
