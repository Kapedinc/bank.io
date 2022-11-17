//
//  IconBackgroundBadgeTitleTextView.swift
//  Bank.io
//

import SwiftUI

struct IconBackgroundBadgeTitleTextView: View {
    
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
    
    /// 'Bool' value indicating whether or not the badge should be shown:
    private var isShowingBadge: Bool
    
    /// Alignment of the badge overlay:
    private var badgeAlignment: Alignment
    
    /// Offset that the badge has on the X-axis:
    private var badgeXAxisOffset: Double
    
    /// Offset that the badge has on the Y-axis:
    private var badgeYAxisOffset: Double
    
    /// Title of the badge:
    private var badgeTitle: String
    
    /// 'Bool' value indicating whether or not the title of the badge should be localized:
    private var isBadgeTitleLocalized: Bool
    
    /// Font of the badge's title:
    private var badgeTitleFont: Font
    
    /// Text case of the title:
    private var badgeTitleTextCase: Text.Case?
    
    /// Alignment of the badge title:
    private var badgeTitleAlignment: TextAlignment
    
    /// Color of the badge's title:
    private var badgeTitleColor: Color
    
    /// Vertical padding of the badge:
    private var badgeVerticalPadding: Double
    
    /// Horizontal padding of the badge:
    private var badgeHorizontalPadding: Double
    
    /// Stroke width of the badge:
    private var badgeStrokeWidth: Double
    
    /// Color of the badge's stroke:
    private var badgeStrokeColor: Color
    
    /// Background color of the badge:
    private var badgeBackgroundColor: Color
    
    /// Corner radius of the badge:
    private var badgeCornerRadius: Double
    
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
    private var alignment: HorizontalAlignment
    
    /// Spacing between the icon and the text content:
    private var spacing: Double
    
    /// Padding around the content:
    private var padding: Double
    
