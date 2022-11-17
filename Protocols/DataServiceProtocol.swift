//
//  DataServiceProtocol.swift
//  Bank.io
//

import Foundation

protocol DataServiceProtocol {
    
    // MARK: - Functions:
    
    /// Method for creating a user:
    func createUser(
        withFullName fullName: String,
        withUsername username: String,
        withPassword password: String,
        withAddressFirstLine firstLine: String,
        withAddressSecondLine secondLine: String,
        withCity city: String,
        withState state: String,
        withZIPCode zipCode: String
    ) async throws
    
    /// Method for fetching user's data based on their credentials:
    func fetchUser(
        withUsername username: String,
        withPassword password: String
    ) async throws
    
    /// Method for fetching the accounts belonging to the logged in user:
    func fetchAccounts(forUser user: IO_User) async throws
    
    /// Method for fetching the cards for the logged in user:
    func fetchCards(forUser user: IO_User) async throws
    
    /// Method for fetching the payments templates for the logged in user:
    func fetchPaymentTemplates(forUser user: IO_User) async throws
    
    /// Method for fetching the transactions dates and their transactions for the given account:
    func fetchTransactionsDates(forAccount account: IO_Account) async throws -> [IO_TransactionsDate]
}
