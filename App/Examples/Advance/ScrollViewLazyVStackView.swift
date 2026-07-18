//
//  ScrollViewLazyVStackView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/14.
//

import SwiftUI
let listItemSize = 1000

// Example 3 correct usages of VStack for horizontal list
struct ScrollViewLazyVStackView1: View {
    var body: some View {
        ScrollView(.horizontal) {
            // creates all v stack child on list scroll.
            // horizontal list
            // lazy here is important to use. dont use only h stack
            LazyHStack {
                ForEach(0..<listItemSize, id: \.self) {
                    ScrollViewLazyVStackRow(label: "List number \($0)")
                }
            }
        }
    }
}

// Example 2 correct usages of VStack for vertical list
struct ScrollViewLazyVStackView3: View {
    var body: some View {
        ScrollView {
            // creates all v stack child on list scroll.
            // vertical list
            // memory 17.8 MB
            LazyVStack {
                ForEach(0..<listItemSize, id: \.self) {
                    ScrollViewLazyVStackRow(label: "List number \($0)")
                }
            }
        }
    }
}

// Example 1 bad usages of VStack for list
struct ScrollViewLazyVStackView: View {
    var body: some View {
        ScrollView {
            // creates all v stack child immediately.
            // memory 78.9 MB
            // very expensive
            VStack {
                ForEach(0..<listItemSize, id: \.self) {
                    ScrollViewLazyVStackRow(label: "List number \($0)")
                }
            }
        }
    }
}

// use as row for other views
struct ScrollViewLazyVStackRow: View {
    let label: String
    
    init(label: String) {
        self.label = label
        print("ScrollViewLazyVStackRow init... \(label)")
    }
    
    var body: some View {
        Text(label)
            .padding()
            .background(Color.red)
    }
}


struct ScrollViewLazyVStackView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollViewLazyVStackView1()
    }
}
