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

class RestaurantMapViewController: UIViewController, UISearchBarDelegate {
    
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
        self.view.backgroundColor = .systemBackground
        super.viewDidLoad()
        
        let searchButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchPlace))
        
        navigationItem.rightBarButtonItem = searchButton
        
        
        let restaurantInMap = Capital(title: restaurant.name, coordinate: CLLocationCoordinate2D(latitude: restaurant.latitude ?? IZMIR_LATITUDE, longitude: restaurant.longitude ?? IZMIR_LONGITUDE), info: restaurant.description)
        
        // for multiple cities, use addAnnotations
        mapView.addAnnotation(restaurantInMap)
        
        self.setupUI()
    }
    
    @objc func searchPlace(_ sender: UIBarButtonItem){
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        present(searchController, animated: true, completion: nil)
    }
    
    
    private func setupUI(){
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 400)
        ])
        //        mapView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        //        mapView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //Ignoring user
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        //Activity Indicator
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.style = UIActivityIndicatorView.Style.gray
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        //Hide search bar
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        //Create the search request
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = searchBar.text
        
        let activeSearch = MKLocalSearch(request: searchRequest)
        
        activeSearch.start { (response, error) in
            
            activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            if response == nil
            {
                print("ERROR")
            }
            else
            {
                //Remove annotations
                let annotations = self.mapView.annotations
                self.mapView.removeAnnotations(annotations)
                
                //Getting data
                let latitude = response?.boundingRegion.center.latitude
                let longitude = response?.boundingRegion.center.longitude
                
                print("latitude:", latitude)
                print("longitude:", longitude)
                
                //Create annotation
                let annotation = MKPointAnnotation()
                annotation.title = searchBar.text
                annotation.coordinate = CLLocationCoordinate2DMake(latitude!, longitude!)
                self.mapView.addAnnotation(annotation)
                
                //Zooming in on annotation
                let coordinate:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude!, longitude!)
                let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                let region = MKCoordinateRegion(center: coordinate, span: span)
                self.mapView.setRegion(region, animated: true)
            }
            
        }
    }
}


//extension RestaurantMapViewController: CLLocationManagerDelegate {
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        if let location = locations.last{
//            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
//            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
//            self.mapView.setRegion(region, animated: true)
//        }
//    }
//}
