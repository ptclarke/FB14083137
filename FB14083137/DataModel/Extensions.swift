//
//  Extensions.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation
import OSLog
import SwiftData

extension PersistentModel {
    
    static func fetch(context: ModelContext, predicate: Predicate<Self>? = nil, sortBy: [SortDescriptor<Self>] = [], fetchLimit: Int = 0) -> [Self]? {
        var fetchDescriptor = FetchDescriptor<Self>(predicate: predicate, sortBy: sortBy)
        if fetchLimit > 0 {
            fetchDescriptor.fetchLimit = fetchLimit
        }
        do {
            return try context.fetch(fetchDescriptor)
        } catch let error as NSError {
            Logger().error("\(#function) failed with error: \(error)")
            return nil
        }
    }
    static func fetchAll(context: ModelContext) -> [Self]? {
        let fetchDescriptor = FetchDescriptor<Self>()
        do {
            return try context.fetch(fetchDescriptor)
        } catch let error as NSError {
            Logger().error("\(#function) failed with error: \(error)")
            return nil
        }
    }
    
    static func fetchCount(context: ModelContext, predicate: Predicate<Self>? = nil) -> Int? {
        let fetchDescriptor = FetchDescriptor<Self>(predicate: predicate)
        do {
            return try context.fetchCount(fetchDescriptor)
        } catch let error as NSError {
            Logger().error("\(#function) failed with error: \(error)")
            return nil
        }
    }
}
