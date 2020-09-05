//
//  ItemDetail.swift
//  MyFirstSwiftUIApp
//
//  Created by Mustafa Baalbaki on 9/5/20.
//

import SwiftUI

struct ItemDetail: View {
    let item: Item
    @State private var zoomed = false
    var body: some View {
        Image(item.imageName)
            .resizable()
            .aspectRatio(contentMode: zoomed ? .fill : .fit)
            .navigationTitle(item.title)
            .onTapGesture {
                withAnimation{
                    zoomed.toggle()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ItemDetail(item: testData[0]) 
        }
    }
}
