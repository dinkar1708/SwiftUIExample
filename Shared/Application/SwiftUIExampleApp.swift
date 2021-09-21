//
//  SwiftUIExampleApp.swift
//  Shared
//
//  Created by Dinakar Maurya on 2021/01/05.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            //            ModalSheetView()
                        MemoryGraphView()
//            MemoryGraphWithoutLeakView()
            
        }.onChange(of: scenePhase) { phase in
            print("onChange scenePhase \(phase)")
            switch phase {
            case .active:
                print("active")
            case .inactive:
                print("inactive")
            case .background:
                print("background")
            @unknown default:
                print("unknown")
            }
        }
    }
}
