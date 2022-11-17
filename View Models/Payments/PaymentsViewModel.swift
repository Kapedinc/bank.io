//
//  PaymentsViewModel.swift
//  Bank.io
//

import Foundation

extension PaymentsView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// State that the view is in:
        @Published var viewState: IO_ViewState = .defaultState
        
        // MARK: - Private properties:
        
        /// Service that handles the data throughout the app:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// 'Bool' value indicating whether or not both templates and recent arrays are empty:
        var isAllEmpty: Bool {
            isTemplatesEmpty
            && isRecentEmpty
        }
        
        /// 'Bool' value indicating whether or not an array of templates is empty:
        var isTemplatesEmpty: Bool {
            templates.isEmpty
        }
        
        /// 'Bool' value indicating whether or not an array of payments is empty:
        var isRecentEmpty: Bool {
            recent.isEmpty
        }
        
        /// An array of templates belonging to the current user:
        var templates: [IO_PaymentTemplate] {
            dataService.paymentTemplates
        }
        
        /// An array of recent payments:
        var recent: [IO_Transaction] {
            dataService.filterAllTransactions(
                ofType: .outgoingTransfer,
                withCount: 5
            )
        }
        
        // MARK: - Functions:
        
        /// Fetches all the payments:
        func fetchPayments() async {
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Setting the view state to '.loading':
                updateViewState(withState: .loading)
            }
            
            /// Making sure we have the current user:
            if let currentUser: IO_User = dataService.currentUser {
                
                /// Fetching and updating the accounts for the current user:
                try? await dataService.fetchAccounts(forUser: currentUser)
                
                /// Fetching and updating the cards for the current user:
                try? await dataService.fetchPaymentTemplates(forUser: currentUser)
            }
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Setting the view state to either '.loaded' or '.empty' based on the templates and recent:
                updateViewState(withState: isAllEmpty ? .empty : .loaded)
            }
        }
        
        /// Potentially shows a view for making a new payment:
        func newPayment() {
            
            /*
             
             NOTE: This method doesn't do anything at the moment, please add your own implementation.
             
             */
            
        }
        
        // MARK: - Private functions:
        
        /// Updates the view state based on the state provided:
        private func updateViewState(withState state: IO_ViewState) {
            
            /// Updating the view state:
            self.viewState = state
        }
    }
}
