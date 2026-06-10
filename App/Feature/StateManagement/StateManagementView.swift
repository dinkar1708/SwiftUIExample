//
//  StateManagementView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya
//

import SwiftUI

// MARK: - Observable Object
class CounterViewModel: ObservableObject {
    @Published var count = 0

    func increment() {
        count += 1
    }

    func decrement() {
        count -= 1
    }

    func reset() {
        count = 0
    }
}

// MARK: - Child View with Binding
struct CounterDisplayView: View {
    @Binding var value: Int

    var body: some View {
        VStack {
            Text("Child View")
                .font(.headline)
            Text("\(value)")
                .font(.system(size: 48, weight: .bold))
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color.blue.opacity(0.1))
        .cornerRadius(10)
    }
}

// MARK: - Main State Management View
struct StateManagementView: View {
    // @State - for local view state
    @State private var simpleCounter = 0

    // @StateObject - for creating and owning an observable object
    @StateObject private var viewModel = CounterViewModel()

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // @State Example
                VStack(alignment: .leading, spacing: 10) {
                    Text("@State - Local View State")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Count: \(simpleCounter)")
                        .font(.title)

                    HStack {
                        Button("Increment") {
                            simpleCounter += 1
                        }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        Button("Reset") {
                            simpleCounter = 0
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }

                    Text("@State is for simple value types owned by the view")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // @Binding Example
                VStack(alignment: .leading, spacing: 10) {
                    Text("@Binding - Shared State")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Parent View")
                        .font(.headline)
                    Text("\(simpleCounter)")
                        .font(.system(size: 36, weight: .semibold))

                    // Child view receives binding
                    CounterDisplayView(value: $simpleCounter)

                    Text("@Binding allows child views to read and write parent state")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                // @StateObject and @ObservableObject Example
                VStack(alignment: .leading, spacing: 10) {
                    Text("@StateObject/@ObservableObject")
                        .font(.title2)
                        .fontWeight(.bold)

                    Text("Count: \(viewModel.count)")
                        .font(.title)

                    HStack {
                        Button(action: viewModel.increment) {
                            Label("Increment", systemImage: "plus")
                        }
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        Button(action: viewModel.decrement) {
                            Label("Decrement", systemImage: "minus")
                        }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                        Button(action: viewModel.reset) {
                            Label("Reset", systemImage: "arrow.counterclockwise")
                        }
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                    }

                    Text("@StateObject creates and owns the observable object lifecycle")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("State Management")
    }
}

#Preview {
    NavigationView {
        StateManagementView()
    }
}
