//
//  CleanCodeViewUsingExtension.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/13.
//

import SwiftUI

// MARK: - build headers
extension CleanCodeViewUsingExtension {
    
    func makeHeader() -> some View {
        Text("MonstarLab.....")
    }
    
    private var buildHeader : some View {
        Text("MonstarLab.....")
    }
}

// MARK: - build footers
extension CleanCodeViewUsingExtension {
    private var buildFooter : some View {
        Text("Footer.....")
    }
}

// MARK: - build views
extension CleanCodeViewUsingExtension {
    
     var buildList : some View {
        // List of details
        ForEach((1...13).reversed(), id: \.self) {
            Text("Android \($0)")
        }
    }
     var buildImages : some View {
        Group {
            // group arrange the child as per parent view
            // example if parent view is H stack child will be aligned in H stack
            Image("ml-logo")
                .resizable()
                .scaledToFit()
            Image("ml-logo")
                .resizable()
                .scaledToFit()
        }
    }
}

// clean code via extensions
struct CleanCodeViewUsingExtension: View {
    var body: some View {
        VStack {
            // use extension function
            makeHeader()
            buildHeader
            // two images
            buildImages
            
            Spacer()
            Divider().background(Color.red)
            buildList
            Divider().background(Color.red)
            buildFooter
        }
    }
}

struct CleanCodeViewUsingExtension_Previews: PreviewProvider {
    static var previews: some View {
        CleanCodeViewUsingExtension()
    }
}
