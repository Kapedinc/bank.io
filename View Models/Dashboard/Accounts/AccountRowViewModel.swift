//
//  AccountRowViewModel.swift
//  Bank.io
//

import Foundation

extension AccountRowView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// Account to display:
        let account: IO_Account
        
        // MARK: - Private properties:
        
        /// Manager that is responsible for currencies throughout the app:
        private let currencyManager: CurrencyManager
        
        init(
            currencyManager: CurrencyManager,
            account: IO_Account
        ) {
            
            /// Properties initialization:
            self.currencyManager = currencyManager
            self.account = account
        }
        
        // MARK: - Computed properties:
        
        /// Title of the account:
        var title: String {
            account.title
        }
        
        /// Number of the account:
        var number: String {
            account.number
        }
        
        /// Balance of the account:
        var balance: String {
            account.balance.formatted(.currency(code: currencyManager.current.code))
        }
        
        /// Color of the account:
        var color: String {
            account.color
        }
        
        /// Icon of the account:
        var icon: String {
            account.icon
        }
    }
}
