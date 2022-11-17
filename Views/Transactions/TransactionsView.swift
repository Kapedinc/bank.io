//
//  TransactionsView.swift
//  Bank.io
//

import SwiftUI

struct TransactionsView: View {
    
    // MARK: - Private properties:
    
    /// Manager that is responsible for currencies throughout the app:
    @EnvironmentObject private var currencyManager: CurrencyManager
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(
        dataService: DataService,
        account: IO_Account
    ) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(
            dataService: dataService,
            account: account
        )
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// State of the view:
    private var viewState: IO_ViewState {
        viewModel.viewState
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        list
            .overlay {
                loading
            }
            .overlay {
                noTransactions
            }
            .navigationTitle(viewModel.title)
            .searchable(
                text: $viewModel.searchText,
                placement: .navigationBarDrawer
            )
            .onChange(
                of: viewModel.searchTransactionsDates(),
                perform: viewModel.transactionsDatesOnChange
            )
            .animation(
                .default,
                value: viewState
            )
            .animation(
                .default,
                value: viewModel.searchText
            )
            .refreshable {
                await viewModel.getTransactionsDates()
            }
            .task {
                await viewModel.getTransactionsDates()
            }
    }
}

// MARK: - Loading:

private extension TransactionsView {
    private var loading: some View {
        LoadingView(
            isShowing: viewState == .loading,
            title: "Loading...",
            color: .secondary
        )
    }
}

// MARK: - No transactions:

private extension TransactionsView {
    private var noTransactions: some View {
        EmptyStateView(
            isShowing: viewState == .empty,
            title: "No Transactions",
            text: "You don't have any transactions."
        )
    }
}

// MARK: - List:

private extension TransactionsView {
    private var list: some View {
        listContent
            .listStyle(.insetGrouped)
    }
    
    private var listContent: some View {
        List {
            transactionsDates
        }
    }
}

// MARK: - Dates:

private extension TransactionsView {
    @ViewBuilder
    private var transactionsDates: some View {
        if viewState == .loaded {
            transactionsDatesContent
        }
    }
    
    private var transactionsDatesContent: some View {
        ForEach(
            viewModel.searchTransactionsDates(),
            content: transactionsDate
        )
    }
    
    private func transactionsDate(_ date: IO_TransactionsDate) -> some View {
        transactionsDateContent(date)
            .headerProminence(.increased)
    }
    
    private func transactionsDateContent(_ date: IO_TransactionsDate) -> some View {
        Section(date.title) {
            transactions(onDate: date)
        }
    }
    
    private func transactions(onDate date: IO_TransactionsDate) -> some View {
        ForEach(
            viewModel.searchTransactions(onDate: date),
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

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(
            dataService: DataService(),
            account: IO_Account.example
        )
        .environmentObject(CurrencyManager())
    }
}
