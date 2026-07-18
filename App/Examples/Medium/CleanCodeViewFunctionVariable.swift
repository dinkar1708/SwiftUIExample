//
//  CleanCodeViewFunctionVariable.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/13.
//

import SwiftUI

struct CleanCodeViewFunction: View {
    var body: some View {
        // can define any ui variable common to this screen only
        let divider = Divider()
            .background(Color.red)
        VStack {
            // use function to separate view details
            buildHeader()
            buildHeader()
            // two images
            buildImages("ml-logo")
            // can make more rows....
            buildImages("ml-logo")
            Spacer()
            divider
            // List of details
            buildListItems()
            divider
        }
    }
    
    private func buildHeader() -> some View {
        Link("ML Blog", destination: URL(string: "https://engineering.monstar-lab.com/en/")!)
    }
    
    private func buildImages(_ name: String) -> some View {
        Group {
            // group arrange the child as per parent view
            // example if parent view is H stack child will be aligned in H stack
            Image(name)
                .resizable()
                .scaledToFit()
            Image(name)
                .resizable()
                .scaledToFit()
        }
    }
    
    private func buildListItems() -> some View {
        ForEach((1...16).reversed(), id: \.self) {
            Text("iOS \($0)")
        }
    }
}

struct CleanCodeViewVariable: View {
    var body: some View {
        // can define any ui variable common to this screen only
        let divider = Divider().background(Color.red)
        VStack {
            buildHeader
            // two images
            buildImages
            buildImages
            Spacer()
            divider
            // List of details
            buildListItems
            divider
        }
    }
    
    private var buildHeader : some View {
        Link("ML Blog", destination: URL(string: "https://engineering.monstar-lab.com/en/")!)
    }
    
    private var buildImages : some View {
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
    
    private var buildListItems : some View {
        ForEach((1...16).reversed(), id: \.self) {
            Text("iOS \($0)")
        }
    }
}



// example of dirty code all inside single view
struct CleanCodeViewFunctionVariableBad: View {
    var body: some View {
        VStack {
            Link("ML Blog", destination: URL(string: "https://engineering.monstar-lab.com/en/")!)
            // two images
            Image("ml-logo")
                .resizable()
                .scaledToFit()
            Image("ml-logo")
                .resizable()
                .scaledToFit()
            Image("ml-logo")
                .resizable()
                .scaledToFit()
            Image("ml-logo")
                .resizable()
                .scaledToFit()
            Spacer()
            Divider().background(Color.red)
            // List of details
            ForEach((1...16).reversed(), id: \.self) {
                Text("iOS \($0)")
            }
            Divider().background(Color.red)
        }
    }
}

struct CleanCodeViewFunctionVariable_Previews: PreviewProvider {
    static var previews: some View {
        CleanCodeViewFunction()
    }
}
