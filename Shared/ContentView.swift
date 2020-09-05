//
//  ContentView.swift
//  Shared
//
//  Created by Mustafa Baalbaki on 9/5/20.
//

import SwiftUI

struct ContentView: View {
    var items: [Item] = []
    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    ItemCell(item: item)
                }
                HStack {
                    Spacer()
                    Text("\(items.count) items")
                        .foregroundColor(.secondary)
                    Spacer()
                }
            }
            .navigationTitle("Mercari" )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(items: testData)
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
