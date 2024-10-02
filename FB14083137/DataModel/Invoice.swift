//
//  Invoice.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation
import SwiftData

@Model
final class Invoice {
    
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
    var dueDate: Date?
    var fixedPrice: Decimal?
    var GSTDescription: String?
    var gstInclusive: Bool?
    var GSTRate: Decimal?
    var gstRegistrationNumber: String?
    var invoiceDate: Date?
    var isClosed: Bool?
    var isPaid: Bool?
    var lastEmailedDate: Date?
    var lastModified: Date?
    var lastModifiedBy: String?
    var lastModifiedLocally: Date?
    var lastPrintedDate: Date?
    var number: Int?
    var paymentDate: Date?
    var printCustomerExtraInfo: Bool?
    var quoteId: String?
    var reference: String?
    var reverseGst: Bool?
    var rotApartmentId: String?
    var rotHousingSociety: String?
    var rotMaximumAmount1: Decimal?
    var rotMaximumAmount2: Decimal?
    var rotPersonalId1: String?
    var rotPersonalId2: String?
    var rotRealEstateId: String?
    var rotRutPaymentRequested: Bool?
    var rotRutPaymentRequestedDate: Date?
    var rotRutPaymentRequestNumber: Int?
    var rotRutPercent: Decimal?
    var text: String?
    var useGst: Bool?
    var useRotRut: Bool?
    var version: Int?
    
