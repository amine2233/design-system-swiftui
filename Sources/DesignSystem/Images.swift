//
//  Images.swift
//  DesignSystem
//
//  Copyright © 2020 by a cool group. All rights reserved.
//

import SwiftUI

public extension Image {
    
    //MARK: Avatars
    
    ///Turn image into a circular avatar
    func designSystemAvatarCircle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .padding(.all, 16)
        
    }
    
    ///Turn image into a rectangular avatar
    func designSystemAvatarSquare() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(Rectangle())
            .padding(.all, 16)
        
    }
    ///Turn image into a rounded rectangle avatar
    func designSystemAvatarRounded() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 40, height: 40)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .padding(.all, 16)
        
    }
    
    //MARK: Styled Images
    
    ///Modify image to fit a circular format
    func designSystemCircle(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(Circle())
    }
    
    ///Modify image to fit a square format
    func designSystemSquare(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
    }
    
    ///Modify image to fit a rounded corners square format
    func designSystemRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(RoundedRectangle(cornerRadius: width/10.0))
    }
    ///Modify image to have upper rounded corners in a square format
    func designSystemTopRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(DesignSystemRoundedCorner(radius: width/10.0, corners: [.topLeft, .topRight]))
    }
    
    ///Modify image to have lower rounded corners in a square format
    func designSystemBottomRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(DesignSystemRoundedCorner(radius: width/10.0, corners: [.bottomLeft, .bottomRight]))
    }
    
    ///Modify image to have left-side rounded corners in a square format
    func designSystemLeftRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(DesignSystemRoundedCorner(radius: width/10.0, corners: [.bottomLeft, .topLeft]))
        
            
    }
    
    ///Modify image to have right-side rounded corners in a square format
    func designSystemRightRounded(width: CGFloat) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: width)
            .clipShape(DesignSystemRoundedCorner(radius: width/10.0, corners: [.bottomRight, .topRight]))
    }
}


struct Images_Previews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack {
                Image("bricks_logo", bundle: .module)
                    .designSystemAvatarCircle()
                Image("bricks_logo", bundle: .module)
                    .designSystemAvatarSquare()
                Image("bricks_logo", bundle: .module)
                    .designSystemAvatarRounded()
                
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo", bundle: .module)
                    .designSystemCircle(width: 90)
                Image("bricks_logo", bundle: .module)
                    .designSystemSquare(width: 90)
                Image("bricks_logo", bundle: .module)
                    .designSystemRounded(width: 90)
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo", bundle: .module)
                    .designSystemTopRounded(width: 120)
                Image("bricks_logo", bundle: .module)
                    .designSystemBottomRounded(width: 120)
            }.padding()
            
            HStack(spacing: 20) {
                Image("bricks_logo", bundle: .module)
                    .designSystemLeftRounded(width: 120)
                Image("bricks_logo", bundle: .module)
                    .designSystemRightRounded(width: 120)
            }.padding()
        }
    }
}
