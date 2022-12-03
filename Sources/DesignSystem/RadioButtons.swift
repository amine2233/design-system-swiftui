//
//  RadioButton.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemRadioButton: View {
    @Binding var isChecked: Bool
    
    @Environment(\.isEnabled) private var isEnabled: Bool
    @Environment(\.colorTheme) private var colorTheme: ColorTheme

    private var style: DesignSystem.Style
    private var titleKey: LocalizedStringKey
    private var colorToUse: Color { isEnabled ? style.color(colorTheme) : colorTheme.fontDisabled }
    
    public init(
        _ text: String = "",
        isChecked: Binding<Bool>,
        style: DesignSystem.Style = .default
    ) {
        self.titleKey = LocalizedStringKey(text)
        self._isChecked = isChecked
        self.style = style
    }

    public var body: some View {
        HStack(spacing: titleKey.stringKey.isEmpty ? 0 : 6) {
            if $isChecked.wrappedValue {
                CheckedButton(color: colorToUse)
            } else {
                UncheckedButton(color: colorToUse)
            }
            Text(titleKey)
        }
    }
}

private struct CheckedButton: View {
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 18, height: 18)
            Circle()
                .fill(color)
                .frame(width: 12, height: 12)
        }
    }
}

private struct UncheckedButton: View {
    var color: Color
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
                .frame(width: 20, height: 20)
            Circle()
                .fill(Color.white)
                .frame(width: 18, height: 18)
            Circle()
                .fill(color.opacity(0.1))
                .frame(width: 18, height: 18)
        }
    }
}


struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading, spacing: 12) {
            DesignSystemRadioButton(isChecked:.constant(true))
            DesignSystemRadioButton(isChecked: .constant(false))
            DesignSystemRadioButton(isChecked: .constant(true)).disabled(true)
            DesignSystemRadioButton(isChecked: .constant(false)).disabled(true)
            DesignSystemRadioButton(isChecked: .constant(false), style: .primary)
            DesignSystemRadioButton(isChecked: .constant(false), style: .danger)
            DesignSystemRadioButton(isChecked: .constant(false), style: .warning)
            DesignSystemRadioButton(isChecked: .constant(false), style: .success)
            DesignSystemRadioButton("Text", isChecked: .constant(true))
            DesignSystemRadioButton("Text and custom color", isChecked: .constant(true), style: .warning)
        }
    }
}
