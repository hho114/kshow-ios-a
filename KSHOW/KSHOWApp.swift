//
//  KSHOWApp.swift
//  KSHOW
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI
import Firebase

@main
struct KSHOWApp: App {
    
    init() {
        FirebaseApp.configure()
      }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
