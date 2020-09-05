//
//  Item.swift
//  MyFirstSwiftUIApp
//
//  Created by Mustafa Baalbaki on 9/5/20.
//

import Foundation

struct Item: Identifiable {
    var id = UUID()
    var title: String
    var likesCount: Int
    var isNegotiable: Bool = false

    var imageName: String { return title }
    var thumbnailName: String { return title + "Thumb" }
}

let testData = [
    Item(title: "Shoes", likesCount: 5, isNegotiable: true),
    Item(title: "Shirt", likesCount: 3),
    Item(title: "Pants", likesCount: 12),
    Item(title: "Computer", likesCount: 22),
    Item(title: "Speaker", likesCount: 1),
    Item(title: "iPad", likesCount: 2)
]
