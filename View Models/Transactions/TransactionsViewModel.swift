//
//  TransactionsViewModel.swift
//  Bank.io
//

import Foundation

extension TransactionsView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// State that the view is in:
        @Published var viewState: IO_ViewState = .defaultState
        
        /// Text to filter transactions by:
        @Published var searchText: String = ""
        
        // MARK: - Private properties:
        
        /// An array of transaction dates fetched for this account:
        @Published private var transactionsDates: [IO_TransactionsDate] = []
        
        /// Service that handles the data throughout the app:
        private let dataService: DataService
        
        /// Account to display transactions for:
        private let account: IO_Account
        
        init(
            dataService: DataService,
            account: IO_Account
        ) {
            
            /// Properties initialization:
            self.dataService = dataService
            self.account = account
        }
        
        // MARK: - Computed properties:
        
        /// Title of the account:
        var title: String {
            account.title
        }
        
        // MARK: - Functions:
        
        /// Returns an array of transaction dates whose transactions match the search text:
        func searchTransactionsDates() -> [IO_TransactionsDate] {
            sortTransactionsDates().filter {
                searchText.isEmpty
                    ? true
                    : !searchTransactions(onDate: $0).isEmpty
            }
        }
        
        /// Returns an array of transaction that match the search text:
        func searchTransactions(onDate date: IO_TransactionsDate) -> [IO_Transaction] {
            sortTransactions(onDate: date).filter {
                searchText.isEmpty
                    ? true
                    : $0.title.localizedCaseInsensitiveContains(searchText)
            }
        }
        
        /// Fetches the transaction dates:
        func getTransactionsDates() async {
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Setting the view state to '.loading':
                updateViewState(withState: .loading)
            }
            
            /// An array of transaction dates:
            let transactionsDates: [IO_TransactionsDate] = (
                try? await dataService.fetchTransactionsDates(forAccount: account)
            ) ?? []
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Assigning the transaction dates:
                self.transactionsDates = transactionsDates
                
                /// Setting the view state to either '.loaded' or '.empty' based on the transaction dates array:
                updateViewState(withState: transactionsDates.isEmpty ? .empty : .loaded)
            }
        }
        
        /// Gets called whenever an array of transactions dates changes:
        func transactionsDatesOnChange(_ transactionsDates: [IO_TransactionsDate]) {
            
            /// Updating the view state based on whether or not an array of dates is empty:
            updateViewState(withState: transactionsDates.isEmpty ? .empty : .loaded)
        }
        
        // MARK: - Private functions:
        
        /// Returns an array of transaction dates sorted by their date:
        private func sortTransactionsDates() -> [IO_TransactionsDate] {
            transactionsDates.sorted {
                $0.date < $1.date
            }
        }
        
        /// Returns an array of transactions for the given date sorted by their time:
        private func sortTransactions(onDate date: IO_TransactionsDate) -> [IO_Transaction] {
            date.transactions.sorted {
                $0.time < $1.time
            }
        }
        
        /// Updates the view state based on the state provided:
        private func updateViewState(withState state: IO_ViewState) {
            
            /// Updating the view state:
            self.viewState = state
        }
    }
}
