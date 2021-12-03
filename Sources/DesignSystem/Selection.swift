//
//  Selection.swift
//  DesignSystem
//
//  Created by Carlos Bystron on 04.05.20.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import Foundation
import SwiftUI

struct DesignSystemSelection: View {
    
    enum Style {
        case defaultStyle,
             disabled,
             success,
             warning,
             danger,
             info
    }
    
    var placeholder: String
    var style: Style = .defaultStyle
    var icon: Image? = nil
    var commit: ()->() = { }
    @State private var focused: Bool = false
    @State var input: String = ""
    
    // MARK:  Function declarations
    
    fileprivate func defaultStyle() -> some View {
        HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Color.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        print("TextField focused")
                        self.focused = true
                    } else {
                        print("TextField focus removed")
                        self.focused = false
                    }
                }, onCommit: commit)
                .textFieldStyle(PlainTextFieldStyle())
                .foregroundColor(Color.designSystemFontStd)
            }
            if focused { icon.imageScale(.large).foregroundColor(Color.primary) }
            else { icon.imageScale(.large).foregroundColor(Color.designSystemBasic) }
        }
         .padding()
         .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Color.designSystemBasic.opacity(0) : Color.designSystemBasic.opacity(0.1)))
         .overlay(RoundedRectangle(cornerRadius: 5).stroke(self.focused ? Color.primary : Color.designSystemBasic.opacity(0.4), lineWidth: 1))
    }
    
    fileprivate func success() -> some View {
         HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Color.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        print("TextField focused")
                        self.focused = true
                    } else {
                        print("TextField focus removed")
                        self.focused = false
                    }
                }, onCommit: commit).foregroundColor(Color.designSystemFontStd)
            }
            icon.imageScale(.large).foregroundColor(Color.designSystemSuccess)
         }
         .padding()
         .background(
            self.focused == true ?
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color.designSystemBasic) :
                RoundedRectangle(cornerRadius: 5)
                .stroke(Color.designSystemSuccess, lineWidth: 1)
         )
    }
    
    fileprivate func warning() -> some View {
         HStack {
            ZStack(alignment: .leading) {
                if input.isEmpty { Text(placeholder).foregroundColor(Color.designSystemBasic) }
                TextField("", text: $input, onEditingChanged: { (editingChanged) in
                    if editingChanged {
                        print("TextField focused")
                        self.focused = true
                    } else {
                        print("TextField focus removed")
                        self.focused = false
                    }
                }, onCommit: commit).foregroundColor(Color.designSystemFontStd)
            }
            icon.imageScale(.large).foregroundColor(Color.designSystemWarning)
         }
         .padding()
         .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Color.designSystemBasic.opacity(0) : Color.designSystemBasic.opacity(0.1)))
         .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.designSystemWarning, lineWidth: 1))
    }
    
    fileprivate func danger() -> some View {
            HStack {
               ZStack(alignment: .leading) {
                   if input.isEmpty { Text(placeholder).foregroundColor(Color.designSystemBasic) }
                   TextField("", text: $input, onEditingChanged: { (editingChanged) in
                       if editingChanged {
                           print("TextField focused")
                           self.focused = true
                       } else {
                           print("TextField focus removed")
                           self.focused = false
                       }
                   }, onCommit: commit).foregroundColor(Color.designSystemFontStd)
               }
               icon.imageScale(.large).foregroundColor(Color.designSystemDanger)
            }
            .padding()
//            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Color.brBasic.opacity(0) : RoundedCorner(cornerRadius: 5).stroke(Color.brDanger, lineWidth: 1))
    }
    
    fileprivate func info() -> some View {
            HStack {
               ZStack(alignment: .leading) {
                   if input.isEmpty { Text(placeholder).foregroundColor(Color.designSystemBasic) }
                   TextField("", text: $input, onEditingChanged: { (editingChanged) in
                       if editingChanged {
                           print("TextField focused")
                           self.focused = true
                       } else {
                           print("TextField focus removed")
                           self.focused = false
                       }
                   }, onCommit: commit).foregroundColor(Color.designSystemFontStd)
               }
               icon.imageScale(.large).foregroundColor(Color.designSystemInfo)
            }
            .padding()
//            .background(RoundedRectangle(cornerRadius: 5).foregroundColor(self.focused ? Color.brBasic.opacity(0) : Color.brBasic.opacity(0.1)))
            .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.designSystemInfo, lineWidth: 1))
    }
    
    // MARK:  Body
    
    var body: some View {
        
        switch style {
        case .success:
            return AnyView(success())
        case .warning:
                   return AnyView(warning())
        case .danger:
                   return AnyView(danger())
        case .info:
                   return AnyView(info())
        default:
            return AnyView(defaultStyle())
        }
    }
}

// MARK: Preview

struct Selection_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack(spacing: 20) {
            DesignSystemSelection(placeholder: "Test")
            DesignSystemSelection(placeholder: "Default style", style: .defaultStyle, icon: nil, commit: {}, input: "")
        }
        .padding()
    }
}
