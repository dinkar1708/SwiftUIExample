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
            ContentView()
        }
        .onChange(of: scenePhase) { phase in
            print("onChange scenePhase \(phase)")
            switch phase {
            case .active:
                print("App is active")
            case .inactive:
                print("App is inactive")
            case .background:
                print("App is in background")
            @unknown default:
                print("Unknown phase")
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Modal Sheet Demo", destination: ModalSheetView())
                NavigationLink("Memory Leak Example", destination: MemoryGraphView())
                NavigationLink("Fixed Memory Example", destination: MemoryGraphWithoutLeakView())
            }
            .navigationTitle("SwiftUI Examples")
        }
    }
}
