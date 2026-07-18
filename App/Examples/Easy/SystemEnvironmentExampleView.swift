//
//  SystemEnvironmentExampleView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

struct SystemEnvironmentExampleView: View {
    // define environment variables
    @Environment(\.presentationMode) var presentation
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.locale) private var locale
    @Environment(\.accessibilityEnabled) var accessibilityEnabled
    @Environment(\.calendar) private var calendar
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    var body: some View {
        VStack(spacing: 40) {
            Button("dismiss") {
                // use environment variable
                presentation.wrappedValue.dismiss()
            }
            Text(locale.description)
            Text(calendar.description)
            Text(accessibilityEnabled.description)
            Text(horizontalSizeClass == .compact ? "Compact": "Regular")
            Text(colorScheme == .dark ? "Dark mode" : "Light mode")
        }
        .background(Color.yellow)
    }
}

struct SystemEnvironmentExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SystemEnvironmentExampleView()
    }
}
