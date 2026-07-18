//
//  EnvironmentObjectExampleView.swift.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

class ObservableObjectOnOffEnv: ObservableObject {
    @Published var isShowingToggle: Bool = false
}

struct EnvironmentObjectExampleView: View {
    // 1. create self state
    @StateObject private var myObject = ObservableObjectOnOffEnv()
    
    var body: some View {
        if #available(iOS 15.0, *) {
            // if dont use variable need to return complete view
            let _ = Self._printChanges()
        }
        // here need to write return if dont use variable as suggested above.
        ZStack {
            Color.yellow.ignoresSafeArea()
            VStack(spacing: 50) {
                // maintain self state
                Toggle("Study via iTalki?", isOn: $myObject.isShowingToggle)
                Image("kanji").resizable().scaledToFit()
                // also share state with child
                EnvironmentObjectExampleChildView()
                // 2. pass my object as environment object
                    .environmentObject(myObject)
                EnvironmentObjectExampleChild2View()
                // pass my object as environment object
                    .environmentObject(myObject)
            }
        }
    }
}

struct EnvironmentObjectExampleChildView: View {
    // 3. define object from environment
    // state of parent
    // EnvironmentObject read object from the environment
    @EnvironmentObject var myObjectOnOff: ObservableObjectOnOffEnv
    
    var body: some View {
        // 4. use object
        if myObjectOnOff.isShowingToggle {
            Text("Yes i will study ")
        } else {
            Text("I dont want to study japanese :)")
        }
    }
}

struct EnvironmentObjectExampleChild2View: View {
    @EnvironmentObject var myObjectOnOff: ObservableObjectOnOffEnv
    
    var body: some View {
        if myObjectOnOff.isShowingToggle {
            Text("Yes")
        } else {
            Text("No")
        }
    }
}

struct EnvironmentObjectExampleView_Previews: PreviewProvider {
    static var previews: some View {
        EnvironmentObjectExampleView()
    }
}
