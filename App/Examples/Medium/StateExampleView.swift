//
//  StateExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

struct StateExampleView: View {
    // 1. define initial state
    @State private var isShowingLabel = true
    var body: some View {
        VStack {
            // 3. update value based on state
            if isShowingLabel {
                Text("Bold and Borderless. We are consultants but, above all, engineers, product experts, and designers who excel at strategy and delivery. While we're experts in the latest technology, we're practitioners of the best. Digital transcends borders and so do we. We select the best people worldwide to bring you boutique service at scale.")
            } else {
                Text("Tap button to see ....")
            }
            Button("What is Monstar lab") {
                // 2. change the state
                isShowingLabel.toggle()
            }
            .padding(.top)
        }
    }
}

struct StateExampleView_Previews: PreviewProvider {
    static var previews: some View {
        StateExampleView()
    }
}
