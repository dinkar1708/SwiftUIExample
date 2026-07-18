//
//  SimpleZoomAnimationView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

struct SimpleZoomAnimationView: View {
    // start state of animation
    @State private var isShowAnimation = true
    var body: some View {
        VStack(spacing: 40) {
            Text("We shape technology that inspires people and grows businesses.")
                .scaleEffect(isShowAnimation ? 0.7 : 1)
                .padding(.bottom)
            Button("Zoom") {
                // change the animation state
                isShowAnimation.toggle()
            }
            // extra feature blur
            .blur(radius: 2)
            Text("Our technology starts with people because if they’re inspired, you succeed. We deliver expert engineering and stunningly designed digital solutions to unleash growth for your business, customers and society.")
                .scaleEffect(isShowAnimation ? 1 : 2)
                .padding(.top)
        }
    }
}

struct SimpleZoomAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleZoomAnimationView()
    }
}
