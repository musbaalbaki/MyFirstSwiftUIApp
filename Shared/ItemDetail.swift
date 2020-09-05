//
//  ItemDetail.swift
//  MyFirstSwiftUIApp
//
//  Created by Mustafa Baalbaki on 9/5/20.
//

import SwiftUI

struct ItemDetail: View {
    var item: Item
    var body: some View {
        Image(item.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .navigationTitle(item.title)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: testData[0]) 
        }
    }
}
