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
        
        case search
        
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
            
            
            }.navigationBarTitle("")
            .navigationBarHidden(true)
    }
    
    

    struct HomeScreen: View{
        @EnvironmentObject var modelData: ModelData
        @State private var selection: Tab = .featured
        
        var body: some View{
            
            TabView(selection: $selection) {
                
                
                CategoryHome()
                    .tabItem {
                        
                        Label("Home", systemImage: "house")
                        
                    }
                    .tag(Tab.featured)
                
                
                ShowList()
                    .tabItem {
                        
                        Label("Follow", systemImage: "checkmark")
                        
                    }
                    .tag(Tab.list)
                
               
//                SearchView()
//                    .tabItem {
//                        Image(systemName: "magnifyingglass")
//                        Text("Search")
//                    }.tag(Tab.search)
//                
                Menu()
                    .tabItem {
                        
                        Label("Menu", systemImage: "list.bullet")
                        
                    }
                    .tag(Tab.menu)
                    
                
            }
            .transition(.slide).animation(.easeInOut(duration: 0.5))
            
        }
    }
    

    
//    struct ContentView_Previews: PreviewProvider {
//        static var previews: some View {
//            ContentView().environmentObject(ModelData())
//        }
//    }
}


