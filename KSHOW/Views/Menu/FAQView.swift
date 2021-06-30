//
//  FAQ.swift
//  KSHOW
//
//  Created by Alex Ho on 6/25/21.
//

import SwiftUI

struct FAQView: View {
    let items: [FAQ] = [.question1, .question2, .question3, .question4, .question5,.question6]

        var body: some View {
            VStack(alignment: .center){
                Label(
                    title: { Text("FAQ") },
                    icon: { Image(systemName: "questionmark") }).padding()
                List(items, children: \.items) { row in
    //                Image(systemName: row.icon)
                    Text(row.text)
                }
            }
            
        }
}

//struct FAQ: Identifiable {
//    let id = UUID()
//    let name: String
//    let icon: String
//    var items: [FAQ]?
//
//    // some example websites
//    static let apple = FAQ(name: "Apple", icon: "1.circle")
//    static let bbc = FAQ(name: "BBC", icon: "square.and.pencil")
//    static let swift = FAQ(name: "Swift", icon: "bolt.fill")
//    static let twitter = FAQ(name: "Twitter", icon: "mic")
//
//
//    // some example groups
//    static let example1 = FAQ(name: "Why we create KSHOW application?", icon: "star", items: [FAQ.apple, FAQ.bbc, FAQ.swift, FAQ.twitter])
//    static let example2 = FAQ(name: "Recent", icon: "timer", items: [FAQ.apple, FAQ.bbc, FAQ.swift, FAQ.twitter])
//    static let example3 = FAQ(name: "Recommended", icon: "hand.thumbsup", items: [FAQ.apple, FAQ.bbc, FAQ.swift, FAQ.twitter])
//}

struct FAQ: Identifiable {
    let id = UUID()
    let text: String
    var items: [FAQ]?

    // some example websites
    static let answer1 = FAQ(text: "First of all, we do not create KSHOW to compete with any big stream service company. We create this application as a show case that we have potential to build up a fullstack mobile application for media service companies and industries. Second, we love to watch variety shows, therefore, we want to share with everyone who have same interest with us.")
    static let answer2 = FAQ(text: "Because we are in low budget, therefore, we need to storage videos on free hosting service, and we can not control the advertises. However, the advertise will not harm your device, and mostly will disappear if you tap on it.")
    static let answer3 = FAQ(text: "Go to Menu -> Need Help -> Report Issue, this will the best way to contact us. You need to have a github account in order to create issue or feature request.")
    static let answer4 = FAQ(text: "KSHOW implement lastest navigation technology of IOS without home button by using modal open new page and swipe down to close current page")
    static let answer5 = FAQ(text: "Currently we do not store user history watch on cloud database, we will implement this feature in future version.")
    static let answer6 = FAQ(text: "Go to Menu -> Need Help -> Email, and you can send us an email.")
    

    // some example groups
    static let question1 = FAQ(text: "Why we create KSHOW?", items: [FAQ.answer1])
    static let question2 = FAQ(text: "Why I see advertise pop up when I open video player?", items: [FAQ.answer2])
    static let question3 = FAQ(text: "How can I report issue or request new show in the KSHOW app?", items: [FAQ.answer3])
    static let question4 = FAQ(text: "How can I navigate in application?", items: [FAQ.answer4])
    static let question5 = FAQ(text: "Why my history watch is clear out when I sign out?", items: [FAQ.answer5])
    static let question6 = FAQ(text: "Still have question?", items: [FAQ.answer6])
}
