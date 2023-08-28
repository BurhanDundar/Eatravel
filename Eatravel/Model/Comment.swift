//
//  Comment.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 25.08.2023.
//

import Foundation

struct Comment: Identifiable, Codable {
    var id: String = UUID().uuidString
    var _id: String { id }
    var postId: String // id
    var parent: String // id
    var rate: RateRange
    var text: String
    var date: String
    var images: [String]
}

enum RateRange: Int, Codable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
}

extension [Comment] {
    func indexOfComment(withId id: Comment.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Comment {
    static var sampleData: [Comment] = [
        Comment(postId: "", parent: "", rate: .five, text: "This is the first comment", date: "", images: []),
        Comment(postId: "", parent: "", rate: .five, text: "This is the second comment", date: "", images: []),
        Comment(postId: "", parent: "", rate: .five, text: "This is the third comment", date: "", images: []),
        
    ]
}
#endif
