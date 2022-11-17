//
//  PaymentsView.swift
//  Bank.io
//

import SwiftUI

struct PaymentsView: View {
    
    // MARK: - Private properties:
    
    /// Service that handles the data throughout the app:
    @EnvironmentObject private var dataService: DataService
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(dataService: DataService) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(dataService: dataService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// State of the view:
    private var viewState: IO_ViewState {
        viewModel.viewState
    }
    
    // MARK: - View:
    
    var body: some View {
        navigationStack
    }
    
    private var navigationStack: some View {
        NavigationStack {
            content
        }
    }
    
    private var content: some View {
        list
            .overlay {
                loading
            }
            .overlay {
                noPayments
            }
            .overlay(alignment: .bottomTrailing) {
                newPaymentButton
            }
            .navigationTitle("Payments")
            .toolbar {
                avatarToolbar
            }
            .animation(
                .default,
                value: viewState
            )
            .refreshable {
                await viewModel.fetchPayments()
            }
            .task {
                await viewModel.fetchPayments()
            }
    }
}

// MARK: - Loading:

private extension PaymentsView {
    private var loading: some View {
        LoadingView(
            isShowing: viewState == .loading,
            title: "Loading...",
            color: .secondary
        )
    }
}

// MARK: - No payments:

private extension PaymentsView {
    private var noPayments: some View {
        EmptyStateView(
            isShowing: viewState == .empty,
            title: "No Payments",
            text: "You don't have any payments."
        )
    }
}

// MARK: - New payment button:

private extension PaymentsView {
    @ViewBuilder
    private var newPaymentButton: some View {
        if viewState != .loading {
            newPaymentButtonContent
        }
    }
    
    private var newPaymentButtonContent: some View {
        ButtonView(
            title: "New Payment",
            icon: Icons.plus,
            font: .system(size: 28, weight: .bold, design: .default),
            style: .iconOnly,
            isFullWidth: false,
            cornerRadius: 48,
            shadowColor: .accentColor.opacity(0.24),
            shadowRadius: 12,
            shadowYAxis: 12,
            padding: 16,
            action: viewModel.newPayment
        )
    }
}

// MARK: - List:

private extension PaymentsView {
    private var list: some View {
        listContent
            .listStyle(.insetGrouped)
    }
    
    private var listContent: some View {
        List {
            listItem
        }
    }
    
    @ViewBuilder
    private var listItem: some View {
        if viewState == .loaded {
            listItemContent
        }
    }
    
    @ViewBuilder
    private var listItemContent: some View {
        templates
        recent
    }
}

// MARK: - Templates:

private extension PaymentsView {
    @ViewBuilder
    private var templates: some View {
        if !viewModel.isTemplatesEmpty {
            templatesContent
        }
    }
    
    private var templatesContent: some View {
        templatesItem
            .headerProminence(.increased)
    }
    
    private var templatesItem: some View {
        Section("Templates") {
            templatesItemContent
        }
    }
    
    private var templatesItemContent: some View {
        ForEach(
            viewModel.templates,
            content: PaymentTemplateRowView.init
        )
    }
}

// MARK: - Recent:

private extension PaymentsView {
    @ViewBuilder
    private var recent: some View {
        if !viewModel.isRecentEmpty {
            recentContent
        }
    }
    
    private var recentContent: some View {
        recentItem
            .headerProminence(.increased)
    }
    
    private var recentItem: some View {
        Section("Recent") {
            transactions
        }
    }
    
    private var transactions: some View {
        ForEach(
            viewModel.recent,
            content: PaymentRowView.init
        )
    }
}

// MARK: - Avatar toolbar:

private extension PaymentsView {
    private var avatarToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            AvatarView(dataService: dataService)
        }
    }
}

// MARK: - Preview:

struct PaymentsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PaymentsView(dataService: DataService())
        }
        .environmentObject(DataService())
    }
}
