//
//  IconBackgroundBadgeView.swift
//  Bank.io
//

import SwiftUI

struct IconBackgroundBadgeView: View {
    
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
    
    init(
        icon: String,
        iconSymbolVariant: SymbolVariants = .fill,
        iconFont: Font = .system(size: 80, weight: .bold, design: .default),
        iconColor: Color = .accentColor,
        iconFrame: Double = 120,
        iconPadding: Double = 40,
        iconBackgroundColor: Color = .accentColor.opacity(0.12),
        iconCornerRadius: Double = 48,
        isShowingBadge: Bool = false,
        badgeAlignment: Alignment = .topTrailing,
        badgeXAxisOffset: Double = 24,
        badgeYAxisOffset: Double = 12,
        badgeTitle: String = "",
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
        badgeCornerRadius: Double = 14
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
    }
    
    // MARK: - Private computed properties:
    
    /// 'Bool' value indicating whether or not the badge should be moved (When dynamic type's size is too large):
    private var shouldMoveBadge: Bool {
        dynamicTypeSize >= .accessibility1
    }
    
    // MARK: - View:
    
    var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if shouldMoveBadge {
            verticalItem
        } else {
            overlayItem
        }
    }
}

// MARK: - Item:

private extension IconBackgroundBadgeView {
    private var verticalItem: some View {
        VStack(
            alignment: .leading,
            spacing: 32
        ) {
            verticalItemContent
        }
    }
    
    @ViewBuilder
    private var verticalItemContent: some View {
        iconContent
        badge
    }
    
    private var overlayItem: some View {
        iconContent
            .overlay(alignment: badgeAlignment) {
                badge
            }
    }
}

// MARK: - Badge:

private extension IconBackgroundBadgeView {
    @ViewBuilder
    private var badge: some View {
        if isShowingBadge {
            badgeContent
        }
    }
    
    private var badgeContent: some View {
        badgeItem
            .offset(
                x: shouldMoveBadge ? 0 : badgeXAxisOffset,
                y: shouldMoveBadge ? 0 : badgeYAxisOffset
            )
    }
    
    private var badgeItem: some View {
        BadgeView(
            title: badgeTitle,
            isTitleLocalized: isBadgeTitleLocalized,
            titleFont: badgeTitleFont,
            titleTextCase: badgeTitleTextCase,
            titleAlignment: badgeTitleAlignment,
            titleColor: badgeTitleColor,
            verticalPadding: badgeVerticalPadding,
            horizontalPadding: badgeHorizontalPadding,
            strokeWidth: badgeStrokeWidth,
            strokeColor: badgeStrokeColor,
            backgroundColor: badgeBackgroundColor,
            cornerRadius: badgeCornerRadius
        )
    }
}

// MARK: - Icon:

private extension IconBackgroundBadgeView {
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

// MARK: - Preview:

struct IconBackgroundBadgeView_Previews: PreviewProvider {
    static var previews: some View {
        IconBackgroundBadgeView(
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
            badgeCornerRadius: 14
        )
    }
}
