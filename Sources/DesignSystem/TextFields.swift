//
//  TextField.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemTextField: View {
    
    public enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    var style: Style
    var titleKey: LocalizedStringKey
    var icon: Image? = nil
    var commit: ()->() = { }
    @State private var focused: Bool = false
    @Binding var input: String
    
    // MARK: Inits
    
    public init(_ titleKey: LocalizedStringKey, input: Binding<String>, style: Style = .defaultStyle, icon: Image? = nil, onCommit: @escaping ()->() = { }) {
        self.titleKey = titleKey
        self._input = input
        self.style = style
        self.icon = icon
        self.commit = onCommit
    }
    
    // MARK: Inits
    
    public init(_ text: String, input: Binding<String>, style: Style = .defaultStyle, icon: Image? = nil, onCommit: @escaping ()->() = { }) {
        self.titleKey = LocalizedStringKey(text)
        self._input = input
        self.style = style
        self.icon = icon
        self.commit = onCommit
    }
    
    // MARK:  Function declarations
    
    fileprivate func defaultStyle() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.designSystemFontStd)
            }
            if focused { icon.imageScale(.large).foregroundColor(.designSystemPrimary) }
            else { icon.imageScale(.large).foregroundColor(.designSystemBasic) }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(Color.designSystemBasic.opacity(self.focused ? 0 : 0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(self.focused ? Color.designSystemPrimary : Color.designSystemBasic.opacity(0.4), lineWidth: 1)
        )
    }
    
    fileprivate func primary() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(.designSystemPrimary) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.designSystemFontStd)
            }
             icon.imageScale(.large).foregroundColor(.designSystemPrimary)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.designSystemBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.designSystemPrimary, lineWidth: 1))
    }
    
    fileprivate func success() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.designSystemFontStd)
            }
            icon.imageScale(.large).foregroundColor(.designSystemSuccess)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.designSystemBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.designSystemSuccess, lineWidth: 1))
    }
    
    fileprivate func warning() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(Color.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.designSystemFontStd)
            }
            icon.imageScale(.large).foregroundColor(.designSystemWarning)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.designSystemBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.designSystemWarning, lineWidth: 1))
    }
    
    fileprivate func danger() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.designSystemFontStd)
            }
            icon.imageScale(.large).foregroundColor(.designSystemDanger)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.designSystemBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.designSystemDanger, lineWidth: 1))
    }
    
    fileprivate func info() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(.designSystemFontStd)
            }
            icon.imageScale(.large).foregroundColor(.designSystemInfo)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 5)
        .foregroundColor(Color.designSystemBasic.opacity(self.focused ? 0 : 0.1)))
        .overlay(RoundedRectangle(cornerRadius: 5)
        .stroke(Color.designSystemInfo, lineWidth: 1))
    }
    
    // MARK:  Body
    
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
}

// MARK: Preview

struct DesignSystemTextField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DesignSystemTextField("Thats a default Textfield", input: .constant(""), onCommit: {print("party")})
            DesignSystemTextField("Thats a default Textfield + Icon", input: .constant(""), icon: Image(systemName: "star.fill"), onCommit: {print("party")})
            DesignSystemTextField("Primary", input: .constant(""), style: .primary, icon: Image(systemName: "star.fill"))
            DesignSystemTextField("Success", input: .constant(""), style: .success, icon: Image(systemName: "star.fill"))
            DesignSystemTextField("Warning", input: .constant(""), style: .warning, icon: Image(systemName: "star.fill"))
            DesignSystemTextField("Danger", input: .constant(""), style: .danger, icon: Image(systemName: "star.fill"))
            DesignSystemTextField("Info", input: .constant(""), style: .info, icon: Image(systemName: "star.fill"))
        }
        .padding()
    }
}
