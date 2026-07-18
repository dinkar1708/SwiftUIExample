//
//  ViewModifierExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct ViewModifierExampleView: View {
    var body: some View {
        VStack {
            Text("会社からのお知らせ")
            // apply modifier on text view
                .modifier(TextModifier())
            Text(" 総務 (社内申請・手続き")
                .modifier(TextModifier())
            Text("人事")
                .modifier(TextModifier())
        }
    }
}

// modifier definition
struct TextModifier: ViewModifier {
    // pass dynamic content
    func body(content: Content) -> some View {
        content
        // apply attributes on view
            .foregroundColor(.blue)
            .padding()
            .background(Color.red)
    }
}

struct ViewModifierExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ViewModifierExampleView()
    }
}
