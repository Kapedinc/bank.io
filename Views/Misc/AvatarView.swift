//
//  AvatarView.swift
//  Bank.io
//

import SwiftUI

struct AvatarView: View {
    
    // MARK: - Private properties:
    
    /// Model of this view:
    @StateObject private var viewModel: ViewModel
    
    init(dataService: DataService) {
        
        /// Properties initialization:
        let viewModel: ViewModel = ViewModel(dataService: dataService)
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    // MARK: - Private computed properties:
    
    /// Frame of the view:
    private var frame: Double {
        36
    }
    
    /// Frame of the indicator:
    private var indicatorFrame: Double {
        10
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        Text(viewModel.initials)
            .font(Font.subheadline.weight(.bold))
            .foregroundColor(.white)
            .frame(
                width: frame,
                height: frame
            )
            .background(Color.accentColor)
            .clipShape(Circle())
            .overlay(alignment: .topTrailing) {
                indicator
            }
    }
}

// MARK: - Indicator:

private extension AvatarView {
    @ViewBuilder
    private var indicator: some View {
        if viewModel.isShowingIndicator {
            indicatorContent
        }
    }
    
    private var indicatorContent: some View {
        Circle()
            .fill(Color.accentColor)
            .frame(
                width: indicatorFrame,
                height: indicatorFrame
            )
            .overlay {
                indicatorStroke
            }
    }
    
    private var indicatorStroke: some View {
        Circle()
            .stroke(
                Color(.systemGroupedBackground),
                lineWidth: 2
            )
            .frame(
                width: indicatorFrame,
                height: indicatorFrame
            )
    }
}

// MARK: - Preview:

struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(dataService: DataService())
    }
}
