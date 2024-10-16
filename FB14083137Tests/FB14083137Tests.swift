//
//  FB14083137Tests.swift
//  FB14083137Tests
//
//  Created by Peter Clarke on 29/6/2024.
//

import Testing
import SwiftData
import OSLog
@testable import FB14083137


struct FB14083137Tests {

    @Suite(.serialized)
    struct DataLoadingTest {
        @Test func dataLoading1() async throws {
            let task = Task {
                let container = try FBDatabase.getModelContainer()
                let context = ModelContext(container)
                
                // clear database
                try FBDatabase.deleteAllModels(context: context)
                
                // load once inserting
                let loadDataActor =  LoadSampleData(modelContainer: container)
                try await loadDataActor.loadData()
                try context.save()
                
                // validate relationships
                if let customers = Customer.fetchAll(context: context) {
                    for customer in customers {
                        Logger().info("Customer \(customer.name ?? "Unknown") address id: \(customer.address?.id ?? "")")
                        #expect(customer.address?.id ==  customer.addressId)
                    }
                }
                if let invoices = Invoice.fetchAll(context: context) {
                    for invoice in invoices {
                        Logger().info("Customer \(invoice.customer?.name ?? "Unknown") invoice: \(invoice.number ?? 0)")
                        #expect(invoice.address?.id == invoice.addressId)
                        #expect(invoice.customer?.id == invoice.customerId)
                    }
                }
                if let quotes = Quote.fetchAll(context: context) {
                    for quote in quotes {
                        Logger().info("Customer \(quote.customer?.name ?? "Unknown") quote: \(quote.number ?? 0)")
                        #expect(quote.address?.id == quote.addressId)
                        #expect(quote.customer?.id == quote.customerId)
                    }
                }
            }
            try await task.value
        }

        @Test func dataLoading2() async throws {
            let task = Task {
                let container = try FBDatabase.getModelContainer()
                let context = ModelContext(container)
                
                // load invoice only
                let loadDataActor =  LoadSampleData(modelContainer: container)
                try await loadDataActor.loadInvoiceOnly()
                try context.save()
                
                // validate relationships
                if let customers = Customer.fetchAll(context: context) {
                    for customer in customers {
                        Logger().info("Customer \(customer.name ?? "Unknown") address id: \(customer.address?.id ?? "")")
                        #expect(customer.address?.id ==  customer.addressId)
                    }
                }
                if let invoices = Invoice.fetchAll(context: context) {
                    for invoice in invoices {
                        Logger().info("Customer \(invoice.customer?.name ?? "Unknown") invoice: \(invoice.number ?? 0)")
                        #expect(invoice.address?.id == invoice.addressId)
                        #expect(invoice.customer?.id == invoice.customerId)
                    }
                }
                if let quotes = Quote.fetchAll(context: context) {
                    for quote in quotes {
                        Logger().info("Customer \(quote.customer?.name ?? "Unknown") quote: \(quote.number ?? 0)")
                        #expect(quote.address?.id == quote.addressId)
                        #expect(quote.customer?.id == quote.customerId)
                    }
                }
            }
            try await task.value
        }

    }
}
