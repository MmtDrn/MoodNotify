//
//  String+Ext.swift
//  MoodNotify
//
//  Created by mehmet duran on 29.11.2023.
//

import Foundation

extension String {
    
    func convertAttributed() -> AttributedString {
        var attributedString = AttributedString(self)
        
        let chars = attributedString.characters
        
        for i in chars.indices where chars[i].isNumber || chars[i].isMathSymbol {
            attributedString[i ..< chars.index(after: i)].font = .subheadline.bold()
            attributedString[i ..< chars.index(after: i)].foregroundColor = .blue
        }
        
        
        return attributedString
    }
}
