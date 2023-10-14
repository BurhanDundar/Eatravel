//
//  RestaurantCollectionViewCell.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 6.08.2023.
//

// Burası storyboard olmadan yapılacak

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
     
    static let reuseIdentifier = "RestaurantCollectionViewCell"
    
    let restaurantImageView: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.frame = UIScreen.main.bounds
            return iv
        }()
    
    let restaurantName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    let restaurantRank: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.sizeToFit()
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
        
        backgroundColor = .clear
        
        contentView.addSubview(restaurantImageView)
        contentView.addSubview(restaurantName)
        contentView.addSubview(restaurantRank)
        
        NSLayoutConstraint.activate([
            restaurantImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            restaurantImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5),
            
            restaurantName.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 20),
            restaurantName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            restaurantName.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
            
            restaurantRank.topAnchor.constraint(equalTo: restaurantName.bottomAnchor, constant: 20),
            restaurantRank.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            restaurantRank.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9),
        ])
    }
    
    func setup(with restaurant: Restaurant){
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.restaurantName.text = restaurant.name
        self.restaurantRank.text = restaurant.rank
    }
    
}
