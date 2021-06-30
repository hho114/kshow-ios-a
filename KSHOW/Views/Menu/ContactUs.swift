//
//  ContactUs.swift
//  KSHOW
//
//  Created by Alex Ho on 6/25/21.
//

import SwiftUI
import MessageUI

struct ContactUs: View {
    @State var result: Result<MFMailComposeResult, Error>? = nil
      @State var isShowingMailView = false
    @State var showingWebView = false
    
    var body: some View {
        VStack(alignment: .center) {
            Label(
                title: { Text("Need Help") },
                icon: { Image(systemName: "exclamationmark.bubble") }).padding()
            Spacer()
                Button(action: {
                    self.isShowingMailView = true
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                }, label: {
                    Label(
                        title: { Text("Email") },
                        icon: { Image(systemName: "envelope") })
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 80)
                        
                })
                
                .background(LinearGradient.blackTopToBottom)
                .cornerRadius(15)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                
                .disabled(!MFMailComposeViewController.canSendMail())
                .sheet(isPresented: $isShowingMailView) {
                    MailView(result: self.$result)
                }
                

                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    showingWebView = true
                }, label: {
                    Label(
                        title: { Text("Report Issue") },
                        icon: { Image(systemName: "exclamationmark.bubble.fill") })
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 80)
                })
               
                .background(LinearGradient.blackTopToBottom)
                .cornerRadius(15)
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .sheet(isPresented: $showingWebView) {
                    OpenWebView(url: "https://github.com/xstar-solution/kshow-public/issues", isPresented: $showingWebView)
                }
            Spacer()
           
           
        }
    

    }
}

