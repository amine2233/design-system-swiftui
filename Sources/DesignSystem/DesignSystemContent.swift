//
//  File.swift
//  
//
//  Created by Amine Bensalah on 03/12/2021.
//

import SwiftUI

public protocol Emptiable: Identifiable {
    var isEmpty: Bool { get }
}

extension Bool: Emptiable {
    public var isEmpty: Bool {
        self == true
    }
    
    public var id: Bool { self }
}

extension String: Emptiable {
    public var id: String { self }
}

public struct DesignSystemContent<Content: View, Value: Emptiable>: View {

    var style: DesignSystem.Style
    var titleKey: LocalizedStringKey
    var icon: Image? = nil
    var content: (Binding<Value>) -> Content
    @Binding public var emptiable: Value
    @State private var focused: Bool = false

    @Environment(\.colorTheme) private var colorTheme

    // MARK: Inits
    
    public init(
        _ titleKey: LocalizedStringKey,
        emptiable: Binding<Value>,
        style: DesignSystem.Style = .default,
        icon: Image? = nil,
        @ViewBuilder content: @escaping (Binding<Value>) -> Content
    ) {
        self.titleKey = titleKey
        self._emptiable = emptiable
        self.style = style
        self.icon = icon
        self.content = content
    }
    
    // MARK: Inits
    
    public init(_ text: String, emptiable: Binding<Value>, style: DesignSystem.Style = .default, icon: Image? = nil, content:@escaping  (Binding<Value>) -> Content) {
        self.titleKey = LocalizedStringKey(text)
        self._emptiable = emptiable
        self.style = style
        self.icon = icon
        self.content = content
    }

    // MARK:  Body
    
    public var body: some View {
        HStack {
            ZStack(alignment: .leading) {
                if $emptiable.wrappedValue.isEmpty {
                    Text(titleKey)
                        .foregroundColor(colorTheme.basic)
                }
                content($emptiable)
                    .textFieldStyle(PlainTextFieldStyle())
                    .foregroundColor(colorTheme.fontDisabled)
            }
            if focused {
                icon.imageScale(.large)
                .foregroundColor(style.color(colorTheme))
            }
            else { icon.imageScale(.large).foregroundColor(colorTheme.basic)
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(colorTheme.basic.opacity(self.focused ? 0 : 0.1))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(self.focused ? style.color(colorTheme) : colorTheme.basic.opacity(0.4), lineWidth: 1)
        )
    }
}

// MARK: Preview

struct DesignSystemTextFieldGeneric_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DesignSystemContent(
                "Thats a default Textfield",
                emptiable: .constant("")
            ) { value in
                TextField("", text: value)
            }
            DesignSystemContent(
                "Thats a default Textfield + Icon",
                emptiable: .constant(""),
                icon: Image(systemName: "star.fill")
            ) { value in
                TextField("", text: value)
            }
            
            DesignSystemContent(
                "Primary",
                emptiable: .constant(""),
                style: .primary,
                icon: Image(systemName: "star.fill")
            ) { value in
                TextField("", text: value)
            }
            DesignSystemContent(
                "Success",
                emptiable: .constant(""),
                style: .success,
                icon: Image(systemName: "star.fill")
            ) { value in
                TextField("", text: value)
            }
            DesignSystemContent(
                "Warning",
                emptiable: .constant(""),
                style: .warning,
                icon: Image(systemName: "star.fill")
            ) { value in
                TextField("", text: value)
            }
            DesignSystemContent(
                "Danger",
                emptiable: .constant(""),
                style: .danger,
                icon: Image(systemName: "star.fill")
            ) { value in
                TextField("", text: value)
            }
            DesignSystemContent(
                "Info",
                emptiable: .constant(""),
                style: .info,
                icon: Image(systemName: "star.fill")
            ) { value in
                TextField("", text: value)
            }
        }
        .padding()
    }
}
