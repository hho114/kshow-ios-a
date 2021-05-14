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
        
    }
    
    var body: some View {
        
        VStack{
            if self.status{
                HomeScreen()
                
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
                        
                        Label("Featured", systemImage: "star")
                        
                    }
                    .tag(Tab.featured)
                
                
                ShowList()
                    .tabItem {
                        
                        Label("List", systemImage: "list.bullet")
                        
                    }
                    .tag(Tab.list)
                
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environmentObject(ModelData())
        }
    }
}
