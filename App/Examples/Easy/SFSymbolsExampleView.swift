//
//  SFSymbolsExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/08.
//

import SwiftUI

// https://developer.apple.com/design/human-interface-guidelines/foundations/sf-symbols
// names https://sfsymbols.com/
struct SFSymbolsExampleView: View {
    var body: some View {
        HStack(spacing: 50) {
            // use system image for abc
        Image(systemName: "abc")
            .imageScale(.large)
            .foregroundColor(.blue)
            .frame(width: 32, height: 32)
            // use system image for 0.circle.fill
            Image(systemName: "0.circle.fill")
            
            Image(systemName: "30.circle")
            
            Image(systemName: "27.circle")
        }
        // make little cool ui
        .font(.title)
    }
}

struct SFSymbolsExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SFSymbolsExampleView()
    }
}
