//
//  DataService.swift
//  Bank.io
//

import Foundation

final class DataService: DataServiceProtocol, ObservableObject {
    
    // MARK: - Properties:
    
    /// User that is currently logged in:
    @Published var currentUser: IO_User? = nil
    
    /// An array of accounts belonging to the user:
    @Published var accounts: [IO_Account] = []
    
    /// An array of cards  belonging to the user:
    @Published var cards: [IO_Card] = []
    
    /// An array of payment templates the current user has:
    @Published var paymentTemplates: [IO_PaymentTemplate] = []
    
    // MARK: - Computed properties:
    
    /// 'Bool' value indicating whether or not an array of accounts is empty:
    var isAccountsEmpty: Bool {
        accounts.isEmpty
    }
    
    /// 'Bool' value indicating whether or not an array of cards is empty:
    var isCardsEmpty: Bool {
        accounts.isEmpty
    }
    
    /// 'Bool' value indicating whether or not an array of payment templates is empty:
    var isPaymentTemplatesEmpty: Bool {
        paymentTemplates.isEmpty
    }
    
    // MARK: - Functions:
    
    /// Creates a user based on the details provided:
    func createUser(
        withFullName fullName: String,
        withUsername username: String,
        withPassword password: String,
        withAddressFirstLine firstLine: String,
        withAddressSecondLine secondLine: String,
        withCity city: String,
        withState state: String,
        withZIPCode zipCode: String
    ) async throws {
        
        /*
         
         NOTE: Please note that this method only works with the sample data and no network calls occur here - please add your own implementation for fetching the actual data from the server or any other logic that you would like this method to have.
         
         */
        
        /// Adding an artificial delay to simulate a network call:
        await addDelay(ofSeconds: 1)
        
        /// Creating sample data:
        await createSampleData()
        
        /// Updating data base on the current user:
        await updateData()
    }
    
    /// Fetches the data for the logged in user from the database (Please add your own implementation):
    func fetchUser(
        withUsername username: String,
        withPassword password: String
    ) async throws {
        
        /*
         
         NOTE: Please note that this method only works with the sample data and no network calls occur here - please add your own implementation for fetching the actual data from the server or any other logic that you would like this method to have.
         
         */
        
        /// Adding an artificial delay to simulate a network call:
        await addDelay(ofSeconds: 1)
        
        /// Creating sample data:
        await createSampleData()
        
        /// Updating data base on the current user:
        await updateData()
    }
    
    /// Fetches the accounts for the current user:
    func fetchAccounts(forUser user: IO_User) async throws {
        
        /*
         
         NOTE: Please note that this method only assigns a sample data and no network calls occur here - please add your own implementation for fetching the actual data from the server or any other logic that you would like this method to have.
         
         */
        
        /// Adding an artificial delay to simulate a network call:
        await addDelay(ofSeconds: 1)
        
        /// Updating the UI on the main thread:
        await MainActor.run {
            
            /// Updating the accounts:
            accounts = user.accounts
        }
    }
    
    /// Fetches the cards for the current user:
    func fetchCards(forUser user: IO_User) async throws {
        
        /*
         
         NOTE: Please note that this method only assigns a sample data and no network calls occur here - please add your own implementation for fetching the actual data from the server or any other logic that you would like this method to have.
         
         */
        
        /// Adding an artificial delay to simulate a network call:
        await addDelay(ofSeconds: 1)
        
        /// Updating the UI on the main thread:
        await MainActor.run {
            
            /// Updating the cards:
            cards = user.cards
        }
    }
    
    /// Fetches the payment templates for the current user:
    func fetchPaymentTemplates(forUser user: IO_User) async throws {
        
        /*
         
         NOTE: Please note that this method only assigns a sample data and no network calls occur here - please add your own implementation for fetching the actual data from the server or any other logic that you would like this method to have.
         
         */
        
        /// Adding an artificial delay to simulate a network call:
        await addDelay(ofSeconds: 1)
        
        /// Updating the UI on the main thread:
        await MainActor.run {
            
            /// Updating the payment templates:
            paymentTemplates = user.paymentTemplates
        }
    }
    
    /// Fetches the transactions for the given account:
    func fetchTransactionsDates(forAccount account: IO_Account) async throws -> [IO_TransactionsDate] {
        
        /*
         
         NOTE: Please note that this method only returns a sample data and no network calls occur here - please add your own implementation for fetching the actual data from the server or any other logic that you would like this method to have.
         
         */
        
        /// Adding an artificial delay to simulate a network call:
        await addDelay(ofSeconds: 1)
        
        /// Returning the transaction dates of the given account:
        return account.transactionsDates
    }
    
    /// Returns an array of transactions filtered by the type and count:
    func filterAllTransactions(
        onDate date: IO_TransactionsDate? = nil,
        ofType type: IO_TransactionType? = nil,
        withCount count: Int? = nil
    ) -> [IO_Transaction] {
        
        /// An array of all transactions:
        let transactions: [IO_Transaction] = Array(Set(accounts.map {
            $0.transactionsDates.filter {
                if let date {
                    return $0 == date
                } else {
                    return true
                }
            }.map {
                $0.transactions
            }.flatMap {
                $0
            }
        }.flatMap {
            $0
        })).sorted {
            $0.time < $1.time
        }
        
        /// Filtering transactions based on the type:
        let filteredTransactions: [IO_Transaction] = transactions.filter {
            if let type {
                return $0.type == type
            } else {
                return true
            }
        }
        
        /// Checking whether or not we need to limit the count of transactions:
        if let count {
            
            /// If the count was provided, simply retuning the filtered transactions prefixed by a count:
            return Array(filteredTransactions.prefix(count))
        } else {
            
            /// If we don't need to limit the count of transactions, simply returning an array of filtered transactions:
            return filteredTransactions
        }
    }
    
    // MARK: - private functions:
    
    /// Updates the data:
    private func updateData() async {
        
        /// Updating the UI on the main thread:
        await MainActor.run {
            
            /// Making sure we have the current user:
            if let currentUser {
                
                /// Assigning the accounts:
                accounts = currentUser.accounts
                
                /// Assigning the cards:
                cards = currentUser.cards
                
                /// Assigning the payment templates:
                paymentTemplates = currentUser.paymentTemplates
            }
        }
    }
}

// MARK: - Sample data:

private extension DataService {
    
    /*
     
     NOTE: This is only for creating a sample data, please add your own implementation for fetching and managing the actual data:
     
     */
    
    // MARK: - Private functions:
    
    /// Creates a sample data:
    private func createSampleData() async {
        
        /// Updating the UI on the main thread:
        await MainActor.run {
            
            /// Assigning the current user:
            currentUser = .sample
        }
    }
}


// MARK: - Delay:

private extension DataService {
    
    /*
     
     NOTE: Please note that the 'addDelay' method is only used to simulate a network call when assigning a sample date, otherwise the sample data would be assigned instantly.
     
     */
    
    // MARK: - Private functions:
    
    /// Adds an artificial delay:
    private func addDelay(ofSeconds seconds: Double) async {
        
        /// Making the async task to go to sleep for the given amount of seconds transformed into nanoseconds:
        try? await Task.sleep(nanoseconds: UInt64(seconds * 1_000_000_000))
    }
}
