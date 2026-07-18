//
//  BindingExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

struct BindingExampleView: View {
    // 1. define state initial value
    @State private var isShowingStepper = true
    @State private var stepperValue: Int = 1400
    var body: some View {
        VStack {
            Text("Hire new members")
            // after 1. initial point also UI gets updated
            // 5. after change state UI gets updated.
            if isShowingStepper {
                Stepper("ML Members: \(stepperValue)", value: $stepperValue)
            }
            // 2. pass the state to other binding object
            BindingExampleChildView(isParentStateChanged: $isShowingStepper)
        }
    }
    
}

struct BindingExampleChildView: View {
    // 3. define binding for a state
    // update parent state
    @Binding var isParentStateChanged: Bool
    var body: some View {
        Button("Start") {
            // 4. change the state via binding variable.
            // patent variable gets updated.
            isParentStateChanged.toggle()
        }
    }
}

struct BindingExampleView_Previews: PreviewProvider {
    static var previews: some View {
        BindingExampleView()
    }
}

struct BindingExampleChildView_Previews: PreviewProvider {
    static var previews: some View {
        BindingExampleChildView(isParentStateChanged: .constant(true))
        BindingExampleChildView(isParentStateChanged: .constant(false))
    }
}

