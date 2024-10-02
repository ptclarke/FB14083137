//
//  Address.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation
import SwiftData

@Model
final class Address {
    
    @Attribute(.unique)
    var id: String
    
    var city: String?
    var country: String?
    var countryIsoCode: String?
    var email: String?
    var lastModified: Date?
    var lastModifiedBy: String?
    var lastModifiedLocally: Date?
    var phone1: String?
    var phone2: String?
    var postCode: String?
    var reference: String?
    var stateOrTerritory: String?
    var streetAddress: String?
    var version: Int?
    
    // inverse relationships
    var customer: Customer?
    var invoice: Invoice?
    var quote: Quote?
    
    init(id: String, city: String? = nil, country: String? = nil, countryIsoCode: String? = nil, email: String? = nil, lastModified: Date? = nil, lastModifiedBy: String? = nil, lastModifiedLocally: Date? = nil, phone1: String? = nil, phone2: String? = nil, postCode: String? = nil, reference: String? = nil, stateOrTerritory: String? = nil, streetAddress: String? = nil, version: Int? = nil) {
        self.id = id
        self.city = city
        self.country = country
        self.countryIsoCode = countryIsoCode
        self.email = email
        self.lastModified = lastModified
        self.lastModifiedBy = lastModifiedBy
        self.lastModifiedLocally = lastModifiedLocally
        self.phone1 = phone1
        self.phone2 = phone2
        self.postCode = postCode
        self.reference = reference
        self.stateOrTerritory = stateOrTerritory
        self.streetAddress = streetAddress
        self.version = version
    }

    enum CodingKeys: String, CodingKey {
        case id
        case city
        case country
        case countryIsoCode
        case email
        case lastModified
        case lastModifiedBy
        case lastModifiedLocally
        case phone1
        case phone2
        case postCode
        case reference
        case stateOrTerritory
        case streetAddress
        case version
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.city = try container.decodeIfPresent(String.self, forKey: .city)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.countryIsoCode = try container.decodeIfPresent(String.self, forKey: .countryIsoCode)
        self.email = try container.decodeIfPresent(String.self, forKey: .email)
        self.lastModified = try container.decodeIfPresent(Date.self, forKey: .lastModified)
        self.lastModifiedBy = try container.decodeIfPresent(String.self, forKey: .lastModifiedBy)
        self.lastModifiedLocally = try container.decodeIfPresent(Date.self, forKey: .lastModifiedLocally)
        self.phone1 = try container.decodeIfPresent(String.self, forKey: .phone1)
        self.phone2 = try container.decodeIfPresent(String.self, forKey: .phone2)
        self.postCode = try container.decodeIfPresent(String.self, forKey: .postCode)
        self.reference = try container.decodeIfPresent(String.self, forKey: .reference)
        self.stateOrTerritory = try container.decodeIfPresent(String.self, forKey: .stateOrTerritory)
        self.streetAddress = try container.decodeIfPresent(String.self, forKey: .streetAddress)
        self.version = try container.decodeIfPresent(Int.self, forKey: .version)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(city, forKey: .city)
        try container.encode(country, forKey: .country)
        try container.encode(countryIsoCode, forKey: .countryIsoCode)
        try container.encode(email, forKey: .email)
        try container.encode(lastModified, forKey: .lastModified)
        try container.encode(lastModifiedBy, forKey: .lastModifiedBy)
        try container.encode(lastModifiedLocally, forKey: .lastModifiedLocally)
        try container.encode(phone1, forKey: .phone1)
        try container.encode(phone2, forKey: .phone2)
        try container.encode(postCode, forKey: .postCode)
        try container.encode(reference, forKey: .reference)
        try container.encode(stateOrTerritory, forKey: .stateOrTerritory)
        try container.encode(streetAddress, forKey: .streetAddress)
        try container.encode(version, forKey: .version)
    }
}

extension Address: Codable {
}
///
/// fetchable
///
extension Address {
    static func deleteById(context: ModelContext, id: String) {
        if let address = Address.fetchById(context: context, id: id) {
            context.delete(address)
        }
    }
    
    static func fetchById(context: ModelContext, id: String) -> Address? {
        let predicate = #Predicate<Address>{ $0.id == id }
        return Address.fetch(context: context, predicate: predicate, fetchLimit: 1)?.first
    }
}
///
/// syncable protocol
///
extension Address {
    static func fetchLastModified(context: ModelContext, timestamp: Date) -> [Address]? {
        let predicate = #Predicate<Address> {
            if let lastModified = $0.lastModifiedLocally {
                return lastModified < timestamp
            } else {
                return false
            }
         }
        return Address.fetch(context: context, predicate: predicate)
    }

    static func clearLastModified(context: ModelContext, timestamp: Date) {
        if let objects = Address.fetchLastModified(context: context, timestamp: timestamp) {
            for object in objects {
                object.lastModifiedLocally = nil
            }
        }
    }

}

///
/// persistable
///
extension Address {
    
    @discardableResult
    static func persist(context: ModelContext, data: [any PersistentModel]) -> SyncResult {
        var result = SyncResult(model: String("\(Self.self)"), rows: data.count)
        for object in data {
            context.insert(object)
        }
        try? context.save()
        result.setElapsedTime()
        return result
    }
}

extension Address {
    
    func format(format: String, name: String?) -> String? {
        var address = format
        address = address.replacingOccurrences(of: "|name|", with: name ?? "")
        address = address.replacingOccurrences(of: "|street|", with: streetAddress ?? "")
        address = address.replacingOccurrences(of: "|city|", with: city ?? "")
        address = address.replacingOccurrences(of: "|state|", with: stateOrTerritory ?? "")
        address = address.replacingOccurrences(of: "|postcode|", with: postCode ?? "")
        address = address.replacingOccurrences(of: "|country|", with: country ?? "")
        return address.replacingOccurrences(of: "[\n]+", with: "\n", options: .regularExpression).trimmingCharacters(in: .whitespaces)
    }
}
