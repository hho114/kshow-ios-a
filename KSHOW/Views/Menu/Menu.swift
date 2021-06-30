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
    @State var showingProfile: Bool = false
    @State var showingHelp: Bool = false
    @State var showingFAQ: Bool = false
    @State var showingSignoutAlert = false
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 20) {
                List {
//                    NavigationLink(destination: ProfileHost()){
//
//
//                    }.onTapGesture {
//                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//
//                    }
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        showingProfile = true
                    }, label: {
                        Label("Profile", systemImage: "person.crop.circle").padding()
                    }).sheet(isPresented: $showingProfile, content: {
                        ProfileHost().environmentObject(modelData)
                    })
                    
//                    NavigationLink(destination: ProfileHost()){
//                        Label("Setting", systemImage: "slider.horizontal.3").padding()
//                        
//                    }
                    //TODO: Create contact new page with contact and report issue button
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        showingHelp = true
                    }, label: {
                        Label("Need Help", systemImage: "exclamationmark.bubble").padding()
                    }).sheet(isPresented: $showingHelp, content: {
                        ContactUs()
                    })
                    
                    
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        showingFAQ = true
                    }, label: {
                        Label("FAQ", systemImage: "questionmark").padding()
                    }).sheet(isPresented: $showingFAQ, content: {
                        FAQView()
                    })
                    
                   
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        showingSignoutAlert = true
                        
                    }) {
                        Label("Sign Out", systemImage: "arrow.forward.square").padding()
                    }
                    .alert(isPresented: $showingSignoutAlert) { () -> Alert in
                        let primaryButton = Alert.Button.default(Text("Yes")) {
                            bfprint("Yes signout button pressed")
//                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                            self.SignOut()
                        }
                        let secondaryButton = Alert.Button.cancel(Text("No")) {
                            bfprint("No signout button pressed")
//                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                        }
                        return Alert(title: Text("Notice"), message: Text("If you sign out, the history watch will be clear out.\n\nDo you want to sign out?"), primaryButton: primaryButton, secondaryButton: secondaryButton)
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
        UserDefaults.standard.set(false, forKey: "rememberLogin")
        UserDefaults.standard.set("", forKey: "pass")
        UserDefaults.standard.set(nil, forKey: "historyEpisodes")
        
        modelData.isSignin = false
//        Defaults[\.isUserLogin] = false
        modelData.shows = []
        modelData.user = User.default
        modelData.permission = Permission.default
        modelData.casts = []
        modelData.historyEpisodes = []
        
        
        
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

