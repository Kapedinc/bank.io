//
//  CardViewModel.swift
//  Bank.io
//

import Foundation

extension CardView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Private properties:
        
        /// An actual card:
        private let card: IO_Card
        
        init(card: IO_Card) {
            
            /// Properties initilization:
            self.card = card
        }
        
        // MARK: - Computed properties:
        
        /// Title of the card:
        var title: String {
            card.title
        }
        
        /// Number of the card:
        var number: String {
            card.number
        }
        
        /// Expiry date of the card:
        var expiryDate: String {
            
            /// Expiry date of the card:
            let expiryDate: Date = card.expiryDate
            
            /// Date formatted as a string:
            let expiryDateString: String = expiryDate.formatted(.dateTime.month(.twoDigits)) + " / " + expiryDate.formatted(.dateTime.year(.twoDigits))
            
            /// Returning the date formatted as a string:
            return expiryDateString
        }
        
        /// Name of the card's holder:
        var cardholderName: String {
            card.cardholderName
        }
        
        /// Color of the card:
        var color: String {
            card.color
        }
        
        /// Logo of the card's provider:
        var providerLogo: String {
            card.provider.logo
        }
    }
}
