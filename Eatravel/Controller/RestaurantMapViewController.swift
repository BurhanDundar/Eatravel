//
//  RestaurantMapViewController.swift
//  Eatravel
//
//  Created by Burhan Dündar on 28.08.2023.
//

import UIKit
import MapKit

// Izmir -> latitude: 38.4237, longitude: 27.1428
// Istanbul -> latitude: 41.0082, longitude: 28.9784

class RestaurantMapViewController: UIViewController {
    
    let IZMIR_LATITUDE = 38.4237
    let IZMIR_LONGITUDE = 27.1428
    
    let mapView = MKMapView()
    
    
    var restaurant: Restaurant
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("RestaurantMapViewController fatal error")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let restaurantInMap = Capital(title: restaurant.name, coordinate: CLLocationCoordinate2D(latitude: restaurant.latitude ?? IZMIR_LATITUDE, longitude: restaurant.longitude ?? IZMIR_LONGITUDE), info: restaurant.description)
        
        // for multiple cities, use addAnnotations
        mapView.addAnnotation(restaurantInMap)
        
        self.setupUI()
    }
    
    
    private func setupUI(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mapView)
        
        mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
}
