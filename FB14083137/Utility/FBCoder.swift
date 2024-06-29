//
//  FBCoder.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation

struct FBCoder {
    
    static let shared = FBCoder()
    
    var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .custom({ date, encoder in
            var container = encoder.singleValueContainer()
            try? container.encode((Int(date.timeIntervalSince1970 * 1000)))
        })
        return encoder
    }
    
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .millisecondsSince1970
        return decoder
    }

    private init() {
    }
    
    ///
    /// Encode object throwing error
    ///
    func encodeObject<T: Encodable>(object: T) throws -> Data? {
        return try encoder.encode(object)
    }
    ///
    /// Decode object throwing error
    ///
    func decodeObject<T: Decodable>(data: Data, type: T.Type) throws -> T? {
        return try decoder.decode(type, from: data)
    }
}
