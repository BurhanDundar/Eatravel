//
//  CityRestaurantsListViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.07.2023.
//

import UIKit

class CityRestaurantsListViewController: UIViewController {
    
    var cityName: String
    init(cityName: String){
        self.cityName = cityName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Always initialize CityRestaurantsListViewController using init(reminder:)")
    }
    
    override func viewDidLoad(){
        navigationItem.title = NSLocalizedString("CITY_RESTAURANTS_TABLE_NAVIGATION_TITLE", comment: "City restaurants table list navigation title")
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
        
        let cityNameLabel: UILabel = UILabel()
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cityNameLabel.text = self.cityName // "\(self.cityName)"
        cityNameLabel.font = .preferredFont(forTextStyle: .largeTitle)
        
        self.view.addSubview(cityNameLabel)
        
        NSLayoutConstraint.activate([
            cityNameLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cityNameLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
    }
    
    
}
