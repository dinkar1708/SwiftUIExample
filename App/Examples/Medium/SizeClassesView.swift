//
//  SizeClassesView.swift
//  SWIFT UI Training
//
//  Created by dinakar maurya on 2022/09/16.
//

import SwiftUI

// https://developer.apple.com/design/human-interface-guidelines/foundations/layout/
// Size classes are screen sizes
struct WidthSizeClassesView: View {
    @Environment(\.horizontalSizeClass) var widthSizeClasses : UserInterfaceSizeClass?
    
    var body: some View {
        // Device    Portrait orientation    Landscape orientation
        // Example 1 XR
        // iPhone XR    Compact width, regular height    Regular width, compact height
        // Use width from above attribute
        // iPhone XR     Compact width                   Regular width
        
        // Example 2 XS
        // Phone XS    Compact width, regular height    Compact width, compact height
        // Use width from above attribute
        // Phone XS    Compact width   Compact width
        
        if widthSizeClasses == .compact {
            Text("Compact width........")
        } else if  widthSizeClasses == .regular {
            Text("Regular width....")
        } else {
            Text("Unknown")
        }
    }
}

struct HeightSizeClassesView: View {
    @Environment(\.verticalSizeClass) var heightSizeClasses : UserInterfaceSizeClass?
    
    var body: some View {
        // Device    Portrait orientation    Landscape orientation
        // Example 1 XR
        // iPhone XR    Compact width, regular height    Regular width, compact height
        // Use height from above attribute
        // iPhone XR    regular height    compact height
        
        // Example 2 XS
        // Phone XS    Compact width, regular height    Compact width, compact height
        // Use height from above attribute
        // Phone XS    regular height    compact height
        
        if heightSizeClasses == .compact {
            Text("Compact height........")
        } else if  heightSizeClasses == .regular {
            Text("Regular height....")
        } else {
            Text("Unknown")
        }
    }
}

struct SizeClassesView_Previews: PreviewProvider {
    static var previews: some View {
        WidthSizeClassesView()
    }
}
