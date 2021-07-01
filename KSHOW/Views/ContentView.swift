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
//import SwiftyUserDefaults

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    @State var email = UserDefaults.standard.value(forKey: "email") as? String ?? ""
    @State var pass = UserDefaults.standard.value(forKey: "pass") as? String ?? ""
  
   
    enum Tab {
        
        case featured
        
        case list
        
        case search
        
        case menu
        
    }
    
    var body: some View {
        
            
                        VStack{
                           
                            if modelData.isSignin {
                            
                            VStack{
            
                                HomeScreen()
                            }
                            
                            
                        } else {
                            VStack{
                                Login()
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
                        
                        Label("Home", systemImage: "house")
                        
                    }
                    .tag(Tab.featured)
                    
                
                if (modelData.historyEpisodes.count > 0)
                {
                    HistoryEpisodeView()
                        .tabItem {
                        
                        Label("History", systemImage: "clock")
                        
                    }
                    .tag(Tab.list)
                   
                }
               
                SearchView()
                    .tabItem {
                        
                        Label("Search", systemImage: "magnifyingglass")
                    }
                    .tag(Tab.search)
                    
              
                Menu()
                    .tabItem {
                        
                        Label("Menu", systemImage: "slider.horizontal.3")
                    }
                    .tag(Tab.menu)
                    
                
            }.onAppear{
                StoreReviewHelper.checkAndAskForReview()
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


