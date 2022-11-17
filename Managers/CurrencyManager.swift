//
//  CurrencyManager.swift
//  Bank.io
//

import Foundation

final class CurrencyManager: ObservableObject {
    
    // MARK: - Properties:
    
    /// Current currency that the user is using right now (You can add your own implementation for supporting different currencies if needed):
    @Published var current: IO_Currency = .usDollar
}
