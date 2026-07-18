//
//  UIElementsExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct UIElementsExampleView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView {
            TabViewTabContent1()
                .tabItem {
                    Label("First", systemImage: "arrow.up.square")
                    Text("First")
                }
            
            TabViewTabContent2()
                .tabItem {
                    Label("Second", systemImage: "arrow.up.square")
                    Text("Second")
                }
        }
        .environment(\.colorScheme, .light)
    }
}

struct TabViewTabContent1: View {
    var colors = ["Red", "Green", "Blue", "Yellow"]
    @State private var selectedColor = "Red"
    
    var body: some View {
        VStack {
            Text("First")
            VStack {
                Picker("Please choose a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                Text("Selected: \(selectedColor)")
            }
        }
    }
}

struct TabViewTabContent2: View {
    @State private var selectedProgress: Double = 0
    
    var body: some View {
        VStack {
            Text("Second")
            VStack {
                Slider(value: $selectedProgress, in: 0...300)
                Text("\(selectedProgress)")
            }
        }
    }
}

struct UIElementsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        UIElementsExampleView()
    }
}
