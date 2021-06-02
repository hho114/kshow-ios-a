//
//  SAWebView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/28/21.
//

import SwiftUI
import WebKit

struct VideoWebView: View {
    var url: String
    var body: some View {
        VStack{
//            PlayButton(text: "", imageName: "arrowtriangle.down") {
//
//            }
//            .frame(width: 120)
            Button(action: {
                print("Edit button was tapped")
            }) {
//                I
                HStack {
                    Spacer()
                    Image(systemName: "arrowtriangle.down")
                    
                    Spacer()
                }
            }
            
            Webview(url: URL(string: url)!)
        }
        
    }
}

struct Webview: UIViewRepresentable {
    let url: URL
    let navigationHelper = WebViewHelper()
   

    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = navigationHelper
        webview.configuration.preferences.javaScriptCanOpenWindowsAutomatically = false
        webview.allowsBackForwardNavigationGestures = false
        webview.configuration.websiteDataStore.httpCookieStore.getAllCookies { cookies in
            for cookie in cookies {
                if cookie.name == "authentication" {
                    webview.configuration.websiteDataStore.httpCookieStore.delete(cookie)
                } else {
                    print("\(cookie.name) is set to \(cookie.value)")
                }
            }
        }
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
            webview.load(request)
//        let embededHTML = "<html><body><iframe src=\"https://www.fembed.com/v/y24l0fe1dj0jqd6\" scrolling=\"no\" allowfullscreen=\"true\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" width=\"100%\" height=\"422px\"></iframe></body></html>"
//        webview.loadHTMLString(embededHTML, baseURL: nil)


        return webview
    }

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .returnCacheDataElseLoad)
        webview.load(request)
//        let embededHTML = "<html><body><iframe src=\"https://www.fembed.com/v/y24l0fe1dj0jqd6\" scrolling=\"false\" allowfullscreen=\"true\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" width=\"100%\" height=\"100%\"></iframe></body></html>"
//        webview.loadHTMLString(embededHTML, baseURL: nil)
    }
    
}

class WebViewHelper: NSObject, WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webview didFinishNavigation")
//        UserDefaults.standard.set(true, forKey: "initialVideo")
//        NotificationCenter.default.post(name: NSNotification.Name("initialVideo"), object: nil)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("didStartProvisionalNavigation")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("webviewDidCommit")
    }
    
    func webView(_ webView: WKWebView, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {

        print("didReceiveAuthenticationChallenge")
        completionHandler(.performDefaultHandling, nil)
//        if  !(UserDefaults.standard.value(forKey: "initialVideo") as? Bool ?? false) {
//            print("performDefaultHandling")
//            completionHandler(.performDefaultHandling, nil)
//
//
//        }
//        else{
//            print("cancelAuthenticationChallenge")
//            completionHandler(.cancelAuthenticationChallenge, nil)
//        }
        
    }
}
