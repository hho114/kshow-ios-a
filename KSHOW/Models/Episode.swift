//
//  Episode.swift
//  KSHOW
//
//  Created by Alex Ho on 5/24/21.
//

import Foundation
struct Episode: Hashable, Codable, Identifiable {
    
    var id: String
    var episodeNumber: String
    var likes: String
    var refCommentId: String
    var videoUrl: String
    var views: String
    var dateRelease: String
    var season: String
    var length: String
   
    
    static let `default` = Episode(id: "ep",episodeNumber: "0", likes: "0", refCommentId:"0", videoUrl:"url", views: "0", dateRelease: "1", season: "0", length: "1")
    

}