    init(
        icon: String,
        iconSymbolVariant: SymbolVariants = .fill,
        iconFont: Font = .system(size: 80, weight: .bold, design: .default),
        iconColor: Color = .accentColor,
        iconFrame: Double = 120,
        iconPadding: Double = 40,
        iconBackgroundColor: Color = .accentColor.opacity(0.12),
        iconCornerRadius: Double = 48,
        isShowingBadge: Bool = true,
        badgeAlignment: Alignment = .topTrailing,
        badgeXAxisOffset: Double = 24,
        badgeYAxisOffset: Double = 12,
        badgeTitle: String,
        isBadgeTitleLocalized: Bool = true,
        badgeTitleFont: Font = Font.headline.weight(.bold),
        badgeTitleTextCase: Text.Case? = .uppercase,
        badgeTitleAlignment: TextAlignment = .center,
        badgeTitleColor: Color = .white,
        badgeVerticalPadding: Double = 8,
        badgeHorizontalPadding: Double = 12,
        badgeStrokeWidth: Double = 2,
        badgeStrokeColor: Color = Color(.systemBackground),
        badgeBackgroundColor: Color = .accentColor,
        badgeCornerRadius: Double = 14,
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
        titleTextSpacing: Double = 12,
        alignment: HorizontalAlignment = .center,
        spacing: Double = 56,
        padding: Double = 16
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
        self.isShowingBadge = isShowingBadge
        self.badgeAlignment = badgeAlignment
        self.badgeXAxisOffset = badgeXAxisOffset
        self.badgeYAxisOffset = badgeYAxisOffset
        self.badgeTitle = badgeTitle
        self.isBadgeTitleLocalized = isBadgeTitleLocalized
        self.badgeTitleFont = badgeTitleFont
        self.badgeTitleTextCase = badgeTitleTextCase
        self.badgeTitleAlignment = badgeTitleAlignment
        self.badgeTitleColor = badgeTitleColor
        self.badgeVerticalPadding = badgeVerticalPadding
        self.badgeHorizontalPadding = badgeHorizontalPadding
        self.badgeStrokeWidth = badgeStrokeWidth
        self.badgeStrokeColor = badgeStrokeColor
        self.badgeBackgroundColor = badgeBackgroundColor
        self.badgeCornerRadius = badgeCornerRadius
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
        self.spacing = spacing
        self.padding = padding
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the alignment should be changed (When dynamic type's size is too large):
    private var shouldChangeAlignment: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    private var content: some View {
        item
            .padding(padding)
    }
}

// MARK: - Item:

private extension IconBackgroundBadgeTitleTextView {
    private var item: some View {
        VStack(
            alignment: shouldChangeAlignment ? .leading : alignment,
            spacing: spacing
        ) {
            itemContent
        }
    }
    
    @ViewBuilder
    private var itemContent: some View {
        iconContent
        titleText
    }
}

// MARK: - Icon:

private extension IconBackgroundBadgeTitleTextView {
    private var iconContent: some View {
        IconBackgroundBadgeView(
            icon: icon,
            iconSymbolVariant: iconSymbolVariant,
            iconFont: iconFont,
            iconColor: iconColor,
            iconFrame: iconFrame,
            iconPadding: iconPadding,
            iconBackgroundColor: iconBackgroundColor,
            iconCornerRadius: iconCornerRadius,
            isShowingBadge: isShowingBadge,
            badgeAlignment: badgeAlignment,
            badgeXAxisOffset: badgeXAxisOffset,
            badgeYAxisOffset: badgeYAxisOffset,
            badgeTitle: badgeTitle,
            isBadgeTitleLocalized: isBadgeTitleLocalized,
            badgeTitleFont: badgeTitleFont,
            badgeTitleTextCase: badgeTitleTextCase,
            badgeTitleAlignment: badgeTitleAlignment,
            badgeTitleColor: badgeTitleColor,
            badgeVerticalPadding: badgeVerticalPadding,
            badgeHorizontalPadding: badgeHorizontalPadding,
            badgeStrokeWidth: badgeStrokeWidth,
            badgeStrokeColor: badgeStrokeColor,
            badgeBackgroundColor: badgeBackgroundColor,
            badgeCornerRadius: badgeCornerRadius
        )
    }
}

// MARK: - Title & text:

private extension IconBackgroundBadgeTitleTextView {
    private var titleText: some View {
        TitleTextView(
            title: title,
            isTitleLocalized: isTitleLocalized,
            titleFont: titleFont,
            titleTextCase: titleTextCase,
            titleAlignment: shouldChangeAlignment ? .leading : titleAlignment,
            titleColor: titleColor,
            text: text,
            isTextLocalized: isTextLocalized,
            textFont: textFont,
            textTextCase: textTextCase,
            textAlignment: shouldChangeAlignment ? .leading : textAlignment,
            textColor: textColor,
            alignment: shouldChangeAlignment ? .leading : titleTextAlignment,
            spacing: titleTextSpacing
        )
    }
}

// MARK: - Preview:

struct IconBackgroundBadgeTitleTextView_Previews: PreviewProvider {
    static var previews: some View {
        IconBackgroundBadgeTitleTextView(
            icon: Icons.creditCard,
            iconSymbolVariant: .fill,
            iconFont: .system(size: 80, weight: .bold, design: .default),
            iconColor: .accentColor,
            iconFrame: 120,
            iconPadding: 40,
            iconBackgroundColor: .accentColor.opacity(0.12),
            iconCornerRadius: 48,
            isShowingBadge: true,
            badgeAlignment: .topTrailing,
            badgeXAxisOffset: 24,
            badgeYAxisOffset: 12,
            badgeTitle: "Title",
            isBadgeTitleLocalized: true,
            badgeTitleFont: Font.headline.weight(.bold),
            badgeTitleTextCase: .uppercase,
            badgeTitleAlignment: .center,
            badgeTitleColor: .white,
            badgeVerticalPadding: 8,
            badgeHorizontalPadding: 12,
            badgeStrokeWidth: 2,
            badgeStrokeColor: Color(.systemBackground),
            badgeBackgroundColor: .accentColor,
            badgeCornerRadius: 14,
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
            alignment: .center,
            spacing: 56,
            padding: 16
        )
    }
}
