//
//  Quote.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation
import SwiftData

@Model
final class Quote {
    
    @Attribute(.unique)
    var id: String
    
    var addressId: String?
    var chargeGST: Bool?
    var creationDate: Date?
    var currencyCode: String?
    var customerExtraInfo: String?
    var customerId: String?
    var customerSignatoryName: String?
    var customerSignatureContentBase64: String?
    var customerSignatureContentType: String?
    var customerSignatureSize: Int?
    var fixedPrice: Decimal?
    var GSTDescription: String?
    var gstInclusive: Bool?
    var GSTRate: Decimal?
    var gstRegistrationNumber: String?
    var invoiceId: String?
    var isClosed: Bool?
    var lastEmailedDate: Date?
    var lastModified: Date?
    var lastModifiedBy: String?
    var lastModifiedLocally: Date?
    var lastPrintedDate: Date?
    var number: Int?
    var printCustomerExtraInfo: Bool?
    var quoteDate: Date?
    var reference: String?
    var reverseGst: Bool?
    var rotApartmentId: String?
    var rotHousingSociety: String?
    var rotMaximumAmount1: Decimal?
    var rotMaximumAmount2: Decimal?
    var rotPersonalId1: String?
    var rotPersonalId2: String?
    var rotRealEstateId: String?
    var rotRutPercent: Decimal?
    var text: String?
    var useGst: Bool?
    var useRotRut: Bool?
    var validUntil: Date?
    var version: Int?
    
    // relationships
    @Relationship(inverse: \Address.quote)
    var address: Address?
    
    @Relationship(inverse: \Customer.quotes)
    var customer: Customer?
    
