//
//  CityRestaurantDetailViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 12.08.2023.
//

import UIKit

class CityRestaurantDetailViewController: UIViewController {
    
//    var postViewTempArray = ["Post 1","Post 2","Post 3","Post 4"]
    
// Burda yorum olarak en beğenilen 3 yorum olabilir

    var posts = Post.sampleData
    
    var restaurant: Restaurant
    init(restaurant: Restaurant){
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("CityRestaurantDetailViewController fatal error")
    }
    
    private let collectionView: UICollectionView = { // belki bir view haline getirilebilir burası
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PostViewCell.self, forCellWithReuseIdentifier: PostViewCell.reuseIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        
        let addCommentBarButton = UIBarButtonItem(image: UIImage(systemName: "bubble.middle.bottom"), style: .plain, target: self, action: #selector(toAddComment))
        let mapBarButton = UIBarButtonItem(image: UIImage(systemName: "map"), style: .plain, target: self, action: #selector(toMapView))
        
        navigationItem.rightBarButtonItems = [mapBarButton, addCommentBarButton]
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        super.viewDidLoad()
        self.setupUI()
    }
    
    @objc private func toAddComment(_ sender: UIBarButtonItem){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "AddCommentViewController") as! AddCommentViewController
            viewController.restaurant = restaurant
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
            viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDone))
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true)
        
//        let viewController = AddCommentViewController(restaurant: restaurant)
//        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .cancel, target: self, action: #selector(didCancelAdd(_:)))
//        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.modalPresentationStyle = .fullScreen
//        present(navigationController, animated: true)
    }
    
    @objc private func didTapDone() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didCancelAdd(_ sender: UIBarButtonItem){
        dismiss(animated: true)
    }
    
    @objc private func toMapView(_ sender: UIBarButtonItem){
        let vc = RestaurantMapViewController(restaurant: restaurant)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //    func createRestaurantFeatureSegmentedControl(){
    //
    //    }
    
    @objc private func restaurantFeatureDidChange(_ sender: UISegmentedControl){
        switch sender.selectedSegmentIndex {
        case 0:
            print("0")
        case 1:
            print("1")
        default:
            print("default")
        }
    }
    
    private func setupUI(){
        view.backgroundColor = .systemBackground
        
        let restaurantImage = UIImage(named: restaurant.image)
        let restaurantImageView = UIImageView(image: restaurantImage)
        // resim üstü hafif karanlık olmalı
        restaurantImageView.addoverlay(alpha: 0.4)
        
//        let comment = CommentView(frame: .zero)
//        comment.layer.borderWidth = 10
//        comment.layer.borderColor = UIColor.red.cgColor
        
        let restaurantNameLabel = CustomLabel(text: String(self.restaurant.name), color: .white, fontSize: 18, isBold: true)
        let restaurantRankLabel = CustomLabel(text: "\(self.restaurant.rank)/5 Puan", color: .white, fontSize: 16, isBold: true)
        let restaurantDescLabel = CustomLabel(text: String(self.restaurant.description), fontSize: 15, isLongText: true)
        
        let items = ["Comments", "Menu"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(restaurantFeatureDidChange), for: .valueChanged)
        
        restaurantImageView.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantRankLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantDescLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
//        comment.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
                
        self.view.addSubview(restaurantImageView)
        self.view.addSubview(restaurantNameLabel)
        self.view.addSubview(restaurantRankLabel)
        self.view.addSubview(restaurantDescLabel)
        self.view.addSubview(segmentedControl)
        self.view.addSubview(collectionView)
        
//        self.view.addSubview(comment)
        
        NSLayoutConstraint.activate([
            restaurantImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            restaurantImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 250),
            
            restaurantNameLabel.bottomAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: -20),
            restaurantNameLabel.leadingAnchor.constraint(equalTo: restaurantImageView.leadingAnchor, constant: 20),
            
            restaurantRankLabel.bottomAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: -20),
            restaurantRankLabel.trailingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: -20),
            
            restaurantDescLabel.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 20),
            restaurantDescLabel.leadingAnchor.constraint(equalTo: restaurantImageView.leadingAnchor, constant: 20),
            restaurantDescLabel.trailingAnchor.constraint(equalTo: restaurantImageView.trailingAnchor, constant: -20),
            restaurantDescLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: restaurantDescLabel.bottomAnchor, constant: 20),
            segmentedControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
//            comment.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
//            comment.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            comment.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
            
            collectionView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}

extension UIView {
    func addoverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
    //This function will add a layer on any `UIView` to make that `UIView` look darkened
}

extension CityRestaurantDetailViewController: UICollectionViewDataSource {
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print("height:", scrollView.contentSize.height)
//        print(scrollView.contentOffset.y)
//        print(scrollView.contentSize.height)
//        print(scrollView.frame.size.height)
        
//        self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
    }
}

extension CityRestaurantDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.size.width, height: 350) // collectionView.frame.size.height / 2.5 - 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    
}

//Implement the UIScrollViewDelegate in your class, and then add this:
//
//-(void)scrollViewDidScroll: (UIScrollView*)scrollView
//{
//    float scrollViewHeight = scrollView.frame.size.height;
//    float scrollContentSizeHeight = scrollView.contentSize.height;
//    float scrollOffset = scrollView.contentOffset.y;
//
//    if (scrollOffset == 0)
//    {
//        // then we are at the top
//    }
//    else if (scrollOffset + scrollViewHeight == scrollContentSizeHeight)
//    {
//        // then we are at the end
//    }
//}
