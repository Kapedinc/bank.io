//
//  AccountsViewModel.swift
//  Bank.io
//

import Foundation

extension AccountsView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// Service responsible for fetching the data within the app:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// 'Bool' value indicating whether or not an array of accounts is empty:
        var isAccountsEmpty: Bool {
            accounts.isEmpty
        }
        
        /// An array of accounts to display:
        var accounts: [IO_Account] {
            dataService.accounts
        }
    }
}
