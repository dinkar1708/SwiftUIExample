//
//  SpacerExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct SpacerExampleView: View {
    var body: some View {
        VStack {
            Text("Case closed.Over 2200 successful projects, worldwide")
            // push top view to top and bottom to bottom of the screen
//            Spacer()
            // take all available space except above text
            Rectangle()
                .fill(.red)
                .frame(height: 300)
            Capsule()
                .fill(.yellow)
                .frame(height: 200)
            HStack {
                // for this h stack divide space in two parts
                Spacer()
                Button("Terms of Service") {
                    
                }
                .padding()
            }
        }
    }
}

struct SpacerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SpacerExampleView()
    }
}
