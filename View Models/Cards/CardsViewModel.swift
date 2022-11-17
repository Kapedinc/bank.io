//
//  CardsViewModel.swift
//  Bank.io
//

import Foundation

extension CardsView {
    final class ViewModel: ObservableObject {
        
        // MARK: - Properties:
        
        /// State that the view is in:
        @Published var viewState: IO_ViewState = .defaultState
        
        /// Card that is shown currently:
        @Published var currentCard: IO_Card? = nil
        
        // MARK: - Private properties:
        
        /// Service that handles the data throughout the app:
        private let dataService: DataService
        
        init(dataService: DataService) {
            
            /// Properties initialization:
            self.dataService = dataService
        }
        
        // MARK: - Computed properties:
        
        /// Cards belonging to the current user:
        var cards: [IO_Card] {
            dataService.cards
        }
        
        /// 'Bool' value indicating whether or not the pagination should be shown:
        var isShowingPagination: Bool {
            cards.count > 1
        }
        
        // MARK: - Functions:
        
        /// Fetches the cards:
        func fetchCards() async {
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Setting the view state to '.loading':
                updateViewState(withState: .loading)
            }
            
            /// Making sure we have the current user:
            if let currentUser: IO_User = dataService.currentUser {
                
                /// Fetching the cards belonging to the current user:
                try? await dataService.fetchCards(forUser: currentUser)
            }
            
            /// Updating the UI on the main thread:
            await MainActor.run {
                
                /// Assigning the current card:
                currentCard = cards.first
                
                /// Setting the view state to either '.loaded' or '.empty' based on the cards array:
                updateViewState(withState: cards.isEmpty ? .empty : .loaded)
            }
        }
        
        /// Gets called whenever the current card changes:
        func currentCardOnChange(_ currentCard: IO_Card?) {
            
            /// Triggering the selection changes haptic feedback:
            HapticFeedbacks.selectionChanges()
        }
        
        // MARK: - Private functions:
        
        /// Updates the view state based on the state provided:
        private func updateViewState(withState state: IO_ViewState) {
            
            /// Updating the view state:
            self.viewState = state
        }
    }
}
