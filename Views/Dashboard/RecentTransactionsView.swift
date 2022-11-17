//
//  RecentTransactionsView.swift
//  Bank.io
//

import SwiftUI

struct RecentTransactionsView: View {
    
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
        if !viewModel.isTransactionsEmpty {
            item
        }
    }
}

// MARK: - Item:

private extension RecentTransactionsView {
    private var item: some View {
        itemContent
            .headerProminence(.increased)
    }
    
    private var itemContent: some View {
        Section("Recent Transactions") {
            transactions
        }
    }
}

// MARK: - Transactions:

private extension RecentTransactionsView {
    private var transactions: some View {
        ForEach(
            viewModel.transactions,
            content: transaction
        )
    }
    
    private func transaction(_ transaction: IO_Transaction) -> some View {
        TransactionRowView(
            currencyManager: currencyManager,
            transaction: transaction
        )
    }
}

// MARK: - Preview:

struct RecentTransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        RecentTransactionsView(dataService: DataService())
            .environmentObject(CurrencyManager())
    }
}
