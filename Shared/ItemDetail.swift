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
        VStack {
            Spacer(minLength: 0)
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: zoomed ? .fill : .fit)
                .navigationTitle(item.title)
                .onTapGesture {
                    withAnimation{
                        zoomed.toggle()
                    }
                }
            Spacer(minLength: 0)
            if item.isNegotiable && !zoomed {
                HStack {
                    Spacer()
                    Label("Negotiable", systemImage: "flame.fill")
                    Spacer()
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .font(Font.headline.smallCaps())
                .background(Color.red)
                .foregroundColor(Color.yellow)
                .transition(.move(edge: .bottom))
            }
        }
        .navigationTitle(item.title)
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                ItemDetail(item: testData[0])
            }
            NavigationView {
                ItemDetail(item: testData[1])
            }
            NavigationView {
                ItemDetail(item: testData[2])
            }
        }
    }
}
