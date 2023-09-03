//
//  PostView.swift
//  Eatravel
//
//  Created by Burhan Dündar on 2.09.2023.
//

// Cell olarak nasıl kullanılabilir. Bak buna! -> +

// Tasarım olarak UIStackView kullanılabilir. Bak buna sonra

// heart message paperplane bookmark

import UIKit

class PostViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PostViewCell"
    
    
    let userName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "user name"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let userProfilePhoto: UIImageView = {
        let iv = UIImageView() // frame: CGRect(x,y,w,h) neden çalışmıyor sonra araştır
        iv.image = UIImage(named: "ProfilePhoto")
        iv.widthAnchor.constraint(equalToConstant: 35).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 35).isActive = true
//        iv.frame = UIScreen.main.bounds
        iv.contentMode = .scaleToFill
        iv.makeRounded()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let postImg: UIImageView = {
            let iv = UIImageView()
            iv.image = UIImage(named: "MersinliCigerciApo")
            iv.frame = UIScreen.main.bounds
            iv.translatesAutoresizingMaskIntoConstraints = false
            return iv
        }()
    
    // Bu tüm butonlar tek bir şablona oturtulacak
    let likeBtn: UIImageView = {
        //            icon.frame = CGRectMake(icon.frame.origin.x,icon.frame.origin.y, 200, 200)
        //            icon.clipsToBounds = true
        //            icon.contentMode = .scaleToFill
        //            icon.frame.size.width = 50
        //            icon.frame.size.height = 50
            let icon = UIImageView()
            icon.image = UIImage(systemName: "heart")
            icon.tintColor = .label
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.isUserInteractionEnabled = true
            return icon
        }()
    
    let commentBtn: UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "message")
            icon.tintColor = .label
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.isUserInteractionEnabled = true
            return icon
        }()
    
    let sendBtn: UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "paperplane")
            icon.tintColor = .label
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.isUserInteractionEnabled = true
            return icon
        }()
    
    let saveBtn: UIImageView = {
            let icon = UIImageView()
            icon.image = UIImage(systemName: "bookmark")
            icon.tintColor = .label
            icon.translatesAutoresizingMaskIntoConstraints = false
            icon.isUserInteractionEnabled = true
            return icon
        }()
    
    let postDesc: UILabel = {
            let label = UILabel()
            label.font = .systemFont(ofSize: 17)
            label.text = "post description"
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
    
//    override func layoutSubviews() {
//        userProfilePhoto.layer.cornerRadius = bounds.height / 2
//        }
    
    private func addSubviews(){
        backgroundColor = .systemBackground
        
        addSubview(userProfilePhoto)
        addSubview(userName)
        addSubview(postImg)
        addSubview(likeBtn)
        addSubview(commentBtn)
        addSubview(sendBtn)
        addSubview(saveBtn)
        addSubview(postDesc)
        
        
        let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(likePost))
        likeBtn.addGestureRecognizer(likeTapGesture)
        
        let commentTapGesture = UITapGestureRecognizer(target: self, action: #selector(commentPost))
        commentBtn.addGestureRecognizer(commentTapGesture)
        
        let sendTapGesture = UITapGestureRecognizer(target: self, action: #selector(sendPost))
        sendBtn.addGestureRecognizer(sendTapGesture)
        
        let saveTapGesture = UITapGestureRecognizer(target: self, action: #selector(savePost))
        saveBtn.addGestureRecognizer(saveTapGesture)
        
        
        NSLayoutConstraint.activate([
            
            userProfilePhoto.topAnchor.constraint(equalTo: topAnchor),
            userProfilePhoto.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            userName.topAnchor.constraint(equalTo: topAnchor),
            userName.leadingAnchor.constraint(equalTo: userProfilePhoto.trailingAnchor, constant: 10),
            userName.heightAnchor.constraint(equalToConstant: 25),
            
            postImg.widthAnchor.constraint(equalTo: widthAnchor),
            postImg.heightAnchor.constraint(equalToConstant: 200),
            postImg.topAnchor.constraint(equalTo: userProfilePhoto.bottomAnchor, constant: 20),
            
            likeBtn.topAnchor.constraint(equalTo: postImg.bottomAnchor, constant: 5),
            likeBtn.leadingAnchor.constraint(equalTo: postImg.leadingAnchor, constant: 5),
            
            commentBtn.topAnchor.constraint(equalTo: postImg.bottomAnchor, constant: 5),
            commentBtn.leadingAnchor.constraint(equalTo: likeBtn.trailingAnchor, constant: 5),
            
            sendBtn.topAnchor.constraint(equalTo: postImg.bottomAnchor, constant: 5),
            sendBtn.leadingAnchor.constraint(equalTo: commentBtn.trailingAnchor, constant: 5),
            
            saveBtn.topAnchor.constraint(equalTo: postImg.bottomAnchor, constant: 5),
            saveBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            
            postDesc.topAnchor.constraint(equalTo: likeBtn.bottomAnchor, constant: 20),
            
        ])
    }

}

extension UIImageView {
    func makeRounded() {
        layer.borderWidth = 1
        layer.masksToBounds = false
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 17.5 // self.frame.height / 2
        clipsToBounds = true
    }
}

extension PostViewCell {
    @objc func likePost(_ sender: UITapGestureRecognizer) {
//        self.likeBtn.tintColor = .red
//        self.likeBtn.backgroundColor = .red
        self.likeBtn.image = UIImage(systemName: "heart.fill")
        self.likeBtn.tintColor = .red
    }
    
    @objc func commentPost(_ sender: UITapGestureRecognizer) {
        self.commentBtn.image = UIImage(systemName: "message.fill")
        self.commentBtn.tintColor = .label
    }
    
    @objc func sendPost(_ sender: UITapGestureRecognizer) {
        self.sendBtn.image = UIImage(systemName: "paperplane.fill")
        self.sendBtn.tintColor = .label
    }
    
    @objc func savePost(_ sender: UITapGestureRecognizer) {
        self.saveBtn.image = UIImage(systemName: "bookmark.fill")
        self.saveBtn.tintColor = .label
    }
}
