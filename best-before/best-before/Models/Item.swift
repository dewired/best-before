//
//  Item.swift
//  best-before
//
//  Created by Akash Navani on 4/28/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var name: String
    var expirationDate: Date
    var originalExpirationDate: Date
    var openedDate: Date?
    var category: String
    var storageLocation: String
    var isOpened: Bool
    var isPartiallyConsumed: Bool
    var remainingQuantity: Double?
    var lastConsumedDate: Date?
    var notes: String?
    var createdAt: Date
    var updatedAt: Date
    
    init(
        name: String,
        expirationDate: Date,
        category: String = "Uncategorized",
        storageLocation: String = "Unspecified",
        notes: String? = nil
    ) {
        self.name = name
        self.expirationDate = expirationDate
        self.originalExpirationDate = expirationDate
        self.category = category
        self.storageLocation = storageLocation
        self.notes = notes
        self.isOpened = false
        self.isPartiallyConsumed = false
        self.createdAt = Date()
        self.updatedAt = Date()
    }
    
    func markAsOpened() {
        guard !isOpened else { return }
        isOpened = true
        openedDate = Date()
        updatedAt = Date()
        adjustExpirationDateBasedOnCategory()
    }
    
    func markAsUnopened() {
        guard isOpened else { return }
        isOpened = false
        openedDate = nil
        expirationDate = originalExpirationDate
        updatedAt = Date()
    }
    
    func updateRemainingQuantity(_ quantity: Double) {
        remainingQuantity = quantity
        isPartiallyConsumed = quantity < 1.0
        updatedAt = Date()
    }
    
    private func adjustExpirationDateBasedOnCategory() {
        let calendar = Calendar.current
        var daysToAdd = 0
        
        switch category.lowercased() {
        case "dairy":
            daysToAdd = 7 // 7 days after opening
        case "meat":
            daysToAdd = 3 // 3 days after opening
        case "produce":
            daysToAdd = 5 // 5 days after opening
        case "pantry":
            daysToAdd = 14 // 14 days after opening
        case "beverages":
            daysToAdd = 7 // 7 days after opening
        default:
            daysToAdd = 7 // Default to 7 days
        }
        
        if let openDate = openedDate {
            expirationDate = calendar.date(byAdding: .day, value: daysToAdd, to: openDate) ?? expirationDate
        }
    }
}
