//
//  CustomTextView.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 29.08.2023.
//

import UIKit

class CustomTextView: UITextView {
    init() {
        super.init(frame: .zero, textContainer: nil)
        self.isEditable = true
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.text = "Comment..."
        self.textColor = .gray
        self.layer.cornerRadius = 16
        self.font = .systemFont(ofSize: 17)
        self.textContainerInset = UIEdgeInsets(top: 10, left: 6, bottom: 10, right: 6)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

