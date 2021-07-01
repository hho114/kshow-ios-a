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
        Bugfender.enableUIEventLogging()  // optional, log user interactions automatically
//        bfprint("Bugfender Initialization")
        
        return true
      }


    
    func applicationWillTerminate(_ application: UIApplication) {
        
        bfprint("applicationWillTerminate")
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {

//            if url.absoluteString.lowercased().hasPrefix("recoverytrek://".lowercased()) {
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "kSFViewControllerCloseNotification"), object: url)
//            }

        bfprint("application open url: \(url)")
            return false
        }
    
    func applicationDidEnterBackground(_ application: UIApplication) {


      bfprint("applicationDidEnterBackground")
    }


    func applicationWillEnterForeground(_ application: UIApplication) {
        bfprint("applicationWillEnterForeground")
    }
    
    
}
