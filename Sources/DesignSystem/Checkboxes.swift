//
//  Toggles.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemCheckbox: View {

    @Binding var checkboxState: Bool
    private var style: DesignSystem.Style
    private var titleKey: LocalizedStringKey

    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>, style: DesignSystem.Style) {
        self.titleKey = titleKey
        self._checkboxState = isOn
        self.style = style
    }
    
    public init(_ title: String, isOn: Binding<Bool>, style: DesignSystem.Style) {
        self.titleKey = LocalizedStringKey(title)
        self._checkboxState = isOn
        self.style = style
    }
    
    private struct ColoredCheckboxStyle: ToggleStyle {
        public var style: DesignSystem.Style

        @Environment(\.colorTheme) private var colorTheme: ColorTheme
        @Environment(\.isEnabled) private var isEnabled: Bool

        public init(style: DesignSystem.Style = .default) {
            self.style = style
        }

        public func makeBody(configuration: Self.Configuration) -> some View {
            let hStack = HStack {
                configuration.label
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(isEnabled ? style.color(colorTheme) : style.color(colorTheme).opacity(0.5))
            }
            
            #if !os(tvOS)
            return hStack
                .onTapGesture { configuration.isOn.toggle() }
            #else
            return hStack
            #endif
            
        }
    }
    
    public var body: some View {
        Toggle(titleKey, isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(style: style))
    }
}

struct Checkboxes_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10){
            DesignSystemCheckbox("", isOn: .constant(false), style: .default)
                .disabled(true)
            DesignSystemCheckbox("", isOn: .constant(false), style: .primary)
                .disabled(true)
            DesignSystemCheckbox("", isOn: .constant(true), style: .success)
            DesignSystemCheckbox("", isOn: .constant(true), style: .info)
            DesignSystemCheckbox("", isOn: .constant(true), style: .warning)
            DesignSystemCheckbox("", isOn: .constant(true), style: .danger)
        }
        .padding()
    }
}
