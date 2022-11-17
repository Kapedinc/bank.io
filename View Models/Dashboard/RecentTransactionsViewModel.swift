//
//  RecentTransactionsViewModel.swift
//  Bank.io
//

import Foundation

extension RecentTransactionsView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// Service that handles the data within the app:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// 'Bool' value indicating whether or not an array of transactions is empty:
        var isTransactionsEmpty: Bool {
            transactions.isEmpty
        }
        
        /// Five most recent transactions regardless of the account:
        var transactions: [IO_Transaction] {
            dataService.filterAllTransactions(
                onDate: .dateOne,
                withCount: 5
            )
        }
    }
}
