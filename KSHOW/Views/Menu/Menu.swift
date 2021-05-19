//
//  Menu.swift
//  KSHOW
//
//  Created by Alex Ho on 5/18/21.
//

import SwiftUI
import FirebaseAuth

struct Menu: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                List {
                    NavigationLink(destination: ProfileHost()){
                        Label("Profile", systemImage: "person.crop.circle").padding()
                        
                    }
                    NavigationLink(destination: ProfileHost()){
                        Label("Setting", systemImage: "slider.horizontal.3").padding()
                        
                    }
                    NavigationLink(destination: ProfileHost()){
                        Label("Contact Us", systemImage: "exclamationmark.bubble").padding()
                        
                    }
                    Button(action: {
                        self.SignOut()
                    }) {
                        Label("Sign Out", systemImage: "arrow.forward.square").padding()
                    }
                    
                    
                }
//                .navigationTitle("Menu")
                .listStyle(SidebarListStyle())
                

            }
        }
    }
    
    func SignOut() {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
        UserDefaults.standard.set(false, forKey: "status")
        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        
    } catch let signOutError as NSError {
      print ("Error signing out: %@", signOutError)
    }
      
    }
}

struct Menu_Previews: PreviewProvider {
    static var previews: some View {
        Menu()
    }
}
