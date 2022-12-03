//
//  Toggles.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemToggle: View {
        
    @Binding var toggleState: Bool
    private var style: DesignSystem.Style
    private var titleKey: LocalizedStringKey

    @Environment(\.colorTheme) private var colorTheme: ColorTheme

    public init(
        _ titleKey: LocalizedStringKey,
        isOn: Binding<Bool>,
        style: DesignSystem.Style
    ) {
        self.titleKey = titleKey
        self._toggleState = isOn
        self.style = style
    }

    public var body: some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: style.color(colorTheme),
                    offColor: style.color(colorTheme).opacity(0.1),
                    thumbColor: .white
                )
            )
    }

    
    private struct ColoredToggleStyle: ToggleStyle {
        var onColor: Color
        var offColor: Color
        var thumbColor: Color
        
        func makeBody(configuration: Self.Configuration) -> some View {
            Button(action: { configuration.isOn.toggle() } ) {
                RoundedRectangle(cornerRadius: 16, style: .circular)
                    .fill(configuration.isOn ? onColor : offColor)
                    .frame(width: 50, height: 29)
                    .overlay(
                        ZStack {
                            Circle()
                                .fill(thumbColor)
                                .shadow(radius: 1, x: 0, y: 1)
                                .padding(1.5)
                                .offset(x: configuration.isOn ? 10 : -10)
                            Image(systemName: configuration.isOn ? "checkmark" : "")
                                .font(.system(size: 12, weight: .black))
                                .foregroundColor(onColor)
                                .offset(x: configuration.isOn ? 10 : -10)
                            
                        }
                    )
                    .animation(.easeInOut(duration: 0.1))
            }
            .font(.title)
            .padding(.horizontal)
            .buttonStyle(ToogleButtonStyle())
        }
    }
    
    private struct ToogleButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .background(Color.clear)
        }
    }
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DesignSystemToggle("defaultStyle", isOn: .constant(true), style: .default)
            DesignSystemToggle("primary", isOn: .constant(true), style: .primary)
            DesignSystemToggle("success", isOn: .constant(true), style: .success)
            DesignSystemToggle("info", isOn: .constant(true), style: .info)
            DesignSystemToggle("warning", isOn: .constant(true), style: .warning)
            DesignSystemToggle("danger", isOn: .constant(true), style: .danger)
        }
    }
}
