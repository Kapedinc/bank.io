//
//  IconBackgroundTitleTextContentView.swift
//  Bank.io
//

import SwiftUI

struct IconBackgroundTitleTextContentView<Content: View>: View {
    
    // MARK: - Private properties:
    
    /// Size of the dynamic type selected by the user:
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    
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
    
    /// Any additional content to display (Buttons, text, etc.):
    private var contentToDisplay: Content
    
    init(
        icon: String,
        iconSymbolVariant: SymbolVariants = .fill,
        iconFont: Font = .system(size: 20, weight: .semibold, design: .default),
        iconColor: Color = .accentColor,
        iconFrame: Double = 24,
        iconPadding: Double = 12,
        iconBackgroundColor: Color = .accentColor.opacity(0.12),
        iconCornerRadius: Double = 12,
        title: String,
        isTitleLocalized: Bool = true,
        titleFont: Font = .headline,
        titleTextCase: Text.Case? = .none,
        titleAlignment: TextAlignment = .leading,
        titleColor: Color = .primary,
        text: String,
        isTextLocalized: Bool = true,
        textFont: Font = .subheadline,
        textTextCase: Text.Case? = .none,
        textAlignment: TextAlignment = .leading,
        textColor: Color = .secondary,
        titleTextAlignment: HorizontalAlignment = .leading,
        titleTextSpacing: Double = 6,
        alignment: IO_Alignment = .horizontal,
        verticalAlignment: VerticalAlignment = .top,
        horizontalAlignment: HorizontalAlignment = .center,
        spacing: Double = 16,
        verticalPadding: Double = 16,
        horizontalPadding: Double = 16,
        @ViewBuilder
        contentToDisplay: @escaping () -> Content
    ) {
        
        /// Properties initialization:
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
        self.contentToDisplay = contentToDisplay()
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
    
    private var content: some View {
        mainContent
            .padding(
                .vertical,
                verticalPadding
            )
            .padding(
                .horizontal,
                horizontalPadding
            )
    }
    
    @ViewBuilder
    private var mainContent: some View {
        if shouldMoveContent {
            verticalItem
        } else {
            item
        }
    }
}

// MARK: - Item:

private extension IconBackgroundTitleTextContentView {
    @ViewBuilder
    private var item: some View {
        switch alignment {
        case .horizontal: horizontalItem
        case .vertical: verticalItem
        }
    }
    
    private var horizontalItem: some View {
        HStack(
            alignment: verticalAlignment,
            spacing: spacing
        ) {
            itemContent
        }
    }
    
    private var verticalItem: some View {
        VStack(
            alignment: shouldMoveContent ? .leading : horizontalAlignment,
            spacing: spacing
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        iconContent
        titleText
        itemSpacer
        contentToDisplay
    }
    
    @ViewBuilder
    private var itemSpacer: some View {
        if !shouldMoveContent {
            Spacer(minLength: 0)
        }
    }
}

// MARK: - Icon:

private extension IconBackgroundTitleTextContentView {
    private var iconContent: some View {
        IconBackgroundView(
            icon: icon,
            symbolVariant: iconSymbolVariant,
            font: iconFont,
            color: iconColor,
            frame: iconFrame,
            padding: iconPadding,
            backgroundColor: iconBackgroundColor,
            cornerRadius: iconCornerRadius
        )
    }
}

// MARK: - Title & text:

private extension IconBackgroundTitleTextContentView {
    private var titleText: some View {
        TitleTextView(
            title: title,
            isTitleLocalized: isTitleLocalized,
            titleFont: titleFont,
            titleTextCase: titleTextCase,
            titleAlignment: titleAlignment,
            titleColor: titleColor,
            text: text,
            isTextLocalized: isTextLocalized,
            textFont: textFont,
            textTextCase: textTextCase,
            textAlignment: textAlignment,
            textColor: textColor,
            alignment: titleTextAlignment,
            spacing: titleTextSpacing
        )
    }
}

// MARK: - Preview:

struct IconBackgroundTitleTextContentView_Previews: PreviewProvider {
    static var previews: some View {
        IconBackgroundTitleTextContentView(
            icon: Icons.creditCard,
            iconSymbolVariant: .fill,
            iconFont: .system(size: 20, weight: .semibold, design: .default),
            iconColor: .accentColor,
            iconFrame: 24,
            iconPadding: 12,
            iconBackgroundColor: .accentColor.opacity(0.12),
            iconCornerRadius: 12,
            title: "Title",
            isTitleLocalized: true,
            titleFont: .headline,
            titleTextCase: .none,
            titleAlignment: .leading,
            titleColor: .primary,
            text: "Text",
            isTextLocalized: true,
            textFont: .subheadline,
            textTextCase: .none,
            textAlignment: .leading,
            textColor: .secondary,
            titleTextAlignment: .leading,
            titleTextSpacing: 6,
            alignment: .horizontal,
            verticalAlignment: .top,
            horizontalAlignment: .center,
            spacing: 16,
            verticalPadding: 16,
            horizontalPadding: 16
        ) {
            ButtonView(
                title: "Dismiss",
                icon: Icons.xMark,
                font: Font.subheadline.bold(),
                color: .secondary,
                style: .iconOnly,
                verticalPadding: 0,
                horizontalPadding: 0,
                isFullWidth: false,
                backgroundColor: .clear,
                cornerRadius: 0
            ) {
                
            }
        }
    }
}
