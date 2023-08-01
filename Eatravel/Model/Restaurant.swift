//
//  Restaurant.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 31.07.2023.
//

import Foundation

struct Restaurant: Identifiable {
    var id: String = UUID().uuidString
    var name: String
    var location: String
    //var type: Enum
    
}
