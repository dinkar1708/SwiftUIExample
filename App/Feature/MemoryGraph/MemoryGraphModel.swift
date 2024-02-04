//
//  Apartment.swift
//  SwiftUIExample
//
//  Created by Dinakar Maurya on 2021/09/21.
//

import Foundation

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}


class PersonWithoutMemoryLeak {
    let name: String
    init(name: String) { self.name = name }
    var apartment: ApartmentWithoutMemoryLeak?
    deinit { print("\(name) is being deinitialized") }
}

class ApartmentWithoutMemoryLeak {
    let unit: String
    init(unit: String) { self.unit = unit }
    // weak reference of person
    weak var tenant: PersonWithoutMemoryLeak?
    deinit { print("ApartmentWithoutMemoryLeak \(unit) is being deinitialized") }
}
