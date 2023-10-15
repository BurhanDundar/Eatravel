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
    
    private let restaurantImageView: UIImageView = {
            let iv = UIImageView()
            iv.translatesAutoresizingMaskIntoConstraints = false
            iv.frame = UIScreen.main.bounds
            return iv
        }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private let restaurantName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        return label
    }()
    
    private let restaurantRank: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .right
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
        
        stackView.addArrangedSubview(restaurantName)
        stackView.addArrangedSubview(restaurantRank)
        
        contentView.addSubview(restaurantImageView)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            restaurantImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            restaurantImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            restaurantImageView.heightAnchor.constraint(equalToConstant: 200),
            
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            stackView.topAnchor.constraint(equalTo: restaurantImageView.bottomAnchor, constant: 10),
            stackView.heightAnchor.constraint(equalToConstant: 40),
            
            restaurantName.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            
            restaurantRank.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
        ])
    }
    
    func setup(with restaurant: Restaurant){
        self.restaurantImageView.image = UIImage(named: restaurant.image)
        self.restaurantName.text = restaurant.name
        self.restaurantRank.text = restaurant.rank
    }
    
}
