//
//  SAWebView.swift
//  KSHOW
//
//  Created by Alex Ho on 5/28/21.
//

import SwiftUI
import WebKit
import AVKit


struct VideoWebView: View {
    var url: String
    @Binding var isPresented: Bool
    var body: some View {
        VStack{

//            Button(action: {
//                print("close button was tapped")
//                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
//
//                isPresented = false
//            }) {
//                //            I
////                HStack {
////                  Spacer()
////                    Spacer()
////                }.background(Color.black)
//                Image(systemName: "chevron.compact.down").foregroundColor(Color.white)
//
//            }
            Button(action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                isPresented = false
            }, label: {
                HStack{
                    Image(systemName: "chevron.compact.down").padding(.vertical, 4).frame(maxWidth: .infinity).foregroundColor(Color.white)

                }
            })
            
            Webview(url: URL(string: url)!)
//            VideoPlayer(player: AVPlayer(url:  URL(string: url)!))
        }
        
    }
}

struct Webview: UIViewRepresentable {
    let url: URL
    let navigationHelper = WebViewHelper()
   

    func makeUIView(context: UIViewRepresentableContext<Webview>) -> WKWebView {
        let webview = WKWebView()
        webview.navigationDelegate = navigationHelper
        // create javascript code as string
        let javascriptSource = "window.post.accept({shouldShowAlert: false})"

        // evaluate it on webView
        webview.evaluateJavaScript(javascriptSource)
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
        let request = URLRequest(url: self.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
            webview.load(request)
//        let embededHTML = "<html><body><iframe src=\"\(self.url)\" scrolling=\"no\" allowfullscreen=\"true\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" width=\"100%\" height=\"100%\"></iframe></body></html>"
//        webview.loadHTMLString(embededHTML, baseURL: nil)


        return webview
    }
    

    func updateUIView(_ webview: WKWebView, context: UIViewRepresentableContext<Webview>) {
        let request = URLRequest(url: self.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData)
        webview.load(request)
//        let embededHTML = "<html><body><iframe src=\"\(self.url)\" scrolling=\"no\" allowfullscreen=\"true\" webkitallowfullscreen=\"true\" mozallowfullscreen=\"true\" width=\"100%\" height=\"100%\"></iframe></body></html>"
//        webview.loadHTMLString(embededHTML, baseURL: nil)
    }
    
}

class WebViewHelper: NSObject, WKNavigationDelegate {
    
    
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("webview didFinishNavigation")

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
        
    }

//    func webView(_ webView: WKWebView, didReceiveServerRedirectForProvisionalNavigation navigation: WKNavigation!) {
//        print("didReceiveServerRedirectForProvisionalNavigation navigation")
//    }
//    
//    
//    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, preferences: WKWebpagePreferences, decisionHandler: @escaping (WKNavigationActionPolicy, WKWebpagePreferences) -> Void) {
//        print("decidePolicyFor navigationAction")
//    }
//    
//    func webView(_ webView: WKWebView, authenticationChallenge challenge: URLAuthenticationChallenge, shouldAllowDeprecatedTLS decisionHandler: @escaping (Bool) -> Void) {
//        print("authenticationChallenge challenge")
//    }
//    
//    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
//        print("didFail navigation")
//    }
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("webViewWebContentProcessDidTerminate")
    }
}

//extension AVPlayerViewController {
//    // override 'viewWillDisappear'
//    open override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        // now, check that this ViewController is dismissing
//        if self.isBeingDismissed == false {
//            return
//        }
//        print("viewWillDisappear")
//        // and then , post a simple notification and observe & handle it, where & when you need to.....
//        NotificationCenter.default.post(name: .kAVPlayerViewControllerDismissingNotification, object: nil)
//    }
//
//
//}
//
//extension Notification.Name {
//static let kAVPlayerViewControllerDismissingNotification = Notification.Name.init("dismissing")
//}
