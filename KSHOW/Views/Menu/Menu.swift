//
//  Menu.swift
//  KSHOW
//
//  Created by Alex Ho on 5/18/21.
//

import SwiftUI
import FirebaseAuth
import StoreKit
//import SwiftyUserDefaults

struct Menu: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                List {
                    NavigationLink(destination: ProfileHost()){
                        Label("Profile", systemImage: "person.crop.circle").padding()
                        
                    }
                    
//                    NavigationLink(destination: ProfileHost()){
//                        Label("Setting", systemImage: "slider.horizontal.3").padding()
//                        
//                    }
                    //TODO: Create contact new page with contact and report issue button
                    Button(action: {
                        
                    }, label: {
                        Label("Need Help", systemImage: "exclamationmark.bubble").padding()
                    })
                    
                   
                    Button(action: {
                        self.SignOut()
                    }) {
                        Label("Sign Out", systemImage: "arrow.forward.square").padding()
                    }
                    
                    
                }

                
                .listStyle(SidebarListStyle())
                

            }
            .navigationTitle("")
//            .navigationBarHidden(true)
        }
    }
    
    func SignOut() {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
//        UserDefaults.standard.set(false, forKey: "status")
//        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        UserDefaults.standard.set(false, forKey: "biounlock")
        modelData.isSignin = false
//        Defaults[\.isUserLogin] = false
        modelData.shows = []
        modelData.user = User.default
        modelData.permission = Permission.default
        modelData.casts = []
        
        
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
    }
}

//struct Menu_Previews: PreviewProvider {
//    static var previews: some View {
//        Menu()
//    }
//}

