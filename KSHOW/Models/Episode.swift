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
//    var description: String
    var likes: Int
    var refCommentId: String
    var videoUrl: String
    var views: Int
    var dateRelease: Int
    var season: Int
    var length: Int
   
//    var id: Int {
//        episodeNumber
//    }
    
    static let `default` = Episode(id: "ep",episodeNumber: 1, likes: 0, refCommentId:"", videoUrl:"", views: 0, dateRelease: 0, season: 0, length: 0)
    

}
