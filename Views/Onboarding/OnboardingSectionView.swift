//
//  OnboardingSectionView.swift
//  Bank.io
//

import SwiftUI

struct OnboardingSectionView: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(section: IO_OnboardingSection) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(section: section)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the scroll should be added (When dynamic type's size is too large):
    private var shouldAddScroll: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    /// Color of the section:
    private var color: Color {
        Color(viewModel.color)
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if shouldAddScroll {
            scrollItem
        } else {
            item
        }
    }
}

// MARK: - Item:

private extension OnboardingSectionView {
    private var scrollItem: some View {
        ScrollView(showsIndicators: false) {
            item
        }
    }
    
    private var item: some View {
        IconBackgroundBadgeTitleTextView(
            icon: viewModel.icon,
            iconColor: color,
            iconBackgroundColor: color.opacity(0.12),
            badgeTitle: viewModel.badgeTitle,
            badgeBackgroundColor: color,
            title: viewModel.title,
            text: viewModel.text,
            titleTextSpacing: 16
        )
    }
}

// MARK: - Preview:

struct OnboardingSectionView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingSectionView(section: .first)
    }
}
