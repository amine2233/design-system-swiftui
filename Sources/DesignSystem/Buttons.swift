//
//  Buttons.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

// MARK: - Custom Button Styles

struct DesignSystemButtonStyle: ButtonStyle {
    var color: Color
    var style: DesignSystemButton.Style
    
    func makeBody(configuration: ButtonStyle.Configuration) -> some View {
        switch style {
        case .fill: return AnyView(FillButton(color: color, configuration: configuration))
        case .outline: return AnyView(OutlineButton(color: color, configuration: configuration))
        case .ghost: return AnyView(GhostButton(color: color, configuration: configuration))
        }
    }
    
    private struct FillButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .designSystemTypography(.s1)
                .foregroundColor(isEnabled ? .white : .designSystemFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color : Color.designSystemBasic.opacity(0.2))
                .cornerRadius(4)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
    
    private struct OutlineButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .designSystemTypography(.s1)
                .foregroundColor(isEnabled ? color : .designSystemFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(isEnabled ? color.opacity(0.2) : Color.designSystemBasic.opacity(0.15))
                .cornerRadius(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(isEnabled ? color : Color.designSystemBasic.opacity(0.5), lineWidth: 1)
                )
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
    
    private struct GhostButton: View {
        var color: Color
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        var body: some View {
            configuration.label
                .designSystemTypography(.s1)
                .foregroundColor(isEnabled ? color : .designSystemFontDisabled)
                .padding()
                .frame(minHeight: 56)
                .background(Color.white)
                .cornerRadius(4)
                .opacity(configuration.isPressed ? 0.7 : 1)
        }
    }
}

// MARK: - Usage

extension Button {
    /// Changes the appearance of the button
    public func style(_ style: DesignSystemButton.Style, color: Color) -> some View {
        self.buttonStyle(DesignSystemButtonStyle(color: color, style: style))
    }
}

public struct DesignSystemButton: View {
    public enum Style {
        case fill, outline, ghost
    }
    
    var titleKey: LocalizedStringKey?
    var image: Image?
    var style: Style = .fill
    var color: Color = .designSystemPrimary
    var action: () -> Void
    var textAndImage: Bool { titleKey != nil && image != nil }
    
    public init(_ titleKey: LocalizedStringKey?, image: Image? = nil, style: DesignSystemButton.Style = .fill, color: Color = .designSystemPrimary, action: @escaping () -> Void) {
        self.titleKey = titleKey
        self.image = image
        self.style = style
        self.color = color
        self.action = action
    }
    
    public init(_ text: String?, image: Image? = nil, style: DesignSystemButton.Style = .fill, color: Color = .designSystemPrimary, action: @escaping () -> Void) {
        self.titleKey = LocalizedStringKey(text ?? "")
        self.image = image
        self.style = style
        self.color = color
        self.action = action
    }
    
    public init(image: Image? = nil, style: DesignSystemButton.Style = .fill, color: Color = .designSystemPrimary, action: @escaping () -> Void) {
        self.image = image
        self.style = style
        self.color = color
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
        .style(style, color: color)
    }
}


// MARK: - Preview

public struct DesignSystemInput_Previews: PreviewProvider {
    static let cloudImg = Image(systemName: "cloud.sun")
    
    public static var previews: some View {
        VStack(spacing: 40) {
            
            HStack(spacing: 5) {
                DesignSystemButton("Fill", style: .fill, action: { print("click") })
                DesignSystemButton("Outline", style: .outline, action: { print("click") })
                DesignSystemButton("Ghost", style: .ghost, action: { print("click") })
            }
            
            HStack(spacing: 5) {
                DesignSystemButton("Danger", color: .designSystemDanger, action: { print("click") })
                DesignSystemButton("Warning", color: .designSystemWarning, action: { print("click") })
                DesignSystemButton("Success", color: .designSystemSuccess, action: { print("click") })
            }
            
            HStack(spacing: 5) {
                DesignSystemButton("Disabled", style: .fill, action: { print("click") })
                    .disabled(true)
                DesignSystemButton("Disabled", style: .outline, action: { print("click") })
                    .disabled(true)
                DesignSystemButton("Disabled", style: .ghost, action: { print("click") })
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
                .style(.outline, color: .designSystemFontBtn)
        }
    .padding(10)
    }
}
