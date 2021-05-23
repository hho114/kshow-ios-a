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

    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
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
                    }

                   
                    
                }
            }
            
            
        }
    }
    
    func fetchUserData(userId: String) {

        Database.database().reference().child("users").child(userId).observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let model = try FirebaseDecoder().decode(User.self, from: value)
                print(model)
                modelData.user = model
                fetchPermission()
            } catch let error {
                print(error)
            }
        })
    }
    
    func fetchPermission() {

        Database.database().reference().child("permissions").child(modelData.user.permission).observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let model = try FirebaseDecoder().decode(Permission.self, from: value)
                print(model)
                modelData.permission = model
                fetchShows()
            } catch let error {
                print(error)
            }
        })
    }
    
    func fetchShows() {

        Database.database().reference().child("wiki").observe(.value) { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
            
            do {
                let model = try FirebaseDecoder().decode(Show.self, from: child.value as Any)
                print(model)
                modelData.shows.append(model)

            } catch let error {
                print(error)
            }
          }

        }
        
    }
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


