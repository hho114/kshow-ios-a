//
//  HistoryEpisode.swift
//  KSHOW
//
//  Created by Alex Ho on 6/17/21.
//


import Foundation
struct HistoryEpisode: Hashable, Codable, Identifiable {
    
    var id: String
    var episodeName: String
    var episodeNumber: String
    var imageUrl: String
    var timestamp: Double
    var videoUrl: String
   
   
//    var id: Int {
//        episodeNumber
//    }
    
    static let `default` = HistoryEpisode(id: "ep",episodeName: "",episodeNumber: "", imageUrl:"", timestamp: 0.0, videoUrl: "")
    

}
