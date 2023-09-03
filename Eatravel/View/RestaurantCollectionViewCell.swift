//
//  RestaurantCollectionViewCell.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 6.08.2023.
//

// Burası storyboard olmadan yapılacak

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var restaurantImageView: UIImageView!
    @IBOutlet weak var restaurantNameLabel: UILabel!
    @IBOutlet weak var restaurantRankLabel: UILabel!
    
    func setup(with restaurant: Restaurant){
        self.restaurantImageView.image = UIImage(named: restaurant.image) // assets'ten çağırılacak
        self.restaurantNameLabel.text = restaurant.name
        self.restaurantRankLabel.text = restaurant.rank
    }
}
