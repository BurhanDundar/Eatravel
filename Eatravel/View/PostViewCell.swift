//
//  PostView.swift
//  Eatravel
//
//  Created by Burhan Dündar on 2.09.2023.
//

// Cell olarak nasıl kullanılabilir. Bak buna!

import UIKit

class PostViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PostViewCell"
    
    let helloLabel: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 14)
            label.text = "Burhan Dündar"
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.addSubviews()
    }
    
    private func addSubviews(){
        backgroundColor = .systemBackground
        
        addSubview(helloLabel)
        
        helloLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        helloLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        helloLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
//        helloLabel.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }

}
