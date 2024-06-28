//
//  Item.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
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
