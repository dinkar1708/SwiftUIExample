//
//  CustomEnvironmentValueView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/09.
//

import SwiftUI

// 1. define the key
private struct CustomEnvKey: EnvironmentKey {
    static let defaultValue = Color.yellow
}

// 2. extension of EnvironmentValues library class
extension EnvironmentValues {
    var myCustomBackGroundColor: Color {
        get { self[CustomEnvKey.self] }
        set { self[CustomEnvKey.self] = newValue }
    }
}

struct CustomEnvironmentValueView: View {
    // 3. define key
    // Environment work with predefined and custom keys
    @Environment(\.myCustomBackGroundColor) var backgroundColor
    
    var body: some View {
        ZStack {
            // 4. use the env key
            backgroundColor
                .ignoresSafeArea()
            Text("Empower talent everywhere to engineer awesome products, services and ecosystems; building a brighter world for us all")
        }
    }
}

struct CustomEnvironmentValueView_Previews: PreviewProvider {
    static var previews: some View {
        CustomEnvironmentValueView()
    }
}
