//
//  Show.swift
//  KSHOW
//
//  Created by Alex Ho on 5/20/21.
//

import Foundation

struct Show: Codable, Identifiable {
    
    var id: String
    var name: String
    var casts: [String]
    var currentEpisode: String
    var description: String
    var rating: Double
    var isFeatured: Bool
    var thumbnailImageUrl: String
    var trailerUrl: String
    
    
    static let `default` = Show( id: "00000",name: "kshow",casts: [], currentEpisode: "", description: "", rating: 0.0, isFeatured: false, thumbnailImageUrl: "",trailerUrl: "")
    

}
