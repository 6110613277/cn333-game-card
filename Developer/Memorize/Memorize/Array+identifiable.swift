//
//  Array+identifiable.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 19/2/2564 BE.
//

import Foundation

extension Array where Element: Identifiable{
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count{
            if self[index].id == matching.id{
                return index
            }
        }
        return nil
    }
}
