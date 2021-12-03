//
//  Toggles.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI


public struct DesignSystemCheckbox: View {
    
    public enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    @Binding var checkboxState: Bool
    private var style: Style
    private var titleKey: LocalizedStringKey

    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>, style: DesignSystemCheckbox.Style) {
        self.titleKey = titleKey
        self._checkboxState = isOn
        self.style = style
    }
    
    public init(_ title: String, isOn: Binding<Bool>, style: DesignSystemCheckbox.Style) {
        self.titleKey = LocalizedStringKey(title)
        self._checkboxState = isOn
        self.style = style
    }
    
    private struct ColoredCheckboxStyle: ToggleStyle {
        public var onColor: Color
        public var offColor: Color
        
        public init(onColor: Color = Color.designSystemPrimary, offColor: Color = Color.designSystemFontDisabled) {
            self.onColor = onColor
            self.offColor = offColor
        }

        public func makeBody(configuration: Self.Configuration) -> some View {
            let hStack = HStack {
                configuration.label
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 22, height: 22)
                    .foregroundColor(configuration.isOn ? onColor : offColor)
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
        switch style {
        case .success: return AnyView(success())
        case .primary: return AnyView(primary())
        case .warning: return AnyView(warning())
        case .danger: return AnyView(danger())
        case .info: return AnyView(info())
        default: return AnyView(defaultStyle())
        }
    }
    
    
    fileprivate func defaultStyle() -> some View {
        Toggle(titleKey, isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .designSystemBasic, offColor: .designSystemFontDisabled))
    }
    
    fileprivate func primary() -> some View {
        Toggle(titleKey, isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .designSystemPrimary, offColor: .designSystemFontDisabled))
    }
    
    fileprivate func success() -> some View {
            Toggle(titleKey, isOn: $checkboxState)
            .toggleStyle(ColoredCheckboxStyle(onColor: .designSystemSuccess, offColor: .designSystemFontDisabled))
    }
    
    fileprivate func info() -> some View {
        Toggle(titleKey, isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .designSystemInfo, offColor: .designSystemFontDisabled))
    }
    
    
    fileprivate func warning() -> some View {
        Toggle(titleKey, isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .designSystemWarning, offColor: .designSystemFontDisabled))
    }
    
    
    fileprivate func danger() -> some View {
        Toggle(titleKey, isOn: $checkboxState)
        .toggleStyle(ColoredCheckboxStyle(onColor: .designSystemDanger, offColor: .designSystemFontDisabled))
    }
}


struct Checkboxes_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10){
            DesignSystemCheckbox("", isOn: .constant(true), style: .defaultStyle)
            DesignSystemCheckbox("", isOn: .constant(true), style: .primary)
            DesignSystemCheckbox("", isOn: .constant(true), style: .success)
            DesignSystemCheckbox("", isOn: .constant(true), style: .info)
            DesignSystemCheckbox("", isOn: .constant(true), style: .warning)
            DesignSystemCheckbox("", isOn: .constant(true), style: .danger)
        }
    }
}
