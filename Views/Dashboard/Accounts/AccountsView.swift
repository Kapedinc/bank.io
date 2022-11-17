//
//  AccountsView.swift
//  Bank.io
//

import SwiftUI

struct AccountsView: View {
    
    // MARK: - Private properties:
    
    /// Manager that is responsible for currencies throughout the app:
    @EnvironmentObject private var currencyManager: CurrencyManager
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(dataService: DataService) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(dataService: dataService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if !viewModel.isAccountsEmpty {
            item
        }
    }
}

// MARK: - Item:

private extension AccountsView {
    private var item: some View {
        itemContent
            .headerProminence(.increased)
    }
    
    private var itemContent: some View {
        Section("Accounts") {
            accounts
        }
    }
}

// MARK: - Accounts:

private extension AccountsView {
    private var accounts: some View {
        ForEach(
            viewModel.accounts,
            content: account
        )
    }
    
    private func account(_ account: IO_Account) -> some View {
        AccountRowView(
            currencyManager: currencyManager,
            account: account
        )
    }
}

// MARK: - Preview:

struct AccountsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountsView(dataService: DataService())
            .environmentObject(CurrencyManager())
    }
}
