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
    var profileUrl: String
    
    
    static let `default` = Cast(id:"",name: "namecast", imageUrl: "", profileUrl: "")
    

}
