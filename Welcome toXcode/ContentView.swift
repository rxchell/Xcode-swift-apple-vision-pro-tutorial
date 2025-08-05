//
//  ContentView.swift
//  Welcome toXcode
//
//  Created by Rachel  on 5/8/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct BorderedCaption: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1)
            )
            .foregroundColor(Color.white)
    }
}

extension View {
    func borderedCaption() -> some View {
        modifier(BorderedCaption())
    }
}

struct Buttons: View {
    @State private var counter = 0
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        HStack {
            Button("Subtract") {
                counter -= 1
                print("Subtract \(counter)")
                checkCounter()
            }
            Text("Counter: \(counter)")
            if counter > 10 {
                Text("Counter exceeded 10")
            }
            Button("Add") {
                counter += 1
                print("Add \(counter)")
                checkCounter()
            }
        }
        .padding()
    }
    
    private func checkCounter() {
        if counter == 11 {
            openWindow(id: "PopupWindow")
        }
    }
}

struct ContentView: View {
    @State private var selectedCreature: SeaCreature?
    
    private var seaCreatures = [
        SeaCreature(name: "Clam", modelName: "ClamScene"),
        SeaCreature(name: "Starfish", modelName: "StarfishScene"),
        SeaCreature(name: "Fish", modelName: "FishScene"),
        SeaCreature(name: "Slug", modelName: "SlugScene")
    ]
    var body: some View {
        NavigationSplitView {
            List(seaCreatures) { creature in
                Button(action: {
                    selectedCreature = creature
                }, label: {
                    Text(creature.name)
                })
            }.navigationTitle("SeaCreatures")
        } detail: {
            if let selectedCreature {
                Model3D(named: selectedCreature.modelName, bundle: realityKitContentBundle).navigationTitle(selectedCreature.name).toolbar {
                    Button(action: {
                        
                    }, label: {
                        Text("View \(selectedCreature.name)")
                    })
                }
            }
        }
        
//        VStack {
//            HStack {
//                Model3D(named: "SlugScene", bundle: realityKitContentBundle).padding(.bottom, 50)
//                Model3D(named: "FishScene", bundle: realityKitContentBundle).padding(.bottom, 50)
//                Model3D(named: "ClamScene", bundle: realityKitContentBundle).padding(.bottom, 50)
//                Model3D(named: "StarfishScene", bundle: realityKitContentBundle).padding(.bottom, 50)
//            }
//            Model3D(named: "ToyBiplane", bundle: realityKitContentBundle).padding(.bottom, 50)
//            Text("Hello, I am Rachel!").borderedCaption()
//            Spacer()
//            Image("IMG").resizable().aspectRatio(contentMode: .fit)
//        }
//        .padding()
//        HStack{
//            VStack {
//                Text("I code.")
//                Image(systemName: "laptopcomputer").imageScale(.large).foregroundStyle(Color.white)
//            }
//            VStack{
//                Text("I swim.")
//                Image(systemName: "figure.pool.swim.circle.fill").imageScale(.large).foregroundStyle(Color.white)
//            }
//            VStack {
//                Text("I run.")
//                Image(systemName: "figure.run.circle.fill").imageScale(.large).foregroundStyle(Color.white)
//            }
//        }.padding()
//        Buttons()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
