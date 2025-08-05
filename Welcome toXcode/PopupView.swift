//
//  PopupView.swift
//  Welcome toXcode
//
//  Created by Rachel  on 5/8/25.
//

import SwiftUI

struct PopupView: View {
    var body: some View {
        VStack {
            Text("Counter exceeded 10!")
                .font(.largeTitle)
                .padding()
            Text("You triggered a new window.")
        }
        .frame(minWidth: 300, minHeight: 200)
    }
}
