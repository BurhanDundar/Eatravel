//
//  CustomLabel.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 13.08.2023.
//

// let customLabel = CustomLabel(text: "Custom Button" ,color: .red, fontSize: 15, isBold: false, isLongText: false)

import UIKit

class CustomLabel: UILabel {
    
    init(
        text: String = "",
        color: UIColor = .label,
        fontSize: CGFloat = 17,
        isBold: Bool = false,
        isLongText: Bool = false
    ){
        super.init(frame: .zero)
        self.text = text
        self.textColor = color
        self.font = .systemFont(ofSize: fontSize)
        
        if(isBold) {
            self.font = .boldSystemFont(ofSize: self.font.pointSize)
        }
        
        if(isLongText) {
            self.numberOfLines = 0
            self.sizeToFit()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("CustomLabel fatal error")
    }
    
}
