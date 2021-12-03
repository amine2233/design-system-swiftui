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
    
    public enum Style {
        case defaultStyle, primary, disabled, success, warning, danger, info
    }
    
    var style: Style
    var titleKey: LocalizedStringKey
    var icon: Image? = nil
    var content: (Binding<Value>) -> Content
    @Binding public var emptiable: Value
    @State private var focused: Bool = false
    
    // MARK: Inits
    
    public init(_ titleKey: LocalizedStringKey, emptiable: Binding<Value>, style: Style = .defaultStyle, icon: Image? = nil, @ViewBuilder content: @escaping (Binding<Value>) -> Content) {
        self.titleKey = titleKey
        self._emptiable = emptiable
        self.style = style
        self.icon = icon
        self.content = content
    }
    
    // MARK: Inits
    
    public init(_ text: String, emptiable: Binding<Value>, style: Style = .defaultStyle, icon: Image? = nil, content:@escaping  (Binding<Value>) -> Content) {
        self.titleKey = LocalizedStringKey(text)
        self._emptiable = emptiable
        self.style = style
        self.icon = icon
        self.content = content
    }
    
    // MARK:  Function declarations
    
    fileprivate func defaultStyle() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if $emptiable.wrappedValue.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                content($emptiable)
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
                if $emptiable.wrappedValue.isEmpty { Text(titleKey).foregroundColor(.designSystemPrimary) }
                content($emptiable)
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
                if $emptiable.wrappedValue.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                content($emptiable)
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
                if $emptiable.wrappedValue.isEmpty { Text(titleKey).foregroundColor(Color.designSystemBasic) }
                content($emptiable)
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
                if $emptiable.wrappedValue.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                content($emptiable)
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
                if $emptiable.wrappedValue.isEmpty { Text(titleKey).foregroundColor(.designSystemBasic) }
                content($emptiable)
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

struct DesignSystemTextFieldGeneric_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            DesignSystemContent("Thats a default Textfield", emptiable: .constant("")) { value in
                TextField("", text: value)
            }
            DesignSystemContent("Thats a default Textfield + Icon", emptiable: .constant(""), icon: Image(systemName: "star.fill")){ value in
                TextField("", text: value)
            }
            
            DesignSystemContent("Primary", emptiable: .constant(""), style: .primary, icon: Image(systemName: "star.fill")) { value in
                TextField("", text: value)
            }
            DesignSystemContent("Success", emptiable: .constant(""), style: .success, icon: Image(systemName: "star.fill")) { value in
                TextField("", text: value)
            }
            DesignSystemContent("Warning", emptiable: .constant(""), style: .warning, icon: Image(systemName: "star.fill")) { value in
                TextField("", text: value)
            }
            DesignSystemContent("Danger", emptiable: .constant(""), style: .danger, icon: Image(systemName: "star.fill")) { value in
                TextField("", text: value)
            }
            DesignSystemContent("Info", emptiable: .constant(""), style: .info, icon: Image(systemName: "star.fill")) { value in
                TextField("", text: value)
            }
        }
        .padding()
    }
}
