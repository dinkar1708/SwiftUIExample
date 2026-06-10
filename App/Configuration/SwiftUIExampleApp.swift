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

struct ExampleRow: View {
    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(LinearGradient(colors: [color.opacity(0.8), color], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 50, height: 50)

                Image(systemName: icon)
                    .font(.title2)
                    .foregroundColor(.white)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.headline)
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 4)
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Section {
                    NavigationLink(destination: ListExampleView()) {
                        ExampleRow(
                            title: "List & ForEach",
                            subtitle: "Dynamic lists with CRUD operations",
                            icon: "list.bullet",
                            color: .blue
                        )
                    }

                    NavigationLink(destination: FormExampleView()) {
                        ExampleRow(
                            title: "Forms & Input",
                            subtitle: "Text fields, toggles, and pickers",
                            icon: "doc.text",
                            color: .green
                        )
                    }

                    NavigationLink(destination: GridLayoutView()) {
                        ExampleRow(
                            title: "Grid Layouts",
                            subtitle: "Adaptive, fixed, and flexible grids",
                            icon: "square.grid.3x3",
                            color: .orange
                        )
                    }

                    NavigationLink(destination: TabViewExampleView()) {
                        ExampleRow(
                            title: "Tab Views",
                            subtitle: "Bottom tab navigation pattern",
                            icon: "square.split.bottomrightquarter",
                            color: .purple
                        )
                    }

                    NavigationLink(destination: ModalSheetView()) {
                        ExampleRow(
                            title: "Modal Sheets",
                            subtitle: "Present views with custom sizes",
                            icon: "rectangle.portrait.bottomthird.inset.filled",
                            color: Color(red: 0, green: 0.7, blue: 0.9)
                        )
                    }
                } header: {
                    Text("User Interface")
                }

                Section {
                    NavigationLink(destination: AnimationExampleView()) {
                        ExampleRow(
                            title: "Animations",
                            subtitle: "Rotation, scale, slide, and fade",
                            icon: "wand.and.stars",
                            color: .pink
                        )
                    }

                    NavigationLink(destination: GestureExampleView()) {
                        ExampleRow(
                            title: "Gestures",
                            subtitle: "Tap, long press, drag, and pinch",
                            icon: "hand.tap",
                            color: Color(red: 0.3, green: 0.2, blue: 0.7)
                        )
                    }
                } header: {
                    Text("Interactions")
                }

                Section {
                    NavigationLink(destination: StateManagementView()) {
                        ExampleRow(
                            title: "State Management",
                            subtitle: "@State, @Binding, @ObservableObject",
                            icon: "slider.horizontal.3",
                            color: Color(red: 0.2, green: 0.7, blue: 0.7)
                        )
                    }

                    if #available(iOS 15.0, *) {
                        NavigationLink(destination: AsyncAwaitView()) {
                            ExampleRow(
                                title: "Async/Await",
                                subtitle: "Modern networking with async/await",
                                icon: "arrow.triangle.2.circlepath",
                                color: Color(red: 0.4, green: 0.9, blue: 0.7)
                            )
                        }
                    }
                } header: {
                    Text("Data & State")
                }

                Section {
                    NavigationLink(destination: MemoryGraphView()) {
                        ExampleRow(
                            title: "Memory Leak",
                            subtitle: "Strong reference cycle example",
                            icon: "exclamationmark.triangle",
                            color: .red
                        )
                    }

                    NavigationLink(destination: MemoryGraphWithoutLeakView()) {
                        ExampleRow(
                            title: "Fixed Memory",
                            subtitle: "Proper weak reference usage",
                            icon: "checkmark.circle",
                            color: .green
                        )
                    }
                } header: {
                    Text("Memory Management")
                }
            }
            .navigationTitle("SwiftUI Examples")
        }
    }
}
