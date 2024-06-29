//
//  Database.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation
import SwiftData
import OSLog

struct FBDatabase {
    
    static let modelName = "FB14083137"
    
    static let entityList: [any PersistentModel.Type] = [Address.self,Customer.self, Invoice.self, Quote.self]
    
    static func schema() -> Schema {
        return Schema(entityList, version: Schema.Version(2,1,0))
    }
    
    static func config() -> ModelConfiguration {
        let storeURL = URL.documentsDirectory.appending(path: "\(modelName).sqlite")
        Logger().debug("Database configured at URL: \(storeURL.absoluteString)")
        return ModelConfiguration(url: storeURL)
    }
    
    static func getModelContainer() throws -> ModelContainer {
        return try ModelContainer(for: schema(), configurations: config())
    }
    
    static func deleteAllModels(context: ModelContext) throws {
        for model in entityList {
            try context.delete(model: model)
        }
        try context.save()

    }
    
    @MainActor
    static func getPreviewContainer() -> ModelContainer {
        do {
            let dataContainer = try getModelContainer()
            let previewContainer = try ModelContainer(for: schema(), configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            let dataContext = dataContainer.mainContext
            let previewContext = previewContainer.mainContext
            if let items = Item.fetchAll(context: dataContext) {
                for item in items {
                    previewContext.insert(item)
                }
            }
            return previewContainer
        } catch let error as NSError {
            Logger().error("Preview set up failed with error: \(error)")
            fatalError(error.localizedDescription)
        }
    }
}
