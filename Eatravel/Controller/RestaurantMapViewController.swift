//
//  RestaurantMapViewController.swift
//  Eatravel
//
//  Created by Burhan Dündar on 28.08.2023.
//

import UIKit
import MapKit

class RestaurantMapViewController: UIViewController {
    
    let mapView = MKMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let izmir = Capital(title: "Izmir", coordinate: CLLocationCoordinate2D(latitude: 38.4237, longitude: 27.1428), info: "Dream City")
        
        // for multiple cities, use addAnnotations
        mapView.addAnnotation(izmir)
        
        self.setupUI()
    }
    
    
    private func setupUI(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mapView)
        
        mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
}
