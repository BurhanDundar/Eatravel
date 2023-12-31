//
//  AddCommentViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import UIKit
import Photos
import PhotosUI

protocol AddCommentDelegate: Any {
    func addComment(with comment: Comment)
}

class AddCommentViewController: UIViewController {
    
    let restaurantNameLabel = CustomLabel(fontSize: 22, isBold: true)
    let commentBox = CustomTextView()
    let ratingView = RatingView()
    let chooseImagesBtn = CustomButton(title: "Fotoğraf Seç", hasBackground: true, fontSize: .med)
//    let collectionView = UICollectionView()
    var imageArray = [UIImage]()
    
    
    
    private let collectionView: UICollectionView = { // belki bir view haline getirilebilir burası
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        return cv
    }()
    
    var restaurant: Restaurant!
    var delegate: AddCommentDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .systemBackground
        commentBox.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        chooseImagesBtn.addTarget(self, action: #selector(addPhotoButtonTapped), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
//        ratingView.isUserInteractionEnabled = true
//        ratingView.addGestureRecognizer(tapGesture)
        
        self.setupUI()
    }
    
    @objc private func didTapDone() {
        let comment = Comment.sampleData[0]
        delegate?.addComment(with: comment)
        dismiss(animated: true)
    }
    
    @objc func didCancelAdd(_ sender: UIBarButtonItem){
        dismiss(animated: true)
    }
    
//    @objc func tapped(){
//        print("Tapped!")
//    }
//    
    @objc private func addPhotoButtonTapped(_ sender: UIButton){
        var config = PHPickerConfiguration()
        config.selectionLimit = 6
        
        let phPickerVC = PHPickerViewController(configuration: config)
        phPickerVC.delegate = self
        self.present(phPickerVC, animated: true)
    }
    
    
    
    private func setupUI(){
        restaurantNameLabel.text = restaurant.name // restaurant.name sonradan initialize edildiği için burda atandı başlık
        
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentBox.translatesAutoresizingMaskIntoConstraints = false
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        chooseImagesBtn.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
                
        self.view.addSubview(restaurantNameLabel)
        self.view.addSubview(commentBox)
        self.view.addSubview(ratingView)
        self.view.addSubview(chooseImagesBtn)
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            restaurantNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            restaurantNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            commentBox.topAnchor.constraint(equalTo: restaurantNameLabel.bottomAnchor, constant: 20),
            commentBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            commentBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            commentBox.heightAnchor.constraint(equalToConstant: 115),
            
            ratingView.topAnchor.constraint(equalTo: commentBox.bottomAnchor, constant: 20),
            ratingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            chooseImagesBtn.topAnchor.constraint(equalTo: ratingView.bottomAnchor, constant: 40),
            chooseImagesBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            chooseImagesBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            chooseImagesBtn.heightAnchor.constraint(equalToConstant: 55),
            
            collectionView.topAnchor.constraint(equalTo: chooseImagesBtn.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 400)
            
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

extension AddCommentViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage {
                    self.imageArray.append(image)
                }
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
        }
    }
}

extension AddCommentViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseIdentifier, for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        cell.imageView.image = imageArray[indexPath.row]
        return cell
        
    }
}

extension AddCommentViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width / 3 - 2, height: collectionView.frame.size.height / 3 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}
