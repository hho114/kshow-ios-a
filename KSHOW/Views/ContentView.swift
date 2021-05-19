//
//  ContentView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    enum Tab {
        
        case featured
        
        case list
        
        case menu
        
    }
    
    var body: some View {
        

            VStack{
               
            if self.status{
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
    
    struct HomeScreen: View{
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
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(ModelData())
        }
    }
}
