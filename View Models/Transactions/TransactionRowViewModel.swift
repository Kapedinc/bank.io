//
//  TransactionRowViewModel.swift
//  Bank.io
//

import Foundation

extension TransactionRowView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// Manager that is responsible for currencies throughout the app:
        private let currencyManager: CurrencyManager
        
        /// An actual transaction:
        private let transaction: IO_Transaction
        
        init(
            currencyManager: CurrencyManager,
            transaction: IO_Transaction
        ) {
            
            /// Properties initialization:
            self.currencyManager = currencyManager
            self.transaction = transaction
        }
        
        // MARK: - Computed properties:
        
        /// Title of the transaction:
        var title: String {
            transaction.title
        }
        
        /// Time of the transaction:
        var time: String {
            transaction.time.formatted(
                date: .omitted,
                time: .shortened
            )
        }
        
        /// Amount of the transaction:
        var amount: String {
            transaction.amount.formatted(.currency(code: currencyManager.current.code))
        }
        
        /// Category of the transaction:
        var category: IO_Category {
            transaction.category
        }
        
        /// Color of the category:
        var categoryColor: String {
            category.color
        }
        
        /// Icon of the category:
        var categoryIcon: String {
            category.icon
        }
    }
}
