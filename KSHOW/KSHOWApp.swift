//
//  KSHOWApp.swift
//  KSHOW
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI
import Firebase
import ObjectMapper


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
        
//        let userID = Auth.auth().currentUser?.uid
//        let ref = Database.database().reference()
//        ref.child("users").child("-MS9J6ELc7sbnfnWqZp3").observeSingleEvent(of: .value, with: { (snapshot) in
//          // Get user value
//    //      let value = snapshot.value as? NSDictionary
//    //      let username = value?["username"] as? String ?? ""
//    //      let user = User(username: username)
//            guard let value = snapshot.value as? [String: Any] else { return }
//                    do {
//                        let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
//                        let user = try JSONDecoder().decode(User.self, from: jsonData)
//                        print(user)
//
//
//                    } catch let error {
//                        print(error)
//                    }
//
//
//          }) { (error) in
//            print(error.localizedDescription)
//        }
       
        
        return true
    }
}
