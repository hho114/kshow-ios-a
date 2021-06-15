//
//  SignUp.swift
//  KSHOW
//
//  Created by Alex Ho on 5/14/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import SwiftyUserDefaults

struct SignUp: View{
    
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
    @Environment(\.presentationMode) var presentationMode
 
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
                        .foregroundColor(self.color)
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
                    
                    
                    // Sign up button
                    Button(action: {
                        self.Register()
                        self.startSignup = true
                    }) {
                        Text("SIGN UP")
//                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
//                    .background(Color("Dominant"))
                    .cornerRadius(6)
                    .padding(.top, 15)
                    .alert(isPresented: self.$alert){()->Alert in
                        return Alert(title: Text("\(self.title)"), message: Text("\(self.error)"), dismissButton:
                            .default(Text("OK").fontWeight(.semibold)))
                    }
                    
                }}
                .padding(.horizontal, 25)
//            }
//        }
    }
    
    func Register(){
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
//                            UserDefaults.standard.set(email, forKey: "email")
//                            NotificationCenter.default.post(name: NSNotification.Name("email"), object: nil)
//                            UserDefaults.standard.set(pass, forKey: "pass")
//                            NotificationCenter.default.post(name: NSNotification.Name("pass"), object: nil)
                            Defaults[\.isUserLogin] = true
                            Defaults[\.email] = email
                            Defaults[\.password] = pass
                        }
                        else
                        {
                            print("User need verify email")
                            

                                user.sendEmailVerification { (error) in
                                if error != nil{
                                    self.error = error?.localizedDescription ?? "Email verify error, please try again"
                                    self.title = "Verify Error"
                                    self.alert.toggle()
                                }
                                else{
                                    
                                    self.error = "Open your email that is used to sign up to verify your email in order to login"
                                    self.title = "Verify"
                                    self.alert.toggle()
                                    
                                }
                                
                                }
//
//                            UserDefaults.standard.set(false, forKey: "status")
//                            NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                            self.presentationMode.wrappedValue.dismiss()

                        }
                    }
                }
            }
            else{
                
                self.error = "Password mismatch"
                self.title = "Sign up error"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Please fill all the contents properly"
            self.alert.toggle()
        }
        
    }
    
}

