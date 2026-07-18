//
//  ViewBuilderCustomView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/14.
//
import SwiftUI
struct ViewBuilderCustomView: View {
    var body: some View {
        // 1. use custom content view
        CustomContentView {
            // 5. all view inside this gets property from other view
            VStack {
                Text("My child ate a bit sorry! remaining for you.")
                Image("apple")
            }
        }.background(Color.yellow)
    }
}
struct CustomContentView<Content>: View where Content: View {
    // 2. pass any view
    var anyView: Content
    // 3. constructor takes the content
    init(@ViewBuilder content: () -> Content) {
        anyView = content()
        
    }
    
    var body: some View {
        Group {
            anyView
            // 4. apply properties on view
                .foregroundColor(.pink)
                .font(.title)
        }
    }
}
struct AdvanceViewUsingViewBuilderView_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderCustomView()
    }
}
