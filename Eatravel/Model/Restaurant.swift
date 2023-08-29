//
//  Restaurant.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.07.2023.
//

//let izLat = 38.4237
//let izmirLon = 27.1428

import Foundation

struct Restaurant: Identifiable, Codable {
    var _id: String = UUID().uuidString
    var id: String { _id }
    var name: String
    var image: String
    var description: String
    var menu: String // Link olabilir
    var location: String
    var city: CityTypes
    var type: RestaurantTypes
    var rank: String
    var latitude: Double?
    var longitude: Double?
}

enum CityTypes: String, Codable {
    case izmir
    case istanbul
}

enum RestaurantTypes: String, Codable {
    case restaurant
    case cafe
}

extension [Restaurant] {
    func indexOfRestaurant(withId id: Restaurant.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Restaurant {
    static var sampleData: [Restaurant] = [
        Restaurant(name: "Mersinli Ciğerci Apo", image: "MersinliCigerciApo", description: "Mersinli Ciğerci Apo, Mersin'de kurulmuş olan bir kebap lokantasıdır.İnanılmaz lezzetli yemeklerin yanı sıra sürekli yenen mezelerin de tadına doyum olmaz.Mersinli Ciğerci Apo, Mersin'de kurulmuş olan bir kebap lokantasıdır.İnanılmaz lezzetli yemeklerin yanı sıra sürekli yenen mezelerin de tadına doyum olmaz.",
                   menu: "", location: "Özkanlar", city: .izmir, type: .restaurant, rank: "4.4", latitude: 38.4558, longitude: 27.1792),
        
        Restaurant(name: "Hacı Sokakta", image: "HaciSokakta", description: "", menu: "", location: "Özkanlar", city: .izmir, type: .restaurant, rank: "4.1"),
        
        Restaurant(name: "Pavlova", image: "PavlovaCafe", description: "", menu: "", location: "Özkanlar", city: .izmir, type: .cafe, rank: "3.9")
    ] //[Restaurant]()
}
#endif
