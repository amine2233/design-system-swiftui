//
//  DesignSystemRoundedCorner.swift
//
//  Created by Micaela Cavallo on 01/05/2020.
//  Copyright © 2020 Fabio Staiano. All rights reserved.
//

import SwiftUI

#if os(macOS)

struct NSRectCorner: OptionSet {
    let rawValue: Int
    static let topLeft: NSRectCorner = NSRectCorner(rawValue: 1 << 0)
    static let topRight: NSRectCorner = NSRectCorner(rawValue: 1 << 1)
    static let bottomLeft: NSRectCorner = NSRectCorner(rawValue: 1 << 2)
    static let bottomRight: NSRectCorner = NSRectCorner(rawValue: 1 << 3)
    static let allCorners: NSRectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
}

typealias DesignSystemRectCorner = NSRectCorner
typealias DesignSystemRect = NSRect
#elseif os(iOS) || os(watchOS) || os(tvOS)
typealias DesignSystemRectCorner = UIRectCorner
typealias DesignSystemRect = CGRect
#endif

extension View {
    // function for CornerRadius struct
    func cornerRadius(_ radius: CGFloat, corners: DesignSystemRectCorner) -> some View {
        clipShape( DesignSystemRoundedCorner(radius: radius, corners: corners) )
    }
}

/// Custom shape with independently rounded corners
struct DesignSystemRoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: DesignSystemRectCorner = .allCorners

    func path(in rect: DesignSystemRect) -> Path {
        #if os(macOS)
        let path = CGPath(roundedRect: rect, cornerWidth: radius, cornerHeight: radius, transform: nil)
        return Path(path)
        #elseif os(iOS) || os(watchOS) || os(tvOS)
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
        #endif
    }
}
