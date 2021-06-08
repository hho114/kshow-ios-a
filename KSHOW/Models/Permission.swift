//
//  Permission.swift
//  KSHOW
//
//  Created by Alex Ho on 5/21/21.
//

import Foundation

struct Permission: Codable {
    
    var id: String
    var categoryType: [String]
    var features: [String]
    
    static let `default` = Permission(id: "permission",categoryType: [],features: [])
}
