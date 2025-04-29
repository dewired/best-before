//
//  best_beforeTests.swift
//  best-beforeTests
//
//  Created by Akash Navani on 4/28/25.
//

import Testing
import Foundation
import SwiftData
@testable import best_before

struct ItemTests {
    
    @Test func testItemInitialization() async throws {
        let name = "Milk"
        let expirationDate = Date()
        let item = Item(name: name, expirationDate: expirationDate)
        
        #expect(item.name == name)
        #expect(item.expirationDate == expirationDate)
        #expect(item.originalExpirationDate == expirationDate)
        #expect(item.category == "Uncategorized")
        #expect(item.storageLocation == "Unspecified")
        #expect(item.isOpened == false)
        #expect(item.isPartiallyConsumed == false)
        #expect(item.remainingQuantity == nil)
        #expect(item.openedDate == nil)
        #expect(item.lastConsumedDate == nil)
        #expect(item.notes == nil)
    }
    
    @Test func testItemStateTransitions() async throws {
        let item = Item(name: "Yogurt", expirationDate: Date())
        let originalExpirationDate = item.expirationDate
        
        // Test opening
        item.markAsOpened()
        #expect(item.isOpened == true)
        #expect(item.openedDate != nil)
        #expect(item.expirationDate != originalExpirationDate)
        
        // Test unopening
        item.markAsUnopened()
        #expect(item.isOpened == false)
        #expect(item.openedDate == nil)
        #expect(item.expirationDate == originalExpirationDate)
    }
    
    @Test func testRemainingQuantity() async throws {
        let item = Item(name: "Orange Juice", expirationDate: Date())
        
        // Test partial consumption
        item.updateRemainingQuantity(0.5)
        #expect(item.remainingQuantity == 0.5)
        #expect(item.isPartiallyConsumed == true)
        
        // Test full consumption
        item.updateRemainingQuantity(0.0)
        #expect(item.remainingQuantity == 0.0)
        #expect(item.isPartiallyConsumed == true)
    }
}
