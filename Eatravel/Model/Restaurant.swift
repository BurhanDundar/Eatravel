//
//  Restaurant.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.07.2023.
//

import Foundation

struct Restaurant: Identifiable, Codable {
    var _id: String = UUID().uuidString
    var id: String { _id }
    var name: String
    var image: String
    var location: String
    var city: CityTypes
    var type: RestaurantTypes
    var rank: String
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
        Restaurant(name: "Mersinli Ciğerci Apo", image: "MersinliCigerciApo", location: "Özkanlar", city: .izmir, type: .restaurant, rank: "4.4"),
        Restaurant(name: "Hacı Sokakta", image: "HaciSokakta", location: "Özkanlar", city: .izmir, type: .restaurant, rank: "4.1"),
        Restaurant(name: "Pavlova", image: "PavlovaCafe", location: "Özkanlar", city: .izmir, type: .cafe, rank: "3.9")
    ] //[Restaurant]()
}
#endif
