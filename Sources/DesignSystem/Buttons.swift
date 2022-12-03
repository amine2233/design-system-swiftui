//
//  Buttons.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

// MARK: - Custom Button Styles

struct DesignSystemButtonStyle: ButtonStyle {
    private var style: DesignSystem.Style
    private var design: DesignSystem.ContentMode

    init(style: DesignSystem.Style, design: DesignSystem.ContentMode) {
        self.style = style
        self.design = design
    }

    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch design {
            case .fill: return AnyView(FillButton(style: style, configuration: configuration))
            case .outline: return AnyView(OutlineButton(style: style, configuration: configuration))
            case .ghost: return AnyView(GhostButton(style: style, configuration: configuration))
        }
    }
    
    private struct FillButton: View {
        var style: DesignSystem.Style
        let configuration: ButtonStyle.Configuration

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: ColorTheme

        var body: some View {
            configuration.label
                .designSystemTypography(.s1)
                .foregroundColor(isEnabled ? .white : colorTheme.fontDisabled)
                .padding()
                .frame(minHeight: 44)
                .background(isEnabled ? style.color(colorTheme) : colorTheme.basic.opacity(0.2))
                .cornerRadius(4)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
    
    private struct OutlineButton: View {
        var style: DesignSystem.Style
        let configuration: ButtonStyle.Configuration

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: ColorTheme

        var body: some View {
            configuration.label
                .designSystemTypography(.s1)
                .foregroundColor(isEnabled ? style.color(colorTheme) : colorTheme.fontDisabled)
                .padding()
                .frame(minHeight: 44)
                .background(isEnabled ? style.color(colorTheme).opacity(0.2) : colorTheme.basic.opacity(0.15))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isEnabled ? style.color(colorTheme) : colorTheme.basic.opacity(0.5), lineWidth: 1)
                )
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
    
    private struct GhostButton: View {
        var style: DesignSystem.Style
        let configuration: ButtonStyle.Configuration

        @Environment(\.isEnabled) private var isEnabled: Bool
        @Environment(\.colorTheme) private var colorTheme: ColorTheme

        var body: some View {
            configuration.label
                .designSystemTypography(.s1)
                .foregroundColor(isEnabled ? style.color(colorTheme) : colorTheme.fontDisabled)
                .padding()
                .frame(minHeight: 44)
                .background(Color.white)
                .cornerRadius(4)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

// MARK: - Usage

extension Button {
    /// Changes the appearance of the button
    public func designSystem(
        _ style: DesignSystem.Style,
        design: DesignSystem.ContentMode
    ) -> some View {
        self.buttonStyle(DesignSystemButtonStyle(style: style, design: design))
    }
}

public struct DesignSystemButton: View {
    @Environment(\.isEnabled) private var isEnabled: Bool
    
    var titleKey: LocalizedStringKey?
    var image: Image?
    var design: DesignSystem.ContentMode = .fill
    var style: DesignSystem.Style = .primary
    var action: () -> Void
    var textAndImage: Bool { titleKey != nil && image != nil }
    
    public init(
        _ titleKey: LocalizedStringKey?,
        image: Image? = nil,
        style: DesignSystem.Style = .primary,
        design: DesignSystem.ContentMode = .fill,
        action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.image = image
        self.design = design
        self.style = style
        self.action = action
    }
    
    public init(
        _ text: String?,
        image: Image? = nil,
        style: DesignSystem.Style = .primary,
        design: DesignSystem.ContentMode = .fill,
        action: @escaping () -> Void
    ) {
        self.titleKey = LocalizedStringKey(text ?? "")
        self.image = image
        self.design = design
        self.style = style
        self.action = action
    }
    
    public init(
        image: Image? = nil,
        style: DesignSystem.Style = .primary,
        design: DesignSystem.ContentMode = .fill,
        action: @escaping () -> Void
    ) {
        self.image = image
        self.style = style
        self.design = design
        self.action = action
    }
    
    public var body: some View {
        Button(action: action, label: {
            HStack() {
                Spacer()
                HStack(spacing: textAndImage ? 12 : 0) {
                    Text(titleKey ?? LocalizedStringKey(""))
                    image
                }
                Spacer()
            }
        })
        .designSystem(style, design: design)
    }
}


// MARK: - Preview

public struct DesignSystemInput_Previews: PreviewProvider {
    static let cloudImg = Image(systemName: "cloud.sun")
    
    public static var previews: some View {
        VStack(spacing: 40) {
            
            HStack(spacing: 5) {
                DesignSystemButton("Fill", design: .fill, action: { print("click") })
                DesignSystemButton("Outline", design: .outline, action: { print("click") })
                DesignSystemButton("Ghost", design: .ghost, action: { print("click") })
            }
            
            HStack(spacing: 5) {
                DesignSystemButton("Danger", style: .danger, action: { print("click") })
                DesignSystemButton("Warning", style: .warning, action: { print("click") })
                DesignSystemButton("Success", style: .success, action: { print("click") })
            }
            
            HStack(spacing: 5) {
                DesignSystemButton("Disabled", design: .fill, action: { print("click") })
                    .disabled(true)
                DesignSystemButton("Disabled", design: .outline, action: { print("click") })
                    .disabled(true)
                DesignSystemButton("Disabled", design: .ghost, action: { print("click") })
                    .disabled(true)
            }
            
            HStack(spacing: 5) {
                DesignSystemButton("Text", action: { print("click") })
                DesignSystemButton("Text", image: cloudImg, action: { print("click") })
                DesignSystemButton(image: cloudImg, action: { print("click") })
            }
            
            Divider()
            Text("Button style")
            
            Button(action: { print("click") }, label: { Text("Custom") })
                .designSystem(.primary, design: .outline)
        }
    .padding(10)
    }
}
