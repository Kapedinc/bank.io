//
//  AccountRowView.swift
//  Bank.io
//

import SwiftUI

struct AccountRowView: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// Service that handles the data throughout the app:
    @EnvironmentObject private var dataService: DataService
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(
        currencyManager: CurrencyManager,
        account: IO_Account
    ) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(
            currencyManager: currencyManager,
            account: account
        )
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the content should be moved (When dynamic type's size is too large):
    private var shouldMoveContent: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    /// Color of the view:
    private var color: Color {
        Color(viewModel.color)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .navigationDestination(
                for: IO_Account.self,
                destination: transactions
            )
    }
}

// MARK: - Item:

private extension AccountRowView {
    private var item: some View {
        IconBackgroundTitleTextContentView(
            icon: viewModel.icon,
            iconColor: color,
            iconBackgroundColor: color.opacity(0.12),
            title: viewModel.title,
            isTitleLocalized: false,
            text: viewModel.number,
            isTextLocalized: false,
            verticalPadding: 4,
            horizontalPadding: 0
        ) {
            balance
        }
    }
}

// MARK: - Balance:

private extension AccountRowView {
    private var balance: some View {
        NavigationLink(value: viewModel.account) {
            balanceContent
        }
    }
    
    private var balanceContent: some View {
        HStack(spacing: 0) {
            balanceItem
        }
    }
    
    @ViewBuilder
    private var balanceItem: some View {
        balanceSpacer(isShowing: !shouldMoveContent)
        balanceItemContent
        balanceSpacer(isShowing: shouldMoveContent)
    }
    
    private var balanceItemContent: some View {
        Text(viewModel.balance)
            .font(.headline)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.primary)
    }
    
    @ViewBuilder
    private func balanceSpacer(isShowing: Bool) -> some View {
        if isShowing {
            Spacer(minLength: 0)
        }
    }
}

// MARK: - Transactions:

private extension AccountRowView {
    private func transactions(forAccount account: IO_Account) -> some View {
        TransactionsView(
            dataService: dataService,
            account: account
        )
    }
}

// MARK: - Preview:

struct AccountRowView_Previews: PreviewProvider {
    static var previews: some View {
        AccountRowView(
            currencyManager: CurrencyManager(),
            account: .example
        )
        .environmentObject(DataService())
    }
}
