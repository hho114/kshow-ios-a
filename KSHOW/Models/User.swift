//
//  User.swift
//  KSHOW
//
//  Created by Alex Ho on 5/14/21.
//

import Foundation
import SwiftUI


struct User: Codable {
    var id: String
    var email: String
    var username: String
    var permission: String
    var photoUrl: String
    var vip: Bool
    
    
    static let `default` = User( id: "00",email: "email.com",username: "user", permission: "", photoUrl: "",vip: false)
    

}
