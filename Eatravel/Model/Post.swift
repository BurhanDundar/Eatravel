//
//  Post.swift
//  Eatravel
//
//  Created by Burhan Dündar on 2.09.2023.
//

import Foundation

struct Post: Identifiable, Codable {
    var _id: String = UUID().uuidString
    var id: String? { _id }
    var userId: String?
    var image: String?
    var description: String?
    var likeCount: Int?
    var comments: [PostComment]?
    var createdAt: String?
}

extension [Post] {
    func indexOfPost(withId id: Post.ID) -> Self.Index {
        guard let index = firstIndex(where: { $0.id == id }) else {
            fatalError()
        }
        return index
    }
}

#if DEBUG
extension Post {
    static var sampleData: [Post] = [
        Post(image: "", description: "This is the first post description", likeCount: 1, createdAt: "12 Temmuz 2023"),
        Post(image: "", description: "This is the second post description", likeCount: 2, createdAt: "17 Ağustos 2023"),
        Post(image: "", description: "This is the second post description", likeCount: 2, createdAt: "17 Ağustos 2023"),
        Post(image: "", description: "This is the second post description", likeCount: 2, createdAt: "17 Ağustos 2023")
    ]
}
#endif

