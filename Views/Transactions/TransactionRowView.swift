//
//  TransactionRowView.swift
//  Bank.io
//

import SwiftUI

struct TransactionRowView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(
        currencyManager: CurrencyManager,
        transaction: IO_Transaction
    ) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(
            currencyManager: currencyManager,
            transaction: transaction
        )
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Color of the transaction's category:
    private var categoryColor: Color {
        Color(viewModel.categoryColor)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        IconBackgroundTitleTextContentView(
            icon: viewModel.categoryIcon,
            iconColor: categoryColor,
            iconBackgroundColor: categoryColor.opacity(0.12),
            title: viewModel.title,
            isTitleLocalized: false,
            text: viewModel.time,
            isTextLocalized: false,
            verticalPadding: 4,
            horizontalPadding: 0
        ) {
            amount
        }
    }
}

// MARK: - Amount:

private extension TransactionRowView {
    private var amount: some View {
        Text(viewModel.amount)
            .font(.headline)
            .multilineTextAlignment(.trailing)
            .foregroundColor(.primary)
    }
}

// MARK: - Preview:

struct TransactionRowView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionRowView(
            currencyManager: CurrencyManager(),
            transaction: .example
        )
    }
}
