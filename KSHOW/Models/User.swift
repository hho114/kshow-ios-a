//
//  User.swift
//  KSHOW
//
//  Created by Alex Ho on 5/14/21.
//

import Foundation
import SwiftUI

//class User {
//    var uid: String
//    var email: String?
//    var displayName: String?
//
//    init(uid: String, displayName: String?, email: String?) {
//        self.uid = uid
//        self.email = email
//        self.displayName = displayName
//    }
//
//}

struct User: Codable, Identifiable {
    
    var id: String? = nil
    var email: String? = nil
    var userName: String? = nil
    var permission: String? = nil
    var photoUrl: String? = nil
    var vip: Bool? = nil
    
//    required init?( map: Map){
//     }
//
//     func mapping(map: Map) {
//       self.id  <- map["id"]
//       self.userName   <- map["username"]
//        self.email <- map["email"]
//     }


}
