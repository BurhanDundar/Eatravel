//
//  PostListViewController.swift
//  Eatravel
//
//  Created by Burhan Dündar on 2.09.2023.
//

import UIKit

class PostListViewController: UIViewController {
    
    let posts = Post.sampleData
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        let cv = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        cv.register(PostViewCell.self, forCellWithReuseIdentifier: PostViewCell.reuseIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.view.backgroundColor = .systemBackground
        self.setupUI()
    }
    
    private func setupUI(){
        
        
//        self.collectionView.backgroundColor = .red
        
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//            self.collectionView.heightAnchor.constraint(equalToConstant: 500),
//            self.collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        ])
    }
    
}

extension PostListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostViewCell.reuseIdentifier, for: indexPath) as? PostViewCell else {
            return UICollectionViewCell()
        }
        
        cell.userName.text = "Burhan Dündar"
        cell.userProfilePhoto.image = UIImage(named: "ProfilePhoto")
        cell.postImg.image = UIImage(named: "MersinliCigerciApo")
        cell.postDesc.text = self.posts[indexPath.row].description
        return cell
        
    }
}

extension PostListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height / 2.5 - 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
}
