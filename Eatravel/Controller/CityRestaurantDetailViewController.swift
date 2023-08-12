//
//  CityRestaurantDetailViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 12.08.2023.
//

import UIKit

class CityRestaurantDetailViewController: UIViewController {
    
    var restaurant: Restaurant
    init(restaurant: Restaurant){
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("CityRestaurantDetailViewController fatal error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI(){
        
        view.backgroundColor = .systemBackground
        
        let cityNameLabel = UILabel()
        cityNameLabel.text = restaurant.name
        
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        cityNameLabel.center = view.center
        
        view.addSubview(cityNameLabel)
    }
}
