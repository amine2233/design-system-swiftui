//
//  TextField.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public struct DesignSystemTextField: View {
    var style: DesignSystem.Style
    var titleKey: LocalizedStringKey
    var icon: Image? = nil
    var commit: ()->() = { }
    @State private var focused: Bool = false
    @Binding var input: String
    @Environment(\.colorTheme) private var colorTheme: ColorTheme

    // MARK: Inits
    
    public init(_ titleKey: LocalizedStringKey, input: Binding<String>, style: DesignSystem.Style = .default, icon: Image? = nil, onCommit: @escaping ()->() = { }) {
        self.titleKey = titleKey
        self._input = input
        self.style = style
        self.icon = icon
        self.commit = onCommit
    }
    
    // MARK: Inits
    
    public init(_ text: String, input: Binding<String>, style: DesignSystem.Style = .default, icon: Image? = nil, onCommit: @escaping ()->() = { }) {
        self.titleKey = LocalizedStringKey(text)
        self._input = input
        self.style = style
        self.icon = icon
        self.commit = onCommit
    }
    
    // MARK:  Body
    
    public var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(titleKey).foregroundColor(colorTheme.basic) }
                TextField("", text: $input, onEditingChanged: { editingChanged in
                    self.focused = editingChanged
                    print(editingChanged ? "TextField focused" : "TextField focus removed")
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(colorTheme.fontDisabled)
            }
            if focused { icon.imageScale(.large).foregroundColor(style.color(colorTheme)) }
            else { icon.imageScale(.large).foregroundColor(colorTheme.basic) }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(style.color(colorTheme).opacity(self.focused ? 0 : 0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(self.focused ? style.color(colorTheme) : colorTheme.basic.opacity(0.4), lineWidth: 1)
        )
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
