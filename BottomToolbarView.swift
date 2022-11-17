//
//  BottomToolbarView.swift
//  Bank.io
//

import SwiftUI

struct BottomToolbarView<ToolbarContent: View>: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// Alignment of the toolbar's content:
    private var alignment: HorizontalAlignment
    
    /// Spacing between the content of the toolbar:
    private var spacing: Double
    
    /// Padding around the content:
    private var padding: Double
    
    /// 'Bool' value indicating whether or not the divider should be shown:
    private var isDividerShowing: Bool
    
    /// Color of the toolbar's background:
    private var backgroundColor: Color
    
    /// Content of the toolbar:
    private var toolbarContent: ToolbarContent
    
    init(
        alignment: HorizontalAlignment = .center,
        spacing: Double = 24,
        padding: Double = 16,
        isDividerShowing: Bool = false,
        backgroundColor: Color = Color(.systemBackground),
        @ViewBuilder
        toolbarContent: @escaping () -> ToolbarContent
    ) {
        
        /// Properties initialization:
        self.alignment = alignment
        self.spacing = spacing
        self.padding = padding
        self.isDividerShowing = isDividerShowing
        self.backgroundColor = backgroundColor
        self.toolbarContent = toolbarContent()
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the scroll should be added (When dynamic type's size is too large):
    private var shouldAddScroll: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .frame(
                maxWidth: .infinity,
                maxHeight: shouldAddScroll ? 248 : nil
            )
            .background(backgroundColor)
    }
}

// MARK: - Item:

private extension BottomToolbarView {
    private var item: some View {
        VStack(
            alignment: alignment,
            spacing: 0
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        divider
        toolbar
    }
}

// MARK: - Divider:

private extension BottomToolbarView {
    @ViewBuilder
    private var divider: some View {
        if isDividerShowing {
            Divider()
        }
    }
}

// MARK: - Toolbar:

private extension BottomToolbarView {
    @ViewBuilder
    private var toolbar: some View {
        if shouldAddScroll {
            toolbarScroll
        } else {
            toolbarItem
        }
    }
    
    private var toolbarScroll: some View {
        ScrollView(showsIndicators: false) {
            toolbarItem
        }
    }
    
    private var toolbarItem: some View {
        toolbarItemContent
            .padding(padding)
    }
    
    private var toolbarItemContent: some View {
        VStack(
            alignment: alignment,
            spacing: spacing
        ) {
            toolbarContent
        }
    }
}

// MARK: - Preview:

struct BottomToolbarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolbarView(
            alignment: .center,
            spacing: 24,
            padding: 16,
            isDividerShowing: false,
            backgroundColor: Color(.systemBackground)
        ) {
            Text("Toolbar Content")
                .foregroundColor(.secondary)
        }
    }
}
