//
//  OnboardingView.swift
//  Bank.io
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Private properties:
    
    /// Manager responsible for navigation within the app:
    @EnvironmentObject private var navigationManager: NavigationManager
    
    /// Service that handles the data throughout the app:
    @EnvironmentObject private var dataService: DataService
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(
        navigationManager: NavigationManager,
        dataService: DataService
    ) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(
            navigationManager: navigationManager,
            dataService: dataService
        )
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .background(Color(.systemBackground).ignoresSafeArea())
            .sheet(
                isPresented: $viewModel.isSignUpPresented,
                content: signUp
            )
            .onChange(of: viewModel.current) { _ in
                HapticFeedbacks.selectionChanges()
            }
            .onChange(
                of: dataService.currentUser,
                perform: viewModel.currentUserOnChange
            )
            .animation(
                .default,
                value: viewModel.current
            )
    }
}

// MARK: - Item:

private extension OnboardingView {
    private var item: some View {
        VStack(
            alignment: .leading,
            spacing: 0
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        Spacer()
        sections
        Spacer()
        toolbar
    }
}

// MARK: - Sections:

private extension OnboardingView {
    private var sections: some View {
        sectionsContent
            .tabViewStyle(.page(indexDisplayMode: .never))
    }
    
    private var sectionsContent: some View {
        TabView(selection: $viewModel.current) {
            sectionsItem
        }
    }
    
    private var sectionsItem: some View {
        ForEach(
            IO_OnboardingSection.allCases,
            content: section
        )
    }
    
    private func section(_ section: IO_OnboardingSection) -> some View {
        OnboardingSectionView(section: section)
            .tag(section)
    }
}

// MARK: - Toolbar:

private extension OnboardingView {
    private var toolbar: some View {
        BottomToolbarView {
            toolbarContent
        }
    }
    
    @ViewBuilder
    private var toolbarContent: some View {
        pagination
        nextButton
        demoModeButton
    }
    
    private var pagination: some View {
        PaginationView(
            current: $viewModel.current,
            all: IO_OnboardingSection.allCases
        )
    }
    
    private var nextButton: some View {
        ButtonView(
            title: viewModel.nextButtonTitle,
            action: viewModel.next
        )
    }
    
    private var demoModeButton: some View {
        ButtonView(
            title: "Demo Mode",
            color: .accentColor,
            verticalPadding: 0,
            horizontalPadding: 0,
            backgroundColor: .clear,
            cornerRadius: 0,
            action: viewModel.showDemoMode
        )
    }
}

// MARK: - Sign up:

private extension OnboardingView {
    private func signUp() -> some View {
        SignUpView(dataService: dataService)
            .environmentObject(dataService)
    }
}

// MARK: - Preview:

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView(
            navigationManager: NavigationManager(),
            dataService: DataService()
        )
        .environmentObject(NavigationManager())
        .environmentObject(DataService())
    }
}
