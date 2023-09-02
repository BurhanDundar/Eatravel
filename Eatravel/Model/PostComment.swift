//
//  PostComment.swift
//  Eatravel
//
//  Created by Burhan Dündar on 2.09.2023.
//

import Foundation

struct PostComment: Identifiable, Codable {
    var id: String = UUID().uuidString
    var _id: String { id }
    var parentId: String
    var text: String
    var date: String
    var likeCount: Int // ?
}
