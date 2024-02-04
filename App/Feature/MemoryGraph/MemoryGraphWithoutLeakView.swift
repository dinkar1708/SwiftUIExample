//
//  MemoryGraphView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/09/21.
//

import SwiftUI

// https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
struct MemoryGraphWithoutLeakView: View {
    @State
    var apartment: ApartmentWithoutMemoryLeak?
    @State
    var person: PersonWithoutMemoryLeak?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("ApartmentWithoutMemoryLeak has weak reference to ->   var tenant: Person? ")
            Text("Memory graph will not show person and ApartmentWithoutMemoryLeak object")
            Text("ApartmentWithoutMemoryLeak 3333 is being deinitialized ")
        }.padding()
        .onAppear {
            print("MemoryGraphView onAppear!")
            apartment = ApartmentWithoutMemoryLeak(unit: "3333")
            person = PersonWithoutMemoryLeak(name: "Dinkar")
            
            apartment?.tenant = person
            person?.apartment = apartment
            // event after making nil object
            apartment = nil
            person = nil
        }
    }
}

struct MemoryGraphWithoutLeakView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGraphWithoutLeakView()
    }
}
