//
//  MemoryGraphView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/09/21.
//

import SwiftUI

// https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
struct MemoryGraphView: View {
    @State private var apartment: Apartment?
    @State private var person: Person?
    @State private var isLeakCreated = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Memory Leak Example")
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                VStack(alignment: .leading, spacing: 12) {
                    Label("Strong Reference Cycle", systemImage: "exclamationmark.triangle.fill")
                        .font(.headline)
                        .foregroundColor(.red)

                    Text("Apartment has a strong reference to Person")
                        .font(.subheadline)

                    Text("Person has a strong reference to Apartment")
                        .font(.subheadline)

                    Text("This creates a retain cycle where neither object can be deallocated")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
                .padding()
                .background(Color.red.opacity(0.1))
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 8) {
                    Text("How to Check:")
                        .font(.headline)

                    Text("1. Run the app in Xcode")
                        .font(.caption)
                    Text("2. Go to Debug Navigator (⌘ + 7)")
                        .font(.caption)
                    Text("3. Click the Memory Graph button")
                        .font(.caption)
                    Text("4. Look for Person and Apartment instances")
                        .font(.caption)
                    Text("5. They will remain in memory even after being set to nil")
                        .font(.caption)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)

                Button {
                    createMemoryLeak()
                } label: {
                    Label(isLeakCreated ? "Leak Created" : "Create Memory Leak", systemImage: "ladybug.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isLeakCreated ? Color.gray : Color.red)
                        .cornerRadius(12)
                }
                .disabled(isLeakCreated)

                if isLeakCreated {
                    Text("Memory leak created. Check Memory Graph in Xcode Debug Navigator.")
                        .font(.caption)
                        .foregroundColor(.orange)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
    }

    private func createMemoryLeak() {
        print("Creating memory leak...")
        apartment = Apartment(unit: "3333")
        person = Person(name: "Dinkar")

        apartment?.tenant = person
        person?.apartment = apartment

        // Even after setting to nil, objects remain in memory due to strong reference cycle
        apartment = nil
        person = nil

        isLeakCreated = true
        print("Objects set to nil, but memory leak persists")
    }
}

struct MemoryGraphView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGraphView()
    }
}
