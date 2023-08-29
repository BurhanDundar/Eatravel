//
//  AddCommentViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import UIKit

class AddCommentViewController: UIViewController {
    
    let commentBox = CustomTextField(fieldType: .comment)
    // let rate
    // let images
    // let date
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .systemBackground
        
        self.setupUI()
    }
    
    private func setupUI(){
        //let label = CustomLabel(text: "Add comment")
        commentBox.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(commentBox)
        
        NSLayoutConstraint.activate([
            commentBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            commentBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            commentBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            commentBox.heightAnchor.constraint(equalToConstant: 55
                                              ),
        ])
        
    }
}
