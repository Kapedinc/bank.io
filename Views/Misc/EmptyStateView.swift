//
//  EmptyStateView.swift
//  Bank.io
//

import SwiftUI

struct EmptyStateView: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
    /// 'Bool' value indicating whether or not the empty view should be shown:
    private var isShowing: Bool
    
    /// Icon to display:
    private var icon: String
    
    /// Symbol variant of the icon ('.fill', etc.):
    private var iconSymbolVariant: SymbolVariants
    
    /// Font of the icon:
    private var iconFont: Font
    
    /// Color of the icon:
    private var iconColor: Color
    
    /// Frame of the icon:
    private var iconFrame: Double
    
    /// Padding around the icon:
    private var iconPadding: Double
    
    /// Color of the icon's background:
    private var iconBackgroundColor: Color
    
    /// Corner radius of the icon's background:
    private var iconCornerRadius: Double
    
    /// Title of display:
    private var title: String
    
    /// 'Bool' value indicating whether or not the title should be localized:
    private var isTitleLocalized: Bool
    
    /// Font of the title:
    private var titleFont: Font
    
    /// Text case of the title:
    private var titleTextCase: Text.Case?
    
    /// Alignment of the title:
    private var titleAlignment: TextAlignment
    
    /// Color of the title:
    private var titleColor: Color
    
    /// Text of display:
    private var text: String
    
    /// 'Bool' value indicating whether or not the text should be localized:
    private var isTextLocalized: Bool
    
    /// Font of the text:
    private var textFont: Font
    
    /// Text case of the text:
    private var textTextCase: Text.Case?
    
    /// Alignment of the text:
    private var textAlignment: TextAlignment
    
    /// Color of the text:
    private var textColor: Color
    
    /// Alignment of the title and the text:
    private var titleTextAlignment: HorizontalAlignment
    
    /// Spacing between the title and the text:
    private var titleTextSpacing: Double
    
    /// Alignment of the view:
    private var alignment: IO_Alignment
    
    /// Vertical alignment of the view:
    private var verticalAlignment: VerticalAlignment
    
    /// Horizontal alignment of the view:
    private var horizontalAlignment: HorizontalAlignment
    
    /// Spacing between the icon and the text content:
    private var spacing: Double
    
    /// Vertical padding around the content:
    private var verticalPadding: Double
    
    /// Horizontal padding around the content:
    private var horizontalPadding: Double
    
    init(
        isShowing: Bool = false,
        icon: String = Icons.tray,
        iconSymbolVariant: SymbolVariants = .fill,
        iconFont: Font = .system(size: 34, weight: .semibold, design: .default),
        iconColor: Color = .accentColor,
        iconFrame: Double = 40,
        iconPadding: Double = 16,
        iconBackgroundColor: Color = .accentColor.opacity(0.12),
        iconCornerRadius: Double = 16,
        title: String,
        isTitleLocalized: Bool = true,
        titleFont: Font = Font.title2.bold(),
        titleTextCase: Text.Case? = .none,
        titleAlignment: TextAlignment = .center,
        titleColor: Color = .primary,
        text: String,
        isTextLocalized: Bool = true,
        textFont: Font = .body,
        textTextCase: Text.Case? = .none,
        textAlignment: TextAlignment = .center,
        textColor: Color = .secondary,
        titleTextAlignment: HorizontalAlignment = .center,
        titleTextSpacing: Double = 16,
        alignment: IO_Alignment = .vertical,
        verticalAlignment: VerticalAlignment = .top,
        horizontalAlignment: HorizontalAlignment = .center,
        spacing: Double = 32,
        verticalPadding: Double = 16,
        horizontalPadding: Double = 16
    ) {
        
        /// Properties initialization:
        self.isShowing = isShowing
        self.icon = icon
        self.iconSymbolVariant = iconSymbolVariant
        self.iconFont = iconFont
        self.iconColor = iconColor
        self.iconFrame = iconFrame
        self.iconPadding = iconPadding
        self.iconBackgroundColor = iconBackgroundColor
        self.iconCornerRadius = iconCornerRadius
        self.title = title
        self.isTitleLocalized = isTitleLocalized
        self.titleFont = titleFont
        self.titleTextCase = titleTextCase
        self.titleAlignment = titleAlignment
        self.titleColor = titleColor
        self.text = text
        self.isTextLocalized = isTextLocalized
        self.textFont = textFont
        self.textTextCase = textTextCase
        self.textAlignment = textAlignment
        self.textColor = textColor
        self.titleTextAlignment = titleTextAlignment
        self.titleTextSpacing = titleTextSpacing
        self.alignment = alignment
        self.verticalAlignment = verticalAlignment
        self.horizontalAlignment = horizontalAlignment
        self.spacing = spacing
        self.verticalPadding = verticalPadding
        self.horizontalPadding = horizontalPadding
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the content should be moved (When dynamic type's size is too large):
    private var shouldMoveContent: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if isShowing {
            mainContent
        }
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if shouldMoveContent {
            scrollItem
        } else {
            item
        }
    }
}

// MARK: - Item:

private extension EmptyStateView {
    private var scrollItem: some View {
        ScrollView(showsIndicators: false) {
            item
        }
    }
    
    private var item: some View {
        IconBackgroundTitleTextView(
            icon: icon,
            iconSymbolVariant: iconSymbolVariant,
            iconFont: iconFont,
            iconColor: iconColor,
            iconFrame: iconFrame,
            iconPadding: iconPadding,
            iconBackgroundColor: iconBackgroundColor,
            iconCornerRadius: iconCornerRadius,
            title: title,
            isTitleLocalized: isTitleLocalized,
            titleFont: titleFont,
            titleTextCase: titleTextCase,
            titleAlignment: shouldMoveContent ? .leading : titleAlignment,
            titleColor: titleColor,
            text: text,
            isTextLocalized: isTextLocalized,
            textFont: textFont,
            textTextCase: textTextCase,
            textAlignment: shouldMoveContent ? .leading : textAlignment,
            textColor: textColor,
            titleTextAlignment: shouldMoveContent ? .leading : titleTextAlignment,
            titleTextSpacing: titleTextSpacing,
            alignment: shouldMoveContent ? .vertical : alignment,
            verticalAlignment: verticalAlignment,
            horizontalAlignment: shouldMoveContent ? .leading : horizontalAlignment,
            spacing: spacing,
            verticalPadding: verticalPadding,
            horizontalPadding: horizontalPadding
        )
    }
}

// MARK: - Preview:

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView(
            isShowing: true,
            icon: Icons.creditCard,
            iconSymbolVariant: .fill,
            iconFont: .system(size: 34, weight: .semibold, design: .default),
            iconColor: .accentColor,
            iconFrame: 40,
            iconPadding: 16,
            iconBackgroundColor: .accentColor.opacity(0.12),
            iconCornerRadius: 16,
            title: "Title",
            isTitleLocalized: true,
            titleFont: Font.title2.bold(),
            titleTextCase: .none,
            titleAlignment: .center,
            titleColor: .primary,
            text: "Text",
            isTextLocalized: true,
            textFont: .body,
            textTextCase: .none,
            textAlignment: .center,
            textColor: .secondary,
            titleTextAlignment: .center,
            titleTextSpacing: 12,
            alignment: .vertical,
            verticalAlignment: .top,
            horizontalAlignment: .center,
            spacing: 32,
            verticalPadding: 16,
            horizontalPadding: 16
        )
    }
}
