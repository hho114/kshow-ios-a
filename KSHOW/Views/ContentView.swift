//
//  ContentView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import CodableFirebase

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
//    @StateObject private var modelData = ModelData()

    @State var status = false
    @State var email = UserDefaults.standard.value(forKey: "email") as? String ?? ""
    @State var pass = UserDefaults.standard.value(forKey: "pass") as? String ?? ""
//  
   
    enum Tab {
        
        case featured
        
        case list
        
        case menu
        
    }
    
    var body: some View {
        

            VStack{
               
            if self.status {
                
                VStack{
                    
                    HomeScreen()
                }
                .onAppear{
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                        
                        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    }
                    
                }
                
                
            } else {
                VStack{
                    Login()
                }
                .onAppear{
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                        
                        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
//                        self.resetAccount()
                    }

                   
                    
                }
            }
            
            
        }
    }
    
    
//    func resetAccount() {
//        if Auth.auth().currentUser != nil{
//            let firebaseAuth = Auth.auth()
//        do {
//          try firebaseAuth.signOut()
//            UserDefaults.standard.set(false, forKey: "status")
//            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
//            modelData.shows = []
//            modelData.user = User.default
//            modelData.permission = Permission.default
//
//
//        } catch let signOutError as NSError {
//          print ("Error signing out: %@", signOutError)
//        }
//        }
//
//    }
    

    struct HomeScreen: View{
        @EnvironmentObject var modelData: ModelData
        @State private var selection: Tab = .featured
        
        var body: some View{
            TabView(selection: $selection) {
                
                
                CategoryHome()
                    .tabItem {
                        
                        Label("", systemImage: "house")
                        
                    }
                    .tag(Tab.featured)
                
                
                ShowList()
                    .tabItem {
                        
                        Label("", systemImage: "star")
                        
                    }
                    .tag(Tab.list)
                
               
//                ShowList()
//                    .tabItem {
//
//                        Label("", systemImage: "square.and.arrow.down")
//
//                    }
//                    .tag(Tab.list)
                
                Menu()
                    .tabItem {
                        
                        Label("", systemImage: "list.bullet")
                        
                    }
                    .tag(Tab.menu)
                    
                
            }
            .transition(.slide).animation(.easeInOut(duration: 0.5))
            .onAppear{
                
            }
        }
    }
    

    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView().environmentObject(ModelData())
//        }
//    }
}


