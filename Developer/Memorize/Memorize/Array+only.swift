//
//  Array+only.swift
//  Memorize
//
//  Created by Siriluk Rachaniyom on 19/2/2564 BE.
//

import Foundation

extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}
