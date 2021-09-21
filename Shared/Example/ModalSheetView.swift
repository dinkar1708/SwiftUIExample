//
//  ModalSheetView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/01/05.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        NavigationView {
            Text("Detail")
                .navigationBarTitle("Title", displayMode: .inline)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            print("save........")
                                        })
                                        {
                                            Text("Save")
                                        }
                )
        }
    }
}

struct SheetView: View {
    @State var isShowingSheet = false
    
    var body: some View {
        Button(action: {
            self.isShowingSheet.toggle()
        }) {
            Text("Show sheet")
        }.sheet(isPresented: $isShowingSheet) {
            DetailView()
        }
    }
    
}


struct ModalSheetView: View {
    @State private var birthDate = Date()
    
    @State var isModal: Bool = false
    var body: some View {
        Button("Modal") {
            self.isModal = true
        }.sheet(isPresented: $isModal, content: {
            self.modal
        })
    }
    
    var modal: some View {
        
        VStack(alignment:.center) {
            ZStack{
                Color.blue
                    .ignoresSafeArea()
            }
            VStack {
                DatePicker("", selection: $birthDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .font(.system(.body, design: .serif))
                    .labelsHidden()
            }.padding()
            Button(action: {
                print("apply........")
            })
            {
                Text("Confirm")
                    .foregroundColor(.white)
                    .padding(12)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
        }
    }
    
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ModalSheetView()
    }
}