    // relationships
    @Relationship(inverse: \Address.invoice)
    var address: Address?
    @Relationship(inverse: \Customer.invoices)
    var customer: Customer?
    
    
    init(id: String, addressId: String? = nil, chargeGST: Bool? = nil, creationDate: Date? = nil, currencyCode: String? = nil, customerExtraInfo: String? = nil, customerId: String? = nil, customerSignatoryName: String? = nil, customerSignatureContentBase64: String? = nil, customerSignatureContentType: String? = nil, customerSignatureSize: Int? = nil, dueDate: Date? = nil, fixedPrice: Decimal? = nil, GSTDescription: String? = nil, gstInclusive: Bool? = nil, GSTRate: Decimal? = nil, gstRegistrationNumber: String? = nil, invoiceDate: Date? = nil, isClosed: Bool? = nil, isPaid: Bool? = nil, lastEmailedDate: Date? = nil, lastModified: Date? = nil, lastModifiedBy: String? = nil, lastModifiedLocally: Date? = nil, lastPrintedDate: Date? = nil, number: Int? = nil, paymentDate: Date? = nil, printCustomerExtraInfo: Bool? = nil, quoteId: String? = nil, reference: String? = nil, reverseGst: Bool? = nil, rotApartmentId: String? = nil, rotHousingSociety: String? = nil, rotMaximumAmount1: Decimal? = nil, rotMaximumAmount2: Decimal? = nil, rotPersonalId1: String? = nil, rotPersonalId2: String? = nil, rotRealEstateId: String? = nil, rotRutPaymentRequested: Bool? = nil, rotRutPaymentRequestedDate: Date? = nil, rotRutPaymentRequestNumber: Int? = nil, rotRutPercent: Decimal? = nil, text: String? = nil, useGst: Bool? = nil, useRotRut: Bool? = nil, version: Int? = nil) {
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
        self.dueDate = dueDate
        self.fixedPrice = fixedPrice
        self.GSTDescription = GSTDescription
        self.gstInclusive = gstInclusive
        self.GSTRate = GSTRate
        self.gstRegistrationNumber = gstRegistrationNumber
        self.invoiceDate = invoiceDate
        self.isClosed = isClosed
        self.isPaid = isPaid
        self.lastEmailedDate = lastEmailedDate
        self.lastModified = lastModified
        self.lastModifiedBy = lastModifiedBy
        self.lastModifiedLocally = lastModifiedLocally
        self.lastPrintedDate = lastPrintedDate
        self.number = number
        self.paymentDate = paymentDate
        self.printCustomerExtraInfo = printCustomerExtraInfo
        self.quoteId = quoteId
        self.reference = reference
        self.reverseGst = reverseGst
        self.rotApartmentId = rotApartmentId
        self.rotHousingSociety = rotHousingSociety
        self.rotMaximumAmount1 = rotMaximumAmount1
        self.rotMaximumAmount2 = rotMaximumAmount2
        self.rotPersonalId1 = rotPersonalId1
        self.rotPersonalId2 = rotPersonalId2
        self.rotRealEstateId = rotRealEstateId
        self.rotRutPaymentRequested = rotRutPaymentRequested
        self.rotRutPaymentRequestedDate = rotRutPaymentRequestedDate
        self.rotRutPaymentRequestNumber = rotRutPaymentRequestNumber
        self.rotRutPercent = rotRutPercent
        self.text = text
        self.useGst = useGst
        self.useRotRut = useRotRut
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
        case dueDate
        case fixedPrice
        case GSTDescription
        case gstInclusive
        case GSTRate
        case gstRegistrationNumber
        case invoiceDate
        case isClosed
        case isPaid
        case lastEmailedDate
        case lastModified
        case lastModifiedBy
        case lastModifiedLocally
        case lastPrintedDate
        case number
        case paymentDate
        case printCustomerExtraInfo
        case quoteId
        case reference
        case reverseGst
        case rotApartmentId
        case rotHousingSociety
        case rotMaximumAmount1
        case rotMaximumAmount2
        case rotPersonalId1
        case rotPersonalId2
        case rotRealEstateId
        case rotRutPaymentRequested
        case rotRutPaymentRequestedDate
        case rotRutPaymentRequestNumber
        case rotRutPercent
        case text
        case useGst
        case useRotRut
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
        self.dueDate = try container.decodeIfPresent(Date.self, forKey: .dueDate)
        self.fixedPrice = try container.decodeIfPresent(Decimal.self, forKey: .fixedPrice)
        self.GSTDescription = try container.decodeIfPresent(String.self, forKey: .GSTDescription)
        self.gstInclusive = try container.decodeIfPresent(Bool.self, forKey: .gstInclusive)
        self.GSTRate = try container.decodeIfPresent(Decimal.self, forKey: .GSTRate)
        self.gstRegistrationNumber = try container.decodeIfPresent(String.self, forKey: .gstRegistrationNumber)
        self.invoiceDate = try container.decodeIfPresent(Date.self, forKey: .invoiceDate)
        self.isClosed = try container.decodeIfPresent(Bool.self, forKey: .isClosed)
        self.isPaid = try container.decodeIfPresent(Bool.self, forKey: .isPaid)
        self.lastEmailedDate = try container.decodeIfPresent(Date.self, forKey: .lastEmailedDate)
        self.lastModified = try container.decodeIfPresent(Date.self, forKey: .lastModified)
        self.lastModifiedBy = try container.decodeIfPresent(String.self, forKey: .lastModifiedBy)
        self.lastModifiedLocally = try container.decodeIfPresent(Date.self, forKey: .lastModifiedLocally)
        self.lastPrintedDate = try container.decodeIfPresent(Date.self, forKey: .lastPrintedDate)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.paymentDate = try container.decodeIfPresent(Date.self, forKey: .paymentDate)
        self.printCustomerExtraInfo = try container.decodeIfPresent(Bool.self, forKey: .printCustomerExtraInfo)
        self.quoteId = try container.decodeIfPresent(String.self, forKey: .quoteId)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.reverseGst = try container.decodeIfPresent(Bool.self, forKey: .reverseGst)
        self.rotApartmentId = try container.decodeIfPresent(String.self, forKey: .rotApartmentId)
        self.rotHousingSociety = try container.decodeIfPresent(String.self, forKey: .rotHousingSociety)
        self.rotMaximumAmount1 = try container.decodeIfPresent(Decimal.self, forKey: .rotMaximumAmount1)
        self.rotMaximumAmount2 = try container.decodeIfPresent(Decimal.self, forKey: .rotMaximumAmount2)
        self.rotPersonalId1 = try container.decodeIfPresent(String.self, forKey: .rotPersonalId1)
        self.rotPersonalId2 = try container.decodeIfPresent(String.self, forKey: .rotPersonalId2)
        self.rotRealEstateId = try container.decodeIfPresent(String.self, forKey: .rotRealEstateId)
        self.rotRutPaymentRequested = try container.decodeIfPresent(Bool.self, forKey: .rotRutPaymentRequested)
        self.rotRutPaymentRequestedDate = try container.decodeIfPresent(Date.self, forKey: .rotRutPaymentRequestedDate)
        self.rotRutPaymentRequestNumber = try container.decodeIfPresent(Int.self, forKey: .rotRutPaymentRequestNumber)
        self.rotRutPercent = try container.decodeIfPresent(Decimal.self, forKey: .rotRutPercent)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.useGst = try container.decodeIfPresent(Bool.self, forKey: .useGst)
        self.useRotRut = try container.decodeIfPresent(Bool.self, forKey: .useRotRut)
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
        try container.encode(dueDate, forKey: .dueDate)
        try container.encode(fixedPrice, forKey: .fixedPrice)
        try container.encode(GSTDescription, forKey: .GSTDescription)
        try container.encode(gstInclusive, forKey: .gstInclusive)
        try container.encode(GSTRate, forKey: .GSTRate)
        try container.encode(gstRegistrationNumber, forKey: .gstRegistrationNumber)
        try container.encode(invoiceDate, forKey: .invoiceDate)
        try container.encode(isClosed, forKey: .isClosed)
        try container.encode(isPaid, forKey: .isPaid)
        try container.encode(lastEmailedDate, forKey: .lastEmailedDate)
        try container.encode(lastModified, forKey: .lastModified)
        try container.encode(lastModifiedBy, forKey: .lastModifiedBy)
        try container.encode(lastModifiedLocally, forKey: .lastModifiedLocally)
        try container.encode(lastPrintedDate, forKey: .lastPrintedDate)
        try container.encode(number, forKey: .number)
        try container.encode(paymentDate, forKey: .paymentDate)
        try container.encode(printCustomerExtraInfo, forKey: .printCustomerExtraInfo)
        try container.encode(quoteId, forKey: .quoteId)
        try container.encode(reference, forKey: .reference)
        try container.encode(reverseGst, forKey: .reverseGst)
        try container.encode(rotApartmentId, forKey: .rotApartmentId)
        try container.encode(rotHousingSociety, forKey: .rotHousingSociety)
        try container.encode(rotMaximumAmount1, forKey: .rotMaximumAmount1)
        try container.encode(rotMaximumAmount2, forKey: .rotMaximumAmount2)
        try container.encode(rotPersonalId1, forKey: .rotPersonalId1)
        try container.encode(rotPersonalId2, forKey: .rotPersonalId2)
        try container.encode(rotRealEstateId, forKey: .rotRealEstateId)
        try container.encode(rotRutPaymentRequested, forKey: .rotRutPaymentRequested)
        try container.encode(rotRutPaymentRequestedDate, forKey: .rotRutPaymentRequestedDate)
        try container.encode(rotRutPaymentRequestNumber, forKey: .rotRutPaymentRequestNumber)
        try container.encode(rotRutPercent, forKey: .rotRutPercent)
        try container.encode(text, forKey: .text)
        try container.encode(useGst, forKey: .useGst)
        try container.encode(useRotRut, forKey: .useRotRut)
        try container.encode(version, forKey: .version)
    }
}
extension Invoice: Codable {
}
///
/// foreignkeyupdates
///
extension Invoice {
    
    @discardableResult
    static func persist(context: ModelContext, data: [Invoice]) -> SyncResult {
        var result = SyncResult(model: String(describing: Self.self), rows: data.count)
        for object in data {
            context.insert(object)
            foreignKeyUpdates(object: object, context: context)
      }
        try? context.save()
        result.setElapsedTime()
        return result
    }

    static func foreignKeyUpdates(object: Invoice, context: ModelContext) {
        object.address = nil
        if let targetIdValue = object.addressId {
            object.address = Address.fetchById(context: context, id: targetIdValue)
        }
        object.customer = nil
        if let targetIdValue = object.customerId {
            object.customer = Customer.fetchById(context: context, id: targetIdValue)
        }
    }
}
///
/// fetchable
///
extension Invoice {
    static func deleteById(context: ModelContext, id: String) {
        if let invoice = Invoice.fetchById(context: context, id: id) {
            context.delete(invoice)
        }
    }
    
    static func fetchById(context: ModelContext, id: String) ->Invoice? {
        let predicate = #Predicate<Invoice>{ $0.id == id }
        return Invoice.fetch(context: context, predicate: predicate, fetchLimit: 1)?.first
    }
}


