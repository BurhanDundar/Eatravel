//
//  CityRestaurantsListViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.07.2023.
//

import UIKit

class CityRestaurantsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var restaurants = Restaurant.sampleData
    
    var cityName: String!
    override func viewDidLoad(){
        
        restaurants = restaurants.filter({ $0.city.rawValue == "izmir" }) // cityName.lowercased()
        
        navigationItem.title = NSLocalizedString("CITY_RESTAURANTS_TABLE_NAVIGATION_TITLE", comment: "City restaurants table list navigation title")
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        collectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: RestaurantCollectionViewCell.reuseIdentifier)
        
        self.setupUI()
        navigationItem.title = self.cityName
        
        let addCityRestaurantBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCityRestaurant))
        navigationItem.rightBarButtonItem = addCityRestaurantBarButton
    }
    
    private func setupUI(){
        self.view.backgroundColor = .systemBackground
    }
    
    @objc func addCityRestaurant(_ sender: UIBarButtonItem){
        let viewController = AddCityRestaurantViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    private func addRestaurantAction(restaurant: Restaurant){
        restaurants.append(restaurant)
        collectionView.reloadData()
    }
}

extension CityRestaurantsListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.restaurants.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantCollectionViewCell.reuseIdentifier, for: indexPath) as! RestaurantCollectionViewCell
        cell.setup(with: self.restaurants[indexPath.row])
        return cell
    }
}

extension CityRestaurantsListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.size.width, height: 300)
    }
}

extension CityRestaurantsListViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let restaurant = self.restaurants[indexPath.row]
        let viewController = CityRestaurantDetailViewController(restaurant: restaurant)
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension CityRestaurantsListViewController: AddCityRestaurantDelegate {
    func addRestaurant(with restaurant: Restaurant) {
        addRestaurantAction(restaurant: restaurant)
    }
}
