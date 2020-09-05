//
//  MyFirstSwiftUIAppApp.swift
//  Shared
//
//  Created by Mustafa Baalbaki on 9/5/20.
//

import SwiftUI

@main
struct MyFirstSwiftUIAppApp: App {
    @StateObject private var store = ItemStore()

    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
