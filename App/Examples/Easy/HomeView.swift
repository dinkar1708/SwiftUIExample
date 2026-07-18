//
//  HomeView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

// everything is struct
struct HomeView: View {
    // body for view
    // library class  @ViewBuilder var body: Self.Body { get } needs body keyword
    /*
    public protocol View {

        /// The type of view representing the body of this view.
        ///
        /// When you create a custom view, Swift infers this type from your
        /// implementation of the required ``View/body-swift.property`` property.
        associatedtype Body : View

        /// The content and behavior of the view.
        ///
        /// When you implement a custom view, you must implement a computed
        /// `body` property to provide the content for your view. Return a view
        /// that's composed of built-in views that SwiftUI provides, plus other
        /// composite views that you've already defined:
        ///
        ///     struct MyView: View {
        ///         var body: some View {
        ///             Text("Hello, World!")
        ///         }
        ///     }
        ///
        /// For more information about composing views and a view hierarchy,
        /// see <doc:Declaring-a-Custom-View>.
        @ViewBuilder var body: Self.Body { get }
    }
    */
    
    var body: some View {
        ZStack {
            // use all available space
            Color.yellow .ignoresSafeArea()
            HStack { // default take only required space
                Text("Swift UI Training by a monstar")
                    .padding()
            }
            .background(Color.red)
            .frame(maxWidth: .infinity)
            // taken all space around width
            .background(Color.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    // preview view
    static var previews: some View {
        HomeView()
    }
}
