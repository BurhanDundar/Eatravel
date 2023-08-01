//
//  LoginResponseModel.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 29.07.2023.
//

import Foundation

struct LoginResponseModel: Codable {
    var status: String?
    var msg: String?
    var _id: String?
    var fullname: String?
    var username: String?
}
