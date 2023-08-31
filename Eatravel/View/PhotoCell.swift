//
//  PhotoCell.swift
//  Eatravel
//
//  Created by Burhan Dündar on 31.08.2023.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageView.frame = bounds
    }
}
