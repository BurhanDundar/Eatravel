//
//  AddCityRestaurantViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 12.08.2023.
//

import Photos
import UIKit
import PhotosUI

protocol AddCityRestaurantDelegate: Any {
    func addRestaurant(with restaurant: Restaurant)
}


class AddCityRestaurantViewController: UIViewController {
    
    let titleLabel = CustomLabel(fontSize: 22, isBold: true)
    let restaurantNameTxtField = CustomTextField(fieldType: .restaurantName)
    
    let addBtn = CustomButton(title: "Ekle", hasBackground: true, fontSize: .med)
    
    var delegate: AddCityRestaurantDelegate?
    
    private let collectionView: UICollectionView = { // belki bir view haline getirilebilir burası
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.reuseIdentifier)
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view = UIView()
        view.backgroundColor = .systemBackground
        self.setupUI()
    }

    private func setupUI(){
        titleLabel.text = "Restoran ekle" // restaurant.name sonradan initialize edildiği için burda atandı başlık
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        restaurantNameTxtField.translatesAutoresizingMaskIntoConstraints = false
        addBtn.translatesAutoresizingMaskIntoConstraints = false
                
        self.view.addSubview(titleLabel)
        self.view.addSubview(restaurantNameTxtField)
        self.view.addSubview(addBtn)
        
        addBtn.addTarget(self, action: #selector(addRestaurant), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            restaurantNameTxtField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            restaurantNameTxtField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restaurantNameTxtField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            restaurantNameTxtField.heightAnchor.constraint(equalToConstant: 55),
            
            addBtn.topAnchor.constraint(equalTo: restaurantNameTxtField.bottomAnchor, constant: 10),
            addBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            addBtn.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.75),
            addBtn.heightAnchor.constraint(equalToConstant: 45)
            
        ])
    }
    
    @objc func addRestaurant(){
        let restaurant = Restaurant(name: "Hacı Sokakta", image: "HaciSokakta", description: "", menu: "", location: "Özkanlar", city: .izmir, type: .restaurant, rank: "4.1")
        delegate?.addRestaurant(with: restaurant)
        navigationController?.popViewController(animated: true)
    }
}

