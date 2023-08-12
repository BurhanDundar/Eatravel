//
//  AddCityRestaurantViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 12.08.2023.
//

import UIKit

class AddCityRestaurantViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.text = "Add restaurant"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.center = view.center
        
        view.addSubview(label)
    }
}
