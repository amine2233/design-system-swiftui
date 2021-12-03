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

    private var color: Color?
    private var titleKey: LocalizedStringKey
    private var colorToUse: Color? { isEnabled ? color : .designSystemFontDisabled }
    
    public init(_ text: String = "",
                isChecked: Binding<Bool>,
                color: Color? = nil) {
        self.titleKey = LocalizedStringKey(text)
        self._isChecked = isChecked
        self.color = color
    }

    public var body: some View {
        HStack(spacing: titleKey.stringKey.isEmpty ? 0 : 6) {
            if $isChecked.wrappedValue {
                CheckedButton(color: colorToUse ?? .designSystemPrimary)
            } else {
                UncheckedButton(color: colorToUse ?? .designSystemBasic)
            }
            Text(titleKey)
        }
    }
}

private struct CheckedButton: View {
    var color: Color = .designSystemPrimary
    
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
    var color: Color = .designSystemBasic
    
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
            DesignSystemRadioButton(isChecked: .constant(false), color: .designSystemDanger)
            DesignSystemRadioButton(isChecked: .constant(false), color: .designSystemWarning)
            DesignSystemRadioButton(isChecked: .constant(false), color: .designSystemSuccess)
            DesignSystemRadioButton("Text", isChecked: .constant(true))
            DesignSystemRadioButton("Text and custom color", isChecked: .constant(true), color: .designSystemWarning)
        }
    }
}
