//
//  CustomTextField.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 21.07.2023.
//

import UIKit

class CustomTextField: UITextField {
    
    enum CustomTextFieldType {
        case username
        case fullname
        case email
        case password
        case repassword
        case comment
        case restaurantName
    }
    
    private let authFieldType: CustomTextFieldType
    init(fieldType: CustomTextFieldType) {
        self.authFieldType = fieldType
        super.init(frame: .zero)
        
        self.backgroundColor = .secondarySystemBackground
        self.layer.cornerRadius = 10
        
        self.returnKeyType = .done
        self.autocorrectionType = .no
        self.autocapitalizationType = .none
        
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x:0, y:0,width: 12, height: self.frame.size.height))
        
        switch fieldType {
        case .username:
            self.placeholder = "Username"
        case .fullname:
            self.placeholder = "Fullname"
        case .email:
            self.placeholder = "Email Address"
            self.keyboardType = .emailAddress
            self.textContentType = .emailAddress
        case .password:
            self.placeholder = "Password"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .repassword:
            self.placeholder = "Repassword"
            self.textContentType = .oneTimeCode
            self.isSecureTextEntry = true
        case .comment:
            self.placeholder = "Write your comment..."
        case .restaurantName:
            self.placeholder = "Restoran ismi" // Restaurant Name
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
