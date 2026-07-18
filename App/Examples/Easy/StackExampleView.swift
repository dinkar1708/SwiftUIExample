//
//  StackExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct StackExampleView: View {
    var body: some View {
        ZStack(alignment: .center) {
            // available area
            Color.purple .ignoresSafeArea()
            VStack(alignment: .trailing) {
                // vertical views
                VStack {
                    Text("V Stack Text1")
                    Spacer()
                    Text("V Stack Text2")
                }
                .background(Color.yellow)
                HStack {
                    // horizontal views
                    Text("V Stack Text1")
                    Spacer()
                    Text("V Stack Text2")
                }
                .background(Color.pink)
            }
            .background(Color.gray)
            Text("I am inside z stack overlap with other views boundary")
        }
    }
}

struct StackExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StackExampleView()
    }
}
