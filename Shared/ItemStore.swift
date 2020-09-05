//
//  ItemStore.swift
//  MyFirstSwiftUIApp
//
//  Created by Mustafa Baalbaki on 9/6/20.
//

import Foundation

class ItemStore: ObservableObject {
    @Published var items: [Item]

    init(items: [Item] = []) {
        self.items = items
    }
}

let testStore = ItemStore(items: testData)
