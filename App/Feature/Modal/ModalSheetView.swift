//
//  ModalSheetView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/01/05.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("This is the detail view")
                    .font(.title2)

                Text("You can add more content here")
                    .foregroundColor(.secondary)
            }
            .navigationTitle("Detail")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Save") {
                    print("Saved successfully")
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct ModalSheetView: View {
    @State private var birthDate = Date()
    @State private var isShowingSheet = false
    @State private var isShowingDatePicker = false

    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter
    }

    var body: some View {
        VStack(spacing: 30) {
            Text("Modal Sheet Examples")
                .font(.title)
                .padding()

            Button {
                isShowingSheet = true
            } label: {
                Label("Show Detail Sheet", systemImage: "doc.text")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .sheet(isPresented: $isShowingSheet) {
                DetailView()
            }

            Button {
                isShowingDatePicker = true
            } label: {
                Label("Show Date Picker", systemImage: "calendar")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(12)
            }
            .sheet(isPresented: $isShowingDatePicker) {
                datePickerModal
            }

            Text("Selected Date: \(birthDate, formatter: dateFormatter)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }

    var datePickerModal: some View {
        NavigationView {
            VStack(spacing: 20) {
                DatePicker(
                    "Select Date",
                    selection: $birthDate,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

                Button {
                    isShowingDatePicker = false
                    print("Date confirmed: \(birthDate)")
                } label: {
                    Text("Confirm")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(12)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationTitle("Pick a Date")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(
                leading: Button("Cancel") {
                    isShowingDatePicker = false
                }
            )
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheetView()
    }
}
