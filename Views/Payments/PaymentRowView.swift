//
//  PaymentRowView.swift
//  Bank.io
//

import SwiftUI

struct PaymentRowView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(payment: IO_Transaction) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(payment: payment)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    /// Color of the transaction's category:
    private var categoryColor: Color {
        Color(viewModel.categoryColor)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .navigationDestination(
                for: IO_Transaction.self,
                destination: payment
            )
    }
}

// MARK: - Item:

private extension PaymentRowView {
    private var item: some View {
        NavigationLink(value: viewModel.payment) {
            label
        }
    }
}

// MARK: - Label:

private extension PaymentRowView {
    private var label: some View {
        IconBackgroundTitleTextView(
            icon: viewModel.categoryIcon,
            iconColor: categoryColor,
            iconBackgroundColor: categoryColor.opacity(0.12),
            title: viewModel.title,
            isTitleLocalized: false,
            text: viewModel.details,
            isTextLocalized: false,
            verticalPadding: 4,
            horizontalPadding: 0
        )
    }
}

// MARK: - Payment:

private extension PaymentRowView {
    private func payment(_ payment: IO_Transaction) -> some View {
        
        /*
         
         NOTE: For now, this view simply displays the title of the payment, you can add your own implementation for the payment details here.
         
         */
        
        Text(payment.title)
            .foregroundColor(.secondary)
            .padding()
    }
}

// MARK: - Preview:

struct PaymentRowView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentRowView(payment: .example)
    }
}
