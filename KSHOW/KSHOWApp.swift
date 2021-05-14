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
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    
    @StateObject private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            
            ContentView().environmentObject(modelData)
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
//        let ref = Database.database().reference()
//        
//        ref.child("users").child("-MS9J6ELc7sbnfnWqZp3").observeSingleEvent(of: .value, with: { (snapshot) in
//            print("Getting data")
//            // Get user value
//            let value = snapshot.value as? NSDictionary
//            let username = value?["username"] as? String ?? ""
//            print(username)
//            print("jsondata: \(value!)")
//            //let user = User(username: username)
//            // ...
//        }) { (error) in
//            print("Can not access data")
//            print(error.localizedDescription)
//        }
        
        return true
    }
}
