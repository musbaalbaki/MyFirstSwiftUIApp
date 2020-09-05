//
//  ContentView.swift
//  Shared
//
//  Created by Mustafa Baalbaki on 9/5/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store: ItemStore
    var body: some View {
        NavigationView {
            List {
                ForEach(store.items) { item in
                    ItemCell(item: item)
                }
                .onMove(perform: moveItems)
                .onDelete(perform: deleteItems)
                HStack {
                    Spacer()
                    Text("\(store.items.count) items")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Mercari")
            .toolbar {
                #if os(iOS)
                EditButton()
                #endif
                Button("Add", action: listItem)
            }
            Text("Select an item")
                .font(.largeTitle)
        }
    }

    func listItem() {
        withAnimation {
            store.items.append(Item(title: "Mouse", likesCount: 5))
        }
    }

    func moveItems(from: IndexSet, to: Int) {
        withAnimation {
            store.items.move(fromOffsets: from, toOffset: to)
        }
    }

    func deleteItems(offsets: IndexSet) {
        withAnimation {
            store.items.remove(atOffsets: offsets)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(store: testStore)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraLarge)
            ContentView(store: testStore)
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .extraExtraLarge)
                .environment(\.layoutDirection, .rightToLeft)
                .environment(\.locale, Locale(identifier: "ar"))
        }
    }
}

struct ItemCell: View {
    var item: Item
    var body: some View {
        NavigationLink(
            destination: ItemDetail(item: item)) {
            Image(item.thumbnailName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44, height: 44)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(item.title )
                Text("\(item.likesCount) likes")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
