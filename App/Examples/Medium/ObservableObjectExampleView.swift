//
//  ObservableObjectExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

class ObservableObjectOnOff: ObservableObject {
    @Published var isShowingToggle: Bool = true
}

struct ObservableObjectExampleView: View {
    // 1. create self state
    @StateObject private var myObject = ObservableObjectOnOff()
    
    var body: some View {
        VStack {
            // maintain self state
            // 4. can change state from here
            Toggle("Enable a Mobile Workforce", isOn: $myObject.isShowingToggle)
            // 2. also share state with child
            ObservableObjectExampleChildView(myObjectOnOff: myObject)
        }
        .padding()
    }
}

struct ObservableObjectExampleChildView: View {
    // 3. state of parent
    @StateObject var myObjectOnOff: ObservableObjectOnOff
    
    var body: some View {
        // 4. child is listening for state change
        VStack {
            if myObjectOnOff.isShowingToggle {
                Text("Working remotely has never been easier.\n How Employee Apps Are the Backbone of Successful Enterprises")
            } else {
                Text("No")
            }
            Toggle("Enable a Mobile Workforce from Child", isOn: $myObjectOnOff.isShowingToggle)
        }
    }
}

struct ObservableObjectExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ObservableObjectExampleView()
    }
}
