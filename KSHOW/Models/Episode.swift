//
//  Episode.swift
//  KSHOW
//
//  Created by Alex Ho on 5/24/21.
//

import Foundation
struct Episode: Hashable, Codable, Identifiable {
    
    var id: String
    var episodeNumber: Int
    var description: String
    var likes: Int
    var refCommentId: String
    var imageUrl: String
    var videoUrl: String
    var views: Int
    var dateRelease: Int
    
    
    static let `default` = Episode( id: "00000",episodeNumber: 1, description: "", likes: 0, refCommentId:"", imageUrl: "",videoUrl:"", views: 0, dateRelease: 0)
    

}
