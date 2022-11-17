//
//  CardsView.swift
//  Bank.io
//

import SwiftUI

struct CardsView: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// Service that handles the throughout the app:
    @EnvironmentObject private var dataService: DataService
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(dataService: DataService) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(dataService: dataService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Height of the cards view based on the dynamic type size:
    private var cardsHeight: Double {
        dynamicTypeSize >= .accessibility1 ? 680 : 200
    }
    
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
                noCards
            }
            .navigationTitle("Cards")
            .toolbar {
                avatarToolbar
            }
            .onChange(
                of: viewModel.currentCard,
                perform: viewModel.currentCardOnChange
            )
            .animation(
                .default,
                value: viewState
            )
            .animation(
                .default,
                value: viewModel.currentCard
            )
            .refreshable {
                await viewModel.fetchCards()
            }
            .task {
                await viewModel.fetchCards()
            }
    }
}

// MARK: - Loading:

private extension CardsView {
    private var loading: some View {
        LoadingView(
            isShowing: viewState == .loading,
            title: "Loading...",
            color: .secondary
        )
    }
}

// MARK: - No transactions:

private extension CardsView {
    private var noCards: some View {
        EmptyStateView(
            isShowing: viewState == .empty,
            title: "No Cards",
            text: "You don't have any cards."
        )
    }
}

// MARK: - List:

private extension CardsView {
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
        section
        CardSettingsView()
    }
}

// MARK: - Section:

private extension CardsView {
    private var section: some View {
        sectionContent
            .listRowInsets(.zero)
            .listRowBackground(Color.clear)
    }
    
    private var sectionContent: some View {
        VStack(
            alignment: .center,
            spacing: 16
        ) {
            sectionItem
        }
    }
    
    @ViewBuilder
    private var sectionItem: some View {
        tabView
        pagination
    }
}

// MARK: - Tab view:

private extension CardsView {
    private var tabView: some View {
        tabViewContent
            .tabViewStyle(.page(indexDisplayMode: .never))
            .frame(height: cardsHeight)
    }
    
    private var tabViewContent: some View {
        TabView(selection: $viewModel.currentCard) {
            cards
        }
    }
}

// MARK: - Cards:

private extension CardsView {
    private var cards: some View {
        ForEach(
            viewModel.cards,
            content: card
        )
    }
    
    private func card(_ card: IO_Card) -> some View {
        CardView(card: card)
            .tag(card as IO_Card?)
    }
}

// MARK: - Pagination:

private extension CardsView {
    @ViewBuilder
    private var pagination: some View {
        if viewModel.isShowingPagination {
            paginationContent
        }
    }
    
    private var paginationContent: some View {
        PaginationView(
            current: $viewModel.currentCard,
            all: viewModel.cards
        )
    }
}

// MARK: - Avatar toolbar:

private extension CardsView {
    private var avatarToolbar: some ToolbarContent {
        ToolbarItem(placement: .navigationBarTrailing) {
            AvatarView(dataService: dataService)
        }
    }
}

// MARK: - Preview:

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardsView(dataService: DataService())
    }
}
