//
//  ViewController.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 21.07.2023.
//

import UIKit

class CitiesTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cityNames = ["CITIES_TABLE_IZMIR","CITIES_TABLE_ISTANBUL"]
    let cityImages = ["",""]
    
//    let cityDetailPages = ["",""]
//    let izmirString = NSLocalizedString("CITIES_TABLE_IZMIR", comment: "İzmir")
//    let istanbulString = NSLocalizedString("CITIES_TABLE_IZMIR", comment: "İzmir")
    
    var cityName = ""
    var cityImage = ""
    var cityDetailPage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = NSLocalizedString("CITIES_TABLE_TITLE", comment: "City list navigation title")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        
        cityName = NSLocalizedString("\(cityNames[indexPath.item])", comment: "\(cityNames[indexPath.item]) in table list")
        content.text = cityName
//        content.image = UIImage(systemName: cityImages[indexPath.item])
        cell.accessoryType = .disclosureIndicator
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cityName = NSLocalizedString("\(cityNames[indexPath.item])", comment: "\(cityNames[indexPath.item]) in table list")
        cityImage = cityImages[indexPath.item]
        
//        let viewController = CityRestaurantsListViewController()
//        self.navigationController?.pushViewController(viewController, animated: true)
//        performSegue(withIdentifier: cityDetailPage, sender: nil)
        
         let viewController = self.storyboard?.instantiateViewController(withIdentifier: "CityRestaurantsListViewController") as! CityRestaurantsListViewController
 //        let navigationCont = UINavigationController(rootViewController: viewController)
         viewController.cityName = cityName

         navigationController?.pushViewController(viewController, animated: true)
    }
}

