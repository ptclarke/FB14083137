//
//  LoadData.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//
import Foundation
import SwiftData
import OSLog

@ModelActor
actor LoadSampleData {
    
    func loadData() async throws {
        guard let data = SourceData.jsonData() else {
            throw NSError(domain: "FB14083137", code: 890, userInfo: ["localizedDescription": "Unable to load data"])
        }
        guard let object = try FBCoder.shared.decodeObject(data: data, type: ResponseOutgoingMap.self) as ResponseOutgoingMap? else {
            throw NSError(domain: "FB14083137", code: 891, userInfo: ["localizedDescription": "Unable to decode data"])
        }
        
        if let addresses = object.responseOutgoing.addresses {
            Address.persist(context: modelContext, data: addresses)
        }
        if let customers = object.responseOutgoing.customers {
            Customer.persist(context: modelContext, data: customers)
        }
        if let invoices = object.responseOutgoing.invoices {
            Invoice.persist(context: modelContext, data: invoices)
        }
        if let quotes = object.responseOutgoing.quotes {
            Quote.persist(context: modelContext, data: quotes)
        }
    }
    
    func loadInvoiceOnly() async throws {
        guard let data = SourceData.jsonData() else {
            throw NSError(domain: "FB14083137", code: 890, userInfo: ["localizedDescription": "Unable to load data"])
        }
        guard let object = try FBCoder.shared.decodeObject(data: data, type: ResponseOutgoingMap.self) as ResponseOutgoingMap? else {
            throw NSError(domain: "FB14083137", code: 891, userInfo: ["localizedDescription": "Unable to decode data"])
        }
        
        if let invoices = object.responseOutgoing.invoices {
            Invoice.persist(context: modelContext, data: invoices)
        }
    }
}
