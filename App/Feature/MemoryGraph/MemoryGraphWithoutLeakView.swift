//
//  MemoryGraphWithoutLeakView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/09/21.
//

import SwiftUI

// https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
struct MemoryGraphWithoutLeakView: View {
    @State private var apartment: ApartmentWithoutMemoryLeak?
    @State private var person: PersonWithoutMemoryLeak?
    @State private var isTestCompleted = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Fixed Memory Management")
                    .font(.title)
                    .bold()
                    .padding(.bottom)

                VStack(alignment: .leading, spacing: 12) {
                    Label("Weak Reference Solution", systemImage: "checkmark.circle.fill")
                        .font(.headline)
                        .foregroundColor(.green)

                    Text("Apartment has a weak reference to Person")
                        .font(.subheadline)

                    Text("Person has a strong reference to Apartment")
                        .font(.subheadline)

                    Text("The weak reference breaks the retain cycle and allows proper deallocation")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 4)
                }
                .padding()
                .background(Color.green.opacity(0.1))
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 8) {
                    Text("What Happens:")
                        .font(.headline)

                    Text("When objects are set to nil, they are immediately deallocated")
                        .font(.caption)
                    Text("The deinit methods are called")
                        .font(.caption)
                    Text("Memory is properly freed")
                        .font(.caption)
                    Text("No objects remain in the Memory Graph")
                        .font(.caption)
                }
                .padding()
                .background(Color.blue.opacity(0.1))
                .cornerRadius(12)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Code Fix:")
                        .font(.headline)

                    Text("class ApartmentWithoutMemoryLeak {")
                        .font(.system(.caption, design: .monospaced))
                    Text("    weak var tenant: PersonWithoutMemoryLeak?")
                        .font(.system(.caption, design: .monospaced))
                        .foregroundColor(.green)
                    Text("}")
                        .font(.system(.caption, design: .monospaced))
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(12)

                Button {
                    testMemoryManagement()
                } label: {
                    Label(isTestCompleted ? "Test Completed" : "Test Memory Management", systemImage: "checkmark.shield.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(isTestCompleted ? Color.gray : Color.green)
                        .cornerRadius(12)
                }
                .disabled(isTestCompleted)

                if isTestCompleted {
                    Text("Check the console logs to see deinit messages. Objects were properly deallocated.")
                        .font(.caption)
                        .foregroundColor(.green)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
    }

    private func testMemoryManagement() {
        print("Testing proper memory management...")
        apartment = ApartmentWithoutMemoryLeak(unit: "3333")
        person = PersonWithoutMemoryLeak(name: "Dinkar")

        apartment?.tenant = person
        person?.apartment = apartment

        print("Setting objects to nil...")
        apartment = nil
        person = nil

        isTestCompleted = true
        print("Objects deallocated successfully - check console for deinit messages")
    }
}

struct MemoryGraphWithoutLeakView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGraphWithoutLeakView()
    }
}
