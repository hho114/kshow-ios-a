//
//  KSHOWApp.swift
//  KSHOW
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI
import Firebase
@_exported import BugfenderSDK


@main
struct KSHOWApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @StateObject private var modelData = ModelData()
    var window: UIWindow?

   
    var body: some Scene {
        WindowGroup {
            
            ContentView()
                .environmentObject(modelData)
            
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        StoreReviewHelper.incrementAppOpenedCount()
        Bugfender.activateLogger("uIKft1VrExpy7RuyrvuLL9Xa7WhBCguA")
        Bugfender.enableCrashReporting()
//        Bugfender.enableUIEventLogging()  // optional, log user interactions automatically
//        bfprint("Bugfender Initialization")
        return true
      }

//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        FirebaseApp.configure()
////        UserDefaults.standard.set(false, forKey: "status")
////        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//
////        let userID = Auth.auth().currentUser?.uid
////        let ref = Database.database().reference()
////        ref.child("users").child("-MS9J6ELc7sbnfnWqZp3").observeSingleEvent(of: .value, with: { (snapshot) in
////          // Get user value
////    //      let value = snapshot.value as? NSDictionary
////    //      let username = value?["username"] as? String ?? ""
////    //      let user = User(username: username)
////            guard let value = snapshot.value as? [String: Any] else { return }
////                    do {
////                        let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
////                        let user = try JSONDecoder().decode(User.self, from: jsonData)
////                        print(user)
////
////
////                    } catch let error {
////                        print(error)
////                    }
////
////
////          }) { (error) in
////            print(error.localizedDescription)
////        }
//
//
//
//        return true
//    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        
    }
    
    
}
