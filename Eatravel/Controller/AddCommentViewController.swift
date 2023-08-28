//
//  AddCommentViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import UIKit

class AddCommentViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .systemBackground
        
        self.setupUI()
    }
    
    private func setupUI(){
        let label = CustomLabel(text: "Add comment")
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }
}
