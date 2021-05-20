//
//  User.swift
//  KSHOW
//
//  Created by Alex Ho on 5/14/21.
//

import Foundation
import SwiftUI


struct User: Codable, Identifiable {
    
    var id: String
    var email: String
    var username: String
//    var prefersNotifications = true
    var permission: String
    var photoUrl: String
    var vip: Bool
    
    static let `default` = User( id: "00000",email: "email.com",username: "user", permission: "", photoUrl: "",vip: false)
    

}
