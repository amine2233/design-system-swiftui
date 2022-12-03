//
//  File.swift
//
//
//  Created by Amine Bensalah on 04/12/2021.
//

import SwiftUI

extension View {
    public func eraseToAnyView() -> AnyView { AnyView(self) }
}

extension View {
    public func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

extension View {
    public func setupNavigationBarTitleDisplayMode() -> AnyView {
        #if targetEnvironment(macCatalyst)
            if #available(macCatalyst 14.0, *) {
                return navigationBarTitleDisplayMode(.inline)
                    .eraseToAnyView()
            } else {
                return eraseToAnyView()
            }
        #else
            return eraseToAnyView()
        #endif
    }

    public func setupListStyle() -> AnyView {
        listStyle(SidebarListStyle())
            .eraseToAnyView()
    }
}

extension View {
    public func style(_ block: (Self) -> Self) -> Self {
        block(self)
    }
}

extension View {
    public func setupSidebarList() -> AnyView {
        listStyle(SidebarListStyle())
            .eraseToAnyView()
    }
}

extension View {
    public func navigationBarBothTitle<S>(_ title: S) -> some View where S: StringProtocol {
        #if os(iOS)
            return navigationBarTitle(title, displayMode: .inline)
        #else
            return navigationTitle(title)
        #endif
    }

    public func navigationBarBothText(_ text: Text) -> some View {
        #if os(iOS)
            return navigationBarTitle(text, displayMode: .inline)
        #else
            return navigationTitle(text)
        #endif
    }

    public func navigationBarBothItems<L: View, R: View>(leading: L, trailing: R) -> some View {
        #if os(iOS)
            return navigationBarItems(leading: leading, trailing: trailing)
        #else
            return toolbar {
                leading
                Spacer()
                trailing
            }
        #endif
    }
}
