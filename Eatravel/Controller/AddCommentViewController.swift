//
//  AddCommentViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import UIKit

class AddCommentViewController: UIViewController {
    
    let restaurantNameLabel = CustomLabel(fontSize: 22, isBold: true)
    let commentBox = CustomTextView()
    let ratingView = RatingView()
    let chooseImagesBtn = CustomButton(title: "Fotoğraf Seç", hasBackground: true, fontSize: .med)
    
    // let rate -> fill Stars
    // let images -> collectionView
    // let date -> dynamic
    
    var restaurant: Restaurant
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("AddCommentViewController fatal error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .systemBackground
        commentBox.delegate = self
        self.setupUI()
    }
    
    
    
    private func setupUI(){
        restaurantNameLabel.text = restaurant.name // restaurant.name sonradan initialize edildiği için burda atandı başlık
        
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentBox.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        chooseImagesBtn.translatesAutoresizingMaskIntoConstraints = false
                
        self.view.addSubview(restaurantNameLabel)
        self.view.addSubview(commentBox)
        self.view.addSubview(ratingView)
        self.view.addSubview(chooseImagesBtn)
        
        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            commentBox.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 20),
            commentBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            commentBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            commentBox.heightAnchor.constraint(equalToConstant: 115),
            
            ratingView.topAnchor.constraint(equalTo: commentBox.bottomAnchor, constant: 20),
            ratingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            chooseImagesBtn.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 100),
            chooseImagesBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            chooseImagesBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            chooseImagesBtn.heightAnchor.constraint(equalToConstant: 55)
            
        ])
    }
}

// Burda belki problem olabilir bak buna
extension AddCommentViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if (self.commentBox.text ?? "") == "Comment..." {
            self.commentBox.text = ""
            self.commentBox.textColor = .label
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if self.commentBox.text.isEmpty {
            self.commentBox.text = "Comment..."
            self.commentBox.textColor = UIColor.lightGray
        }
    }
}
