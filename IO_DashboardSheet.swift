//
//  IO_DashboardSheet.swift
//  Bank.io
//

import Foundation

enum IO_DashboardSheet: Int {
    
    // MARK: - Computed properties:
    
    /// Identifier of the sheet:
    var id: Int {
        rawValue
    }
    
    // MARK: - Cases:
    
    case settings
}

// MARK: - Identifiable:

extension IO_DashboardSheet: Identifiable {  }
