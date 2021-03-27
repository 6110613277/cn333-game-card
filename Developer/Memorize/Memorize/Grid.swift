//
//  Grid.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 19/2/2564 BE.
//

import SwiftUI

struct Grid<Item: Identifiable, ItemView: View>: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) ->ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    var body: some View{
        GeometryReader{ geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
        
    func body(for layout: GridLayout)-> some View{
        ForEach(items) { item in
            let itemIndex = items.firstIndex(matching: item)
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: itemIndex!))
        }
    }
}

