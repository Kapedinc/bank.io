//
//  PaymentRowViewModel.swift
//  Bank.io
//

import Foundation

extension PaymentRowView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// An actual payment:
        let payment: IO_Transaction
        
        init(payment: IO_Transaction) {
            
            /// Properties initialization:
            self.payment = payment
        }
        
        // MARK: - Computed properties:
        
        /// Title of the payment:
        var title: String {
            payment.title
        }
        
        /// Details of the payment:
        var details: String {
            payment.details
        }
        
        /// Category of the payment:
        var category: IO_Category {
            payment.category
        }
        
        /// Color of the payment:
        var categoryColor: String {
            category.color
        }
        
        /// Icon of the payment:
        var categoryIcon: String {
            category.icon
        }
    }
}
