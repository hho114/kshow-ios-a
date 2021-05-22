//
//  Permission.swift
//  KSHOW
//
//  Created by Alex Ho on 5/21/21.
//

import Foundation

struct Permission: Codable, Identifiable {
    
    var id: String
    var categoryType: [String]
    var features: [String]
    
    static let `default` = Permission(id:"000",categoryType: [],features: [])
}
