//
//  Category.swift
//  KSHOW
//
//  Created by Alex Ho on 5/20/21.
//

import Foundation
//
//  Show.swift
//  KSHOW
//
//  Created by Alex Ho on 5/20/21.
//

import Foundation

struct Category: Codable {
    
    
    var lastest: [String]
    var popular: [String]
    var trending: [String]
   
    
    
    static let `default` = Category( lastest: [], popular: [], trending:[])
    

}
