//
//  SignUp.swift
//  KSHOW
//
//  Created by Alex Ho on 5/14/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
//import SwiftyUserDefaults

struct SignUp: View{
    @EnvironmentObject var modelData: ModelData
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    
    @State var color = Color.black.opacity(0.7)
    
    @State var visible = false
    @State var revisible = false
    
    @State var alert = false
    @State var error = ""
    @State var title = ""
    @State var startSignup = false
    @State private var checked = true
    @State private var isNeedVerify = false
    @Environment(\.presentationMode) var presentationMode
//    @Binding var isPresented: Bool
    let borderColor = Color(red: 107.0/255.0, green: 164.0/255.0, blue: 252.0/255.0)
    
    var body: some View{
//        VStack(){
            
//            GeometryReader{_ in
                
                LoadingView(isShowing: $startSignup){
                    VStack{
                    Image("kshow_logo").resizable().frame(width: 150.0, height: 150.0, alignment: .top).cornerRadius(25)
                    
                    Text("Sign up a new account")
                        .font(.title)
                        .fontWeight(.bold)
//                        .foregroundColor(self.color)
                        .padding(.top, 15)
                    
                    TextField("Email",text:self.$email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                        .padding()
                        .background(RoundedRectangle(cornerRadius:6).stroke(self.borderColor,lineWidth:2))
                        .padding(.top, 0)
                    
                    HStack(spacing: 15){
                        VStack{
                            if self.visible {
                                TextField("Password", text: self.$pass)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Password", text: self.$pass)
                                    .autocapitalization(.none)
                                    
                            }
                        }
                        
                        Button(action: {
                            self.visible.toggle()
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }) {
                            
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .opacity(0.8)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 6)
                    .stroke(self.borderColor,lineWidth: 2))
                    .padding(.top, 10)
                    
                    
                    // Confirm password
                    HStack(spacing: 15){
                        VStack{
                            if self.revisible {
                                TextField("Confirm Password", text: self.$repass)
                                    .autocapitalization(.none)
                            } else {
                                SecureField("Confirm Password", text: self.$repass)
                                    .autocapitalization(.none)
                            }
                        }
                        
                        Button(action: {
                            self.revisible.toggle()
                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        }) {
                            //Text(/*@START_MENU_TOKEN@*/"Button"/*@END_MENU_TOKEN@*/)
                            Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                                .opacity(0.8)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 6)
                    .stroke(self.borderColor,lineWidth: 2))
                    .padding(.top, 10)
                    
                    
                        Text("By tapping SIGN UP, you agree to the ")
                                    HStack(spacing: 0) {
                                        Link("privacy policy", destination: URL(string: "https://github.com/xstar-solution/kshow-public/blob/main/docs/PrivacyPolicy.md")!)
                                        Text(" and ")
                                        Link("terms of service", destination: URL(string: "https://github.com/xstar-solution/kshow-public/blob/main/docs/TermAndService.md")!)
                                        Text(".")
                                    }
                    // Sign up button
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        self.startSignup = true
                        self.Register()
                        
                        
                    }) {
                        Text("SIGN UP")
                            .font(.system(size: 16, weight: .black, design: .rounded))
                            .foregroundColor(Color(UIColor.label))
//                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(LinearGradient.bluePurple)
                    .cornerRadius(15)
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    .padding(.top, 15)
                    .alert(isPresented: self.$alert){()->Alert in
                        let button = Alert.Button.default(Text("Ok")) {
                            bfprint("Ok button pressed")
//                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                            if isNeedVerify ||  modelData.isSignin{
                                self.presentationMode.wrappedValue.dismiss()

                            }
                        }
                        return Alert(title: Text("\(self.title)"), message: Text("\(self.error)"), dismissButton:
                            button)
                    }
                        
                        HStack(spacing: 5){
                            Text("Already have an account?")
                            
            
                            Button(action: {
                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                                self.presentationMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Sign In")
                                .fontWeight(.bold)
            //                        .foregroundColor(Color(UIColor.label))
                            })
                            
                            
                        }.padding(.top, 30)
                    
                }.padding(.horizontal, 25)
                    
                }
//                .padding(.horizontal, 25)
//            }
//        }
    }
    
    func Register(){
        print("Start verify")
        let locale = Locale.current
        bfprint("Region: \(locale.regionCode ?? "n/a")")
        var isSimulator = false
        #if targetEnvironment(simulator)
            isSimulator = true
        bfprint("Using SIMULATOR")
        #endif
        
        if locale.regionCode == "US" || isSimulator {
            if self.email != ""{
                
                if self.pass == self.repass{
                    
                    Auth.auth().createUser(withEmail: self.email, password: self.pass) { (res, err) in
                        
                        if err != nil{
                            print(err!.localizedDescription)
                            self.error = err!.localizedDescription
                            self.title = "Sign up error"
                            self.alert.toggle()
                            self.startSignup = false
                            return
                        }
                        
                        print("success")

                        if let user = res?.user{
    //                        let token = email.components(separatedBy: "@")
    //                        let username = token[0]
                            let ref = Database.database().reference()
                            ref.child("users").child(user.uid).setValue(["id": user.uid,"email": self.email])
                            self.startSignup = false
                            if user.isEmailVerified
                            {
                                print("Login success!")
    //                            UserDefaults.standard.set(true, forKey: "status")
    //                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                                UserDefaults.standard.set(email, forKey: "email")
                                UserDefaults.standard.set(pass, forKey: "pass")
                                modelData.isSignin = true
    //                            Defaults[\.isUserLogin] = true
    //                            Defaults[\.email] = email
    //                            Defaults[\.password] = pass
                            }
                            else
                            {
                                print("User need verify email")
                                isNeedVerify = true
                                    
                                    user.sendEmailVerification { (error) in
                                    if error != nil{
                                        self.error = error?.localizedDescription ?? "Email verify error, please try again"
                                        self.title = "Verify Error"
                                        self.alert.toggle()
                                    }
                                    else{
                                        UserDefaults.standard.set(email, forKey: "email")
    //                                    UserDefaults.standard.set(pass, forKey: "pass")
    //                                    modelData.isSignin = false
                                        self.error = "Checkout your email \(email) that is used to sign up and verify your email in order to login"
                                        self.title = "Verify"
                                        self.alert.toggle()
    //                                    self.presentationMode.wrappedValue.dismiss()
                                    }
                                    
                                    }
                                

                            }
                        }
                    }
                }
                else{
                    
                    self.error = "Password mismatch"
                    self.title = "Sign up error"
                    self.alert.toggle()
                    self.startSignup = false
                }
            }
            else{
                self.title = "Sign up error"
                self.error = "Please fill all the contents properly"
                self.alert.toggle()
                self.startSignup = false
            }

        }
        else
        {
            self.title = "Sign up error"
            self.error = "KSHOW is not available in your region"
            self.alert.toggle()
            self.startSignup = false
        }
        
    }
    
}