    init(id: String, addressId: String? = nil, chargeGST: Bool? = nil, creationDate: Date? = nil, currencyCode: String? = nil, customerExtraInfo: String? = nil, customerId: String? = nil, customerSignatoryName: String? = nil, customerSignatureContentBase64: String? = nil, customerSignatureContentType: String? = nil, customerSignatureSize: Int? = nil, fixedPrice: Decimal? = nil, GSTDescription: String? = nil, gstInclusive: Bool? = nil, GSTRate: Decimal? = nil, gstRegistrationNumber: String? = nil, invoiceId: String? = nil, isClosed: Bool? = nil, lastEmailedDate: Date? = nil, lastModified: Date? = nil, lastModifiedBy: String? = nil, lastModifiedLocally: Date? = nil, lastPrintedDate: Date? = nil, number: Int? = nil, printCustomerExtraInfo: Bool? = nil, quoteDate: Date? = nil, reference: String? = nil, reverseGst: Bool? = nil, rotApartmentId: String? = nil, rotHousingSociety: String? = nil, rotMaximumAmount1: Decimal? = nil, rotMaximumAmount2: Decimal? = nil, rotPersonalId1: String? = nil, rotPersonalId2: String? = nil, rotRealEstateId: String? = nil, rotRutPercent: Decimal? = nil, text: String? = nil, useGst: Bool? = nil, useRotRut: Bool? = nil, validUntil: Date? = nil, version: Int? = nil) {
        self.id = id
        self.addressId = addressId
        self.chargeGST = chargeGST
        self.creationDate = creationDate
        self.currencyCode = currencyCode
        self.customerExtraInfo = customerExtraInfo
        self.customerId = customerId
        self.customerSignatoryName = customerSignatoryName
        self.customerSignatureContentBase64 = customerSignatureContentBase64
        self.customerSignatureContentType = customerSignatureContentType
        self.customerSignatureSize = customerSignatureSize
        self.fixedPrice = fixedPrice
        self.GSTDescription = GSTDescription
        self.gstInclusive = gstInclusive
        self.GSTRate = GSTRate
        self.gstRegistrationNumber = gstRegistrationNumber
        self.invoiceId = invoiceId
        self.isClosed = isClosed
        self.lastEmailedDate = lastEmailedDate
        self.lastModified = lastModified
        self.lastModifiedBy = lastModifiedBy
        self.lastModifiedLocally = lastModifiedLocally
        self.lastPrintedDate = lastPrintedDate
        self.number = number
        self.printCustomerExtraInfo = printCustomerExtraInfo
        self.quoteDate = quoteDate
        self.reference = reference
        self.reverseGst = reverseGst
        self.rotApartmentId = rotApartmentId
        self.rotHousingSociety = rotHousingSociety
        self.rotMaximumAmount1 = rotMaximumAmount1
        self.rotMaximumAmount2 = rotMaximumAmount2
        self.rotPersonalId1 = rotPersonalId1
        self.rotPersonalId2 = rotPersonalId2
        self.rotRealEstateId = rotRealEstateId
        self.rotRutPercent = rotRutPercent
        self.text = text
        self.useGst = useGst
        self.useRotRut = useRotRut
        self.validUntil = validUntil
        self.version = version
    }
    enum CodingKeys: String, CodingKey {
        case id
        case addressId
        case chargeGST
        case creationDate
        case currencyCode
        case customerExtraInfo
        case customerId
        case customerSignatoryName
        case customerSignatureContentBase64
        case customerSignatureContentType
        case customerSignatureSize
        case fixedPrice
        case GSTDescription
        case gstInclusive
        case GSTRate
        case gstRegistrationNumber
        case invoiceId
        case isClosed
        case lastEmailedDate
        case lastModified
        case lastModifiedBy
        case lastModifiedLocally
        case lastPrintedDate
        case number
        case printCustomerExtraInfo
        case quoteDate
        case reference
        case reverseGst
        case rotApartmentId
        case rotHousingSociety
        case rotMaximumAmount1
        case rotMaximumAmount2
        case rotPersonalId1
        case rotPersonalId2
        case rotRealEstateId
        case rotRutPercent
        case text
        case useGst
        case useRotRut
        case validUntil
        case version
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.addressId = try container.decodeIfPresent(String.self, forKey: .addressId)
        self.chargeGST = try container.decodeIfPresent(Bool.self, forKey: .chargeGST)
        self.creationDate = try container.decodeIfPresent(Date.self, forKey: .creationDate)
        self.currencyCode = try container.decodeIfPresent(String.self, forKey: .currencyCode)
        self.customerExtraInfo = try container.decodeIfPresent(String.self, forKey: .customerExtraInfo)
        self.customerId = try container.decodeIfPresent(String.self, forKey: .customerId)
        self.customerSignatoryName = try container.decodeIfPresent(String.self, forKey: .customerSignatoryName)
        self.customerSignatureContentBase64 = try container.decodeIfPresent(String.self, forKey: .customerSignatureContentBase64)
        self.customerSignatureContentType = try container.decodeIfPresent(String.self, forKey: .customerSignatureContentType)
        self.customerSignatureSize = try container.decodeIfPresent(Int.self, forKey: .customerSignatureSize)
        self.fixedPrice = try container.decodeIfPresent(Decimal.self, forKey: .fixedPrice)
        self.GSTDescription = try container.decodeIfPresent(String.self, forKey: .GSTDescription)
        self.gstInclusive = try container.decodeIfPresent(Bool.self, forKey: .gstInclusive)
        self.GSTRate = try container.decodeIfPresent(Decimal.self, forKey: .GSTRate)
        self.gstRegistrationNumber = try container.decodeIfPresent(String.self, forKey: .gstRegistrationNumber)
        self.invoiceId = try container.decodeIfPresent(String.self, forKey: .invoiceId)
        self.isClosed = try container.decodeIfPresent(Bool.self, forKey: .isClosed)
        self.lastEmailedDate = try container.decodeIfPresent(Date.self, forKey: .lastEmailedDate)
        self.lastModified = try container.decodeIfPresent(Date.self, forKey: .lastModified)
        self.lastModifiedBy = try container.decodeIfPresent(String.self, forKey: .lastModifiedBy)
        self.lastModifiedLocally = try container.decodeIfPresent(Date.self, forKey: .lastModifiedLocally)
        self.lastPrintedDate = try container.decodeIfPresent(Date.self, forKey: .lastPrintedDate)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.printCustomerExtraInfo = try container.decodeIfPresent(Bool.self, forKey: .printCustomerExtraInfo)
        self.quoteDate = try container.decodeIfPresent(Date.self, forKey: .quoteDate)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.reverseGst = try container.decodeIfPresent(Bool.self, forKey: .reverseGst)
        self.rotApartmentId = try container.decodeIfPresent(String.self, forKey: .rotApartmentId)
        self.rotHousingSociety = try container.decodeIfPresent(String.self, forKey: .rotHousingSociety)
        self.rotMaximumAmount1 = try container.decodeIfPresent(Decimal.self, forKey: .rotMaximumAmount1)
        self.rotMaximumAmount2 = try container.decodeIfPresent(Decimal.self, forKey: .rotMaximumAmount2)
        self.rotPersonalId1 = try container.decodeIfPresent(String.self, forKey: .rotPersonalId1)
        self.rotPersonalId2 = try container.decodeIfPresent(String.self, forKey: .rotPersonalId2)
        self.rotRealEstateId = try container.decodeIfPresent(String.self, forKey: .rotRealEstateId)
        self.rotRutPercent = try container.decodeIfPresent(Decimal.self, forKey: .rotRutPercent)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.useGst = try container.decodeIfPresent(Bool.self, forKey: .useGst)
        self.useRotRut = try container.decodeIfPresent(Bool.self, forKey: .useRotRut)
        self.validUntil = try container.decodeIfPresent(Date.self, forKey: .validUntil)
        self.version = try container.decodeIfPresent(Int.self, forKey: .version)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(addressId, forKey: .addressId)
        try container.encode(chargeGST, forKey: .chargeGST)
        try container.encode(creationDate, forKey: .creationDate)
        try container.encode(currencyCode, forKey: .currencyCode)
        try container.encode(customerExtraInfo, forKey: .customerExtraInfo)
        try container.encode(customerId, forKey: .customerId)
        try container.encode(customerSignatoryName, forKey: .customerSignatoryName)
        try container.encode(customerSignatureContentBase64, forKey: .customerSignatureContentBase64)
        try container.encode(customerSignatureContentType, forKey: .customerSignatureContentType)
        try container.encode(customerSignatureSize, forKey: .customerSignatureSize)
        try container.encode(fixedPrice, forKey: .fixedPrice)
        try container.encode(GSTDescription, forKey: .GSTDescription)
        try container.encode(gstInclusive, forKey: .gstInclusive)
        try container.encode(GSTRate, forKey: .GSTRate)
        try container.encode(gstRegistrationNumber, forKey: .gstRegistrationNumber)
        try container.encode(invoiceId, forKey: .invoiceId)
        try container.encode(isClosed, forKey: .isClosed)
        try container.encode(lastEmailedDate, forKey: .lastEmailedDate)
        try container.encode(lastModified, forKey: .lastModified)
        try container.encode(lastModifiedBy, forKey: .lastModifiedBy)
        try container.encode(lastModifiedLocally, forKey: .lastModifiedLocally)
        try container.encode(lastPrintedDate, forKey: .lastPrintedDate)
        try container.encode(number, forKey: .number)
        try container.encode(printCustomerExtraInfo, forKey: .printCustomerExtraInfo)
        try container.encode(quoteDate, forKey: .quoteDate)
        try container.encode(reference, forKey: .reference)
        try container.encode(reverseGst, forKey: .reverseGst)
        try container.encode(rotApartmentId, forKey: .rotApartmentId)
        try container.encode(rotHousingSociety, forKey: .rotHousingSociety)
        try container.encode(rotMaximumAmount1, forKey: .rotMaximumAmount1)
        try container.encode(rotMaximumAmount2, forKey: .rotMaximumAmount2)
        try container.encode(rotPersonalId1, forKey: .rotPersonalId1)
        try container.encode(rotPersonalId2, forKey: .rotPersonalId2)
        try container.encode(rotRealEstateId, forKey: .rotRealEstateId)
        try container.encode(rotRutPercent, forKey: .rotRutPercent)
        try container.encode(text, forKey: .text)
        try container.encode(useGst, forKey: .useGst)
        try container.encode(useRotRut, forKey: .useRotRut)
        try container.encode(validUntil, forKey: .validUntil)
        try container.encode(version, forKey: .version)
    }
}

