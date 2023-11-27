//
//  CGFloat+Ext.swift
//  MoodNotify
//
//  Created by mehmet duran on 27.11.2023.
//

import SwiftUI

extension CGFloat {
    static func widthSize(_ value: Self) -> Self {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return UIScreen.main.bounds.width * (value/414)
        case .pad:
            return UIScreen.main.bounds.width * (value/614)
        default: return .zero
        }
    }
    
    static func heightSize(_ value: Self) -> Self {
        return UIScreen.main.bounds.height * (value/896)
    }
    
    static func random() -> Self {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
