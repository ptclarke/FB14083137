//
//  SyncResult.swift
//  FB14083137
//
//  Created by Peter Clarke on 29/6/2024.
//

import Foundation

struct SyncResult {
    let model: String
    var rows: Int
    var startDateTime = Date()
    var elapsedTime: Double = 0
    
    mutating func setElapsedTime() {
        elapsedTime = Double(round((Date().timeIntervalSince1970 - startDateTime.timeIntervalSince1970) * 1000) / 1000.000)
    }
    
    func description() -> String {
        return "model: \(model) rows: \(rows) startDatetime: \(startDateTime) elapsedTime: \(round(elapsedTime * 1000) / 1000.000)"
    }
}