extension Quote: Codable {
}
///
/// fetchable
///
extension Quote {
    static func deleteById(context: ModelContext, id: String) {
        if let object = Quote.fetchById(context: context, id: id) {
            context.delete(object)
        }
    }

    static func fetchById(context: ModelContext, id: String) -> Quote? {
        let predicate = #Predicate<Quote> {
            $0.id == id
        }
        return Quote.fetch(context: context, predicate: predicate, fetchLimit: 1)?.first
    }
}
///
/// sycnable
///
extension Quote {
    static func fetchLastModified(context: ModelContext, timestamp: Date) -> [Quote]? {
        let predicate = #Predicate<Quote> {
            if let lastModified = $0.lastModifiedLocally {
                return lastModified < timestamp
            } else {
                return false
            }
         }
        return Quote.fetch(context: context, predicate: predicate)
    }

    static func clearLastModified(context: ModelContext, timestamp: Date) {
        if let objects = Quote.fetchLastModified(context: context, timestamp: timestamp) {
            for object in objects {
                object.lastModifiedLocally = nil
            }
        }
    }
}
///
/// foreignkeyupdates
///
extension Quote {
    @discardableResult
    static func persist(context: ModelContext, data: [Quote]) -> SyncResult {
        var result = SyncResult(model: String(describing: Self.self), rows: data.count)
        for object in data {
            context.insert(object)
            if let quote = Quote.fetchById(context: context, id: object.id) {
                quote.foreignKeyUpdates()
                try? context.save()
            }
        }
        result.setElapsedTime()
        return result
    }

    func foreignKeyUpdates() {
        address = nil
        if let context = modelContext, let targetIdValue = addressId {
            address = Address.fetchById(context: context, id: targetIdValue)
        }
        customer = nil
        if let context = modelContext, let targetIdValue = customerId {
            customer = Customer.fetchById(context: context, id: targetIdValue)
        }
    }
}
