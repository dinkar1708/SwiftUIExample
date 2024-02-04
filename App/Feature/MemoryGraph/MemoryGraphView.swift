//
//  MemoryGraphView.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/09/21.
//

import SwiftUI

// https://docs.swift.org/swift-book/LanguageGuide/AutomaticReferenceCounting.html
struct MemoryGraphView: View {
    @State
    var apartment: Apartment?
    @State
    var person: Person?
    
    var body: some View {
        VStack(alignment:.leading) {
            Text(" Apartment has strong reference to ->   var tenant: Person? ")
            Text("Memory graph will show person and apartment object with strong reference....")
        }.padding()
        .onAppear {
            print("MemoryGraphView onAppear!")
            apartment = Apartment(unit: "3333")
            person = Person(name: "Dinkar")
            
            apartment?.tenant = person
            person?.apartment = apartment
            // event after making nil object
            apartment = nil
            person = nil
        }
    }
}

struct MemoryGraphView_Previews: PreviewProvider {
    static var previews: some View {
        MemoryGraphView()
    }
}
