//
//  TabBarView.swift
//  Bank.io
//

import SwiftUI

struct TabBarView: View {
    
    // MARK: -  Private properties:
    
    /// Service responsible for fetching user's data:
    @EnvironmentObject private var dataService: DataService
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init() {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel()
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .onChange(
                of: viewModel.currentTab,
                perform: viewModel.currentTabOnChange
            )
    }
}

// MARK: - Item:

private extension TabBarView {
    private var item: some View {
        TabView(selection: $viewModel.currentTab) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        dashboard
        payments
        cards
    }
}

// MARK: - Dashboard:

private extension TabBarView {
    private var dashboard: some View {
        DashboardView(dataService: dataService)
            .tabItem {
                dashboardLabel
            }
            .tag(IO_Tab.dashboard)
    }
    
    private var dashboardLabel: some View {
        Label(
            "Dashboard",
            systemImage: Icons.dashboard
        )
    }
}

// MARK: - Payments:

private extension TabBarView {
    private var payments: some View {
        PaymentsView(dataService: dataService)
            .tabItem {
                paymentsLabel
            }
            .tag(IO_Tab.payments)
    }
    
    private var paymentsLabel: some View {
        Label(
            "Payments",
            systemImage: Icons.arrowLeftArrowRight
        )
    }
}

// MARK: - Cards:

private extension TabBarView {
    private var cards: some View {
        CardsView(dataService: dataService)
            .tabItem {
                cardsLabel
            }
            .tag(IO_Tab.cards)
    }
    
    private var cardsLabel: some View {
        Label(
            "Cards",
            systemImage: Icons.creditCard
        )
    }
}

// MARK: - Preview:

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .environmentObject(DataService())
    }
}
