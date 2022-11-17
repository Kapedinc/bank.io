//
//  DashboardView.swift
//  Bank.io
//

import SwiftUI

struct DashboardView: View {
    
    // MARK: - Private properties:
    
    /// Service used to handle the data within the app:
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
                noAccounts
            }
            .navigationTitle("Dashboard")
            .toolbar {
                toolbarContent
            }
            .sheet(
                item: $viewModel.currentSheet,
                content: showSheet
            )
            .animation(
                .default,
                value: viewState
            )
            .refreshable {
                await viewModel.fetchData()
            }
            .task {
                await viewModel.fetchData()
            }
    }
}

// MARK: - Loading:

private extension DashboardView {
    private var loading: some View {
        LoadingView(
            isShowing: viewState == .loading,
            title: "Loading...",
            color: .secondary
        )
    }
}

// MARK: - No accounts:

private extension DashboardView {
    private var noAccounts: some View {
        EmptyStateView(
            isShowing: viewState == .empty,
            title: "No Accounts",
            text: "You don't have any accounts."
        )
    }
}

// MARK: - List:

private extension DashboardView {
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
        MessageView(message: .dashboard)
        AccountsView(dataService: dataService)
        SummaryView(dataService: dataService)
        RecentTransactionsView(dataService: dataService)
    }
}

// MARK: - Toolbar:

private extension DashboardView {
    @ToolbarContentBuilder
    private var toolbarContent: some ToolbarContent {
        settingsToolbar
        avatarToolbar
    }
}

// MARK: - Settings toolbar:

private extension DashboardView {
    private var settingsToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            settingsButton
        }
    }
    
    private var settingsButton: some View {
        ButtonView(
            title: "Settings",
            icon: Icons.gearShape,
            iconSymbolVariant: .none,
            font: .body,
            color: .accentColor,
            style: .iconOnly,
            verticalPadding: 0,
            horizontalPadding: 0,
            isFullWidth: false,
            backgroundColor: .clear,
            cornerRadius: 0,
            action: viewModel.showSettings
        )
    }
}

// MARK: - Avatar toolbar:

private extension DashboardView {
    private var avatarToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            AvatarView(dataService: dataService)
        }
    }
}

// MARK: - Sheets:

private extension DashboardView {
    @ViewBuilder
    private func showSheet(_ currentSheet: IO_DashboardSheet) -> some View {
        switch currentSheet {
        case .settings: SettingsView()
        }
    }
}

// MARK: - Preview:

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            DashboardView(dataService: DataService())
        }
        .environmentObject(DataService())
    }
}
