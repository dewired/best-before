//
//  Item.swift
//  best-before
//
//  Created by Akash Navani on 4/28/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
