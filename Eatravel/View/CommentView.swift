//
//  CommentView.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

// tasarım değişecek şimdilik yorumlar için basit bir tasarım yapılacak

import UIKit

class CommentView: UIView {
    
    
    var comment: Comment = Comment(postId: "", parent: "", rate: .five, text: "Custom View Comment", date: "25.08.2023", images: [])
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupUI()
        }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        }
    
    private func setupUI(){
        let commentLabel = CustomLabel(text: self.comment.text, fontSize: 18)
        let dateLabel = CustomLabel(text: self.comment.date, color: .lightGray, fontSize: 16)
        let ratingLabel = CustomLabel(text: "\(self.comment.rate.rawValue)/5 Puan", color: .systemBlue, fontSize: 15)
        
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(commentLabel)
        self.addSubview(dateLabel)
        self.addSubview(ratingLabel)
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: self.topAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            
            ratingLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            ratingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
        
    }
}
