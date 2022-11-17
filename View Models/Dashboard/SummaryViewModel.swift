//
//  SummaryViewModel.swift
//  Bank.io
//

import Foundation

extension SummaryView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// Service that handles the data throughout the app:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// 'Bool' value indicating whether or not an array of transactions empty:
        var isTransactionsEmpty: Bool {
            transactions.isEmpty
        }
        
        /// Transactions to get the summary for:
        var transactions: [IO_Transaction] {
            dataService.filterAllTransactions().filter {
                $0.category != .income
            }
        }
    }
}
