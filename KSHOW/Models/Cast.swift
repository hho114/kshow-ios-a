//
//  Cast.swift
//  KSHOW
//
//  Created by Alex Ho on 5/25/21.
//

import Foundation



struct Cast: Codable, Identifiable {
    
   
    var name: String
    var imageUrl: String
    var profileUrl: String
    
    var id: String{
        name
    }
    
    static let `default` = Cast(name: "namecast", imageUrl: "", profileUrl: "")
    

}
