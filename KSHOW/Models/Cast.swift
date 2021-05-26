//
//  Cast.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import Foundation



struct Cast: Codable, Identifiable {
    
    var id: String
    var name: String
    var imageUrl: String

    
    static let `default` = Cast( id: "00000",name: "namecast", imageUrl: "n/a")
    

}
