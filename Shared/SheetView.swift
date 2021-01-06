//
//  SwiftUIView.swift
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
    @State var isSheetShowing = false
    
    var body: some View {
        Button(action: {
            self.isSheetShowing.toggle()
        }) {
            Text("Open sheet")
        }.sheet(isPresented: $isSheetShowing) {
            DetailView()
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SheetView()
    }
}
