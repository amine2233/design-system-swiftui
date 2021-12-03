//
//  Toggles.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemToggle: View {
    
    public enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    @Binding var toggleState: Bool
    @State private var style: Style
    private var titleKey: LocalizedStringKey
    
    public init(_ titleKey: LocalizedStringKey, isOn: Binding<Bool>, style: DesignSystemToggle.Style) {
        self.titleKey = titleKey
        self._toggleState = isOn
        self.style = style
    }
    
    private struct ColoredToggleStyle: ToggleStyle {
        var onColor = Color.designSystemPrimary
        var offColor = Color.designSystemDanger
        var thumbColor = Color.white
        
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
    
    public var body: some View {
        switch style {
        case .primary: return AnyView(primary())
        case .success: return AnyView(success())
        case .warning: return AnyView(warning())
        case .danger: return AnyView(danger())
        case .info: return AnyView(info())
        default: return AnyView(defaultStyle())
        }
    }
    
    
    fileprivate func defaultStyle() -> some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .designSystemBasic,
                    offColor: Color.designSystemBasic.opacity(0.1),
                    thumbColor: .white))
    }
    
    fileprivate func primary() -> some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .designSystemPrimary,
                    offColor: Color.designSystemPrimary.opacity(0.1),
                    thumbColor: .white))
    }
    
    fileprivate func success() -> some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .designSystemSuccess,
                    offColor: Color.designSystemSuccess.opacity(0.1),
                    thumbColor: .white))
    }
    
    fileprivate func info() -> some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .designSystemInfo,
                    offColor: Color.designSystemInfo.opacity(0.1),
                    thumbColor: .white))
    }
    
    
    fileprivate func warning() -> some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .designSystemWarning,
                    offColor: Color.designSystemWarning.opacity(0.1),
                    thumbColor: .white))
    }
    
    
    fileprivate func danger() -> some View {
        Toggle(titleKey, isOn: $toggleState)
            .toggleStyle(
                ColoredToggleStyle(
                    onColor: .designSystemDanger,
                    offColor: Color.designSystemDanger.opacity(0.1),
                    thumbColor: .white))
    }
}

struct Toggles_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DesignSystemToggle("defaultStyle", isOn: .constant(true), style: .defaultStyle)
            DesignSystemToggle("primary", isOn: .constant(true), style: .primary)
            DesignSystemToggle("success", isOn: .constant(true), style: .success)
            DesignSystemToggle("info", isOn: .constant(true), style: .info)
            DesignSystemToggle("warning", isOn: .constant(true), style: .warning)
            DesignSystemToggle("danger", isOn: .constant(true), style: .danger)
        }
    }
}
