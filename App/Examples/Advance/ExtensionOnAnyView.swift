//
//  ExtensionOnAnyView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/14.
//

import SwiftUI

// 1. define modifier
struct MyStyleUsingModifier: ViewModifier {
    // can pass optional params.
    var blur: Float = 1
    func body(content: Content) -> some View {
        content
            .blur(radius: CGFloat(blur))
            .cornerRadius(5.0)
    }
}

// 2. define extension function on view for modifier
extension View {
    // can pass parameters
    func applyMyStyle(_ blur: Float = 1) -> some View {
        modifier(MyStyleUsingModifier(blur: blur))
    }
}

struct ExtensionOnAnyView: View {
    var body: some View {
        VStack {
            // 3.1 use modifier
            // apply directly modifier, In this case need to use name MyStyleUsingModifier every time a bit difficult for refactor, modify etc.
            Text("Hello World!")
                .modifier(MyStyleUsingModifier())
            // 3.2 use modifier via extension
            // apply using view
            // easy to refactor code etc...
            Text("Hello World!")
                .applyMyStyle(0.5)
        }
    }
}

struct ExtensionOnAnyView_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionOnAnyView()
    }
}
