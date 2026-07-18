//
//  ColorExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/13.
//

import SwiftUI

struct ColorExampleView: View {
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .foregroundColor(Color.gray)
        // use define color in color assets
            .background(Color("MyColor"))
    }
}

struct ColorExampleView_Previews: PreviewProvider {
    static var previews: some View {
        // dark and light mode example from here
        ColorExampleView()
            .preferredColorScheme(.light)
        ColorExampleView()
            .preferredColorScheme(.dark)
    }
}
