//
//  AddCityRestaurantViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 12.08.2023.
//

import Photos
import UIKit
import PhotosUI


class AddCityRestaurantViewController: UIViewController {
    
    let titleLabel = CustomLabel(fontSize: 22, isBold: true)
    let restaurantNameTxtField = CustomTextField(fieldType: .restaurantName)
    
    
    
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
                
        self.view.addSubview(titleLabel)
        self.view.addSubview(restaurantNameTxtField)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            restaurantNameTxtField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            restaurantNameTxtField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            restaurantNameTxtField.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.85),
            restaurantNameTxtField.heightAnchor.constraint(equalToConstant: 55),
            
        ])
    }
}

