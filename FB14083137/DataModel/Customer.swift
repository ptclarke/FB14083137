//
//  Customer.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation
import SwiftData

@Model
final class Customer {
    
    @Attribute(.unique)
    var id: String
    
    var addressId: String?
    var chargeGST: Bool?
    var disabled: Bool?
    var discount: Decimal?
    var extraInfo: String?
    var gstRegistrationNumber: String?
    var languageId: String?
    var lastModified: Date?
    var lastModifiedBy: String?
    var lastModifiedLocally: Date?
    var name: String?
    var number: Int?
    var paymentTerms: Int?
    var printExtraInfo: Bool?
    var reverseGst: Bool?
    var version: Int?
    
    // relationships
    @Relationship(inverse: \Address.customer)
    var address: Address?
    
    // inverse relationships
    var invoices: [Invoice]?
    var quotes: [Quote]?
    
    init(id: String, addressId: String? = nil, chargeGST: Bool? = nil, disabled: Bool? = nil, discount: Decimal? = nil, extraInfo: String? = nil, gstRegistrationNumber: String? = nil, languageId: String? = nil, lastModified: Date? = nil, lastModifiedBy: String? = nil, lastModifiedLocally: Date? = nil, name: String? = nil, number: Int? = nil, paymentTerms: Int? = nil, printExtraInfo: Bool? = nil, reverseGst: Bool? = nil, version: Int? = nil) {
        self.id = id
        self.addressId = addressId
        self.chargeGST = chargeGST
        self.disabled = disabled
        self.discount = discount
        self.extraInfo = extraInfo
        self.gstRegistrationNumber = gstRegistrationNumber
        self.languageId = languageId
        self.lastModified = lastModified
        self.lastModifiedBy = lastModifiedBy
        self.lastModifiedLocally = lastModifiedLocally
        self.name = name
        self.number = number
        self.paymentTerms = paymentTerms
        self.printExtraInfo = printExtraInfo
        self.reverseGst = reverseGst
        self.version = version
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case addressId
        case chargeGST
        case disabled
        case discount
        case extraInfo
        case gstRegistrationNumber
        case languageId
        case lastModified
        case lastModifiedBy
        case lastModifiedLocally
        case name
        case number
        case paymentTerms
        case printExtraInfo
        case reverseGst
        case version
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.addressId = try container.decodeIfPresent(String.self, forKey: .addressId)
        self.chargeGST = try container.decodeIfPresent(Bool.self, forKey: .chargeGST)
        self.disabled = try container.decodeIfPresent(Bool.self, forKey: .disabled)
        self.discount = try container.decodeIfPresent(Decimal.self, forKey: .discount)
        self.extraInfo = try container.decodeIfPresent(String.self, forKey: .extraInfo)
        self.gstRegistrationNumber = try container.decodeIfPresent(String.self, forKey: .gstRegistrationNumber)
        self.languageId = try container.decodeIfPresent(String.self, forKey: .languageId)
        self.lastModified = try container.decodeIfPresent(Date.self, forKey: .lastModified)
        self.lastModifiedBy = try container.decodeIfPresent(String.self, forKey: .lastModifiedBy)
        self.lastModifiedLocally = try container.decodeIfPresent(Date.self, forKey: .lastModifiedLocally)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.paymentTerms = try container.decodeIfPresent(Int.self, forKey: .paymentTerms)
        self.printExtraInfo = try container.decodeIfPresent(Bool.self, forKey: .printExtraInfo)
        self.reverseGst = try container.decodeIfPresent(Bool.self, forKey: .reverseGst)
        self.version = try container.decodeIfPresent(Int.self, forKey: .version)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(addressId, forKey: .addressId)
        try container.encode(chargeGST, forKey: .chargeGST)
        try container.encode(disabled, forKey: .disabled)
        try container.encode(discount, forKey: .discount)
        try container.encode(extraInfo, forKey: .extraInfo)
        try container.encode(gstRegistrationNumber, forKey: .gstRegistrationNumber)
        try container.encode(languageId, forKey: .languageId)
        try container.encode(lastModified, forKey: .lastModified)
        try container.encode(lastModifiedBy, forKey: .lastModifiedBy)
        try container.encode(lastModifiedLocally, forKey: .lastModifiedLocally)
        try container.encode(name, forKey: .name)
        try container.encode(number, forKey: .number)
        try container.encode(paymentTerms, forKey: .paymentTerms)
        try container.encode(printExtraInfo, forKey: .printExtraInfo)
        try container.encode(reverseGst, forKey: .reverseGst)
        try container.encode(version, forKey: .version)
    }
}

extension Customer: Codable {
}
///
/// fetchable
///
extension Customer {
    static func deleteById(context: ModelContext, id: String) {
        if let customer = Customer.fetchById(context: context, id: id) {
            context.delete(customer)
        }
    }
    
    static func fetchById(context: ModelContext, id: String) -> Customer? {
        let predicate = #Predicate<Customer>{ $0.id == id }
        return Customer.fetch(context: context, predicate: predicate, fetchLimit: 1)?.first
    }
}
///
/// foreignkeyUpdates
///
extension Customer {
    @discardableResult
    static func persist(context: ModelContext, data: [Customer]) -> SyncResult {
        var result = SyncResult(model: String(describing: Self.self), rows: data.count)
        for object in data {
            context.insert(object)
            foreignKeyUpdates(object: object, context: context)
      }
        try? context.save()
        result.setElapsedTime()
        return result
    }

    static func foreignKeyUpdates(object: Customer, context: ModelContext) {
        object.address = nil
        if let targetIdValue = object.addressId {
            object.address = Address.fetchById(context: context, id: targetIdValue)
        }
    }
}
