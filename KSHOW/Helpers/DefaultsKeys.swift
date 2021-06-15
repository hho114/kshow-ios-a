//
//  DefaultKeys.swift
//  KSHOW
//
//  Created by Alex Ho on 6/15/21.
//

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    
    var isUserLogin: DefaultsKey<Bool> { .init("isUserLogin", defaultValue: false) }
    var email: DefaultsKey<String> { .init("email", defaultValue: "") }
    var pass: DefaultsKey<String> { .init("pass", defaultValue: "") }
    var permission: DefaultsKey<String> { .init("permission", defaultValue: "") }
}
