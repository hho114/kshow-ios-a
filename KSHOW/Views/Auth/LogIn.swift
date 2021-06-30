//
//  LogIn.swift
//  KSHOW
//
//  Created by Alex Ho on 5/14/21.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import CodableFirebase
import LocalAuthentication

struct Login: View{
    
    @State var email = UserDefaults.standard.value(forKey: "email") as? String ?? ""
    @State var pass = UserDefaults.standard.value(forKey: "pass") as? String ?? ""
    @State var color = Color.black.opacity(0.7)
    @State var visible = false
    @State var alert = false
    @State var error = ""
    @State var title = ""
    @State var userId = ""
    @State var isSendVerify = false
    @EnvironmentObject var modelData: ModelData
    @State var startLogin = false
    @State var rememberLogin = true
    @State private var showingAlert = false
    @State private var isUseBioID = false
    let generator = UINotificationFeedbackGenerator()
    @State var showingSignup = false
    @State var showingSignupIpad = false
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    
    let borderColor = Color(red: 107.0/255.0, green: 164.0/255.0, blue: 252.0/255.0)
    
    var body: some View{
        LoadingView(isShowing: $startLogin){
//        NavigationView{
        VStack(){
            Image("kshow_logo").resizable().frame(width: 150.0, height: 150.0, alignment: .top).cornerRadius(25)
            
            Text("Sign in to your account")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top, 15)
            
            TextField("Email",text:self.$email)
                .autocapitalization(.none)
                .padding()
                .keyboardType(.emailAddress)
                .background(RoundedRectangle(cornerRadius:6).stroke(borderColor,lineWidth:2))
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
            
            HStack{
                CheckBox(checked: $rememberLogin)
                Text("Remember my Login").font(.subheadline)
                Spacer()
                Button(action: {
                    bfprint("Forget Password button pressed")
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                    pass = ""
                    if textFieldValidatorEmail(email)
                    {
                        showingAlert = true
                    }else
                    {
                        
                        title = "Invalid Email"
                        error = "The email is invalid format. Please reenter your email."
                        email = ""
                        alert = true
                    }
                    
                    self.visible.toggle()
                }) {
                    Text("Forget Password")
                        .fontWeight(.medium)
                }.padding(.top, 10.0)
                .alert(isPresented: $showingAlert) { () -> Alert in
                            let primaryButton = Alert.Button.default(Text("Yes")) {
                                bfprint("Yes button pressed")
//                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                                self.ResetPassword()
                            }
                            let secondaryButton = Alert.Button.cancel(Text("No")) {
                                bfprint("No button pressed")
//                                UIImpactFeedbackGenerator(style: .medium).impactOccurred()

                            }
                            return Alert(title: Text("Reset Password"), message: Text("Do you want to send a reset link to \(email)?"), primaryButton: primaryButton, secondaryButton: secondaryButton)
                        }
            }
            
            // Sign in button
            Button(action: {
//                self.generator.notificationOccurred(.success)
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                self.startLogin = true
                self.Verify()
                
//                UserDefaults.standard.set(true, forKey: "loading")
//                NotificationCenter.default.post(name: NSNotification.Name("loading"), object: nil)
            }) {
                Text("SIGN IN")
                    .font(.system(size: 16, weight: .black, design: .rounded))
                    .foregroundColor(Color(UIColor.label))
//                    .fontWeight(.bold)
                    .padding(.vertical)
                 .frame(width: UIScreen.main.bounds.width - 50)
            }
            .background(LinearGradient.bluePurple)
            .cornerRadius(15)
            .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            .padding(.top, 15)
            .alert(isPresented: $alert){()->Alert in
                return Alert(title: Text("\(self.title)"), message: Text("\(self.error)"), dismissButton:
                    .default(Text("OK").fontWeight(.semibold)))
            }
            
            HStack(spacing: 5){
                Text("Don't have an account?")
                
//                NavigationLink(destination: SignUp()){
//                    Text("Sign Up")
//                    .fontWeight(.bold)
//                        .foregroundColor(Color(UIColor.label))
//                }
                Button(action: {
                    UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                    if idiom == .pad {
                                showingSignupIpad = true
                            } else {
                                showingSignup = true
                            }
                    
                }, label: {
                    Text("Sign Up")
                    .fontWeight(.bold)
//                        .foregroundColor(Color(UIColor.label))
                })
                .sheet(isPresented: $showingSignup, content: {
                    SignUp()
                })
                .fullScreenCover(isPresented: $showingSignupIpad, content: {
                    SignUp()
                })
                
                
                Text("now").multilineTextAlignment(.leading)
                
            }.padding(.top, 30)
            Button(action: {
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                self.startLogin = true
                self.loginWithFaceID()
               
//                UserDefaults.standard.set(true, forKey: "loading")
//                NotificationCenter.default.post(name: NSNotification.Name("loading"), object: nil)
            }) {
                Text("Sign In With Biometric")
//                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
//                 .frame(width: UIScreen.main.bounds.width - 50)
            }
//            .background(Color("Dominant"))
            .cornerRadius(6)
            .padding(.top, 15)
            .alert(isPresented: $alert){
                ()->Alert in
                return Alert(title: Text("\(self.title)"), message: Text("\(self.error)"), dismissButton:
                    .default(Text("OK").fontWeight(.semibold)))
            }
        }.padding(.horizontal, 25)
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .onAppear(perform: {
            if UserDefaults.standard.bool(forKey: "biounlock") {
                print("Perform login with biounlock")
                self.startLogin = true
                loginWithFaceID()
            }
            else if UserDefaults.standard.bool(forKey: "rememberLogin")
            {
                print("Perform login with remember")
                self.startLogin = true
                Verify()
            }
            else
            {
                print("Perform nothing")
            }
        })
//       }
            
        }

        
    }
    
    func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    func loginWithFaceID() {
        
        let context = LAContext()
            var error: NSError?

            // check whether biometric authentication is possible
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // it's possible, so go ahead and use it
                let reason = "Sign in KSHOW with your biometric authentication"

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                    // authentication has now completed
                    DispatchQueue.main.async {
                        if success {
                            // authenticated successfully
                            Verify()
                            isUseBioID = true
                            
                        } else {
                            // there was a problem
                            self.error = ""
                            self.title = "Face ID Error"
                            self.alert.toggle()
                            self.startLogin = false
                        }
                    }
                }
            } else {
                // no biometrics
                self.error = ""
                self.title = "There is no biometric authentication"
                self.alert.toggle()
                self.startLogin = false
            }
    }
    
    func Verify(){
        print("Start verify")
        
        if self.email != "" && self.pass != "" {
            
            Auth.auth().signIn(withEmail: self.email, password: self.pass) { (res, err) in
                
                if err != nil{
                    print(err!.localizedDescription)
                    self.error = err!.localizedDescription
                    self.title = "Login Error"
                    self.alert.toggle()
                    self.startLogin = false
                    return
                }
                
                if let user = res?.user{
                    if user.isEmailVerified
                    {
                        userId = user.uid
                        fetchUserData()
                        
                    }
                    else
                    {
                        
                        self.startLogin = false
                        print("User need verify email")
                        if !self.isSendVerify {
                        user.sendEmailVerification { (error) in
                            if error != nil{
                                self.error = error?.localizedDescription ?? "Email verify error"
                                self.title = "Verify Error"
                                self.alert.toggle()
                                
                            }
                            else{
                                self.isSendVerify = true
                                self.error = "Open your email that is used to sign up to verify your email in order to login"
                                self.title = "Verify"
                                self.alert.toggle()
                               
                            }
                            
                        }
                        }else{
                            self.error = "Checkout your email \(email) that is used to sign up and verify your email in order to login"
                            self.title = "Verify"
                            self.alert.toggle()
                            
                            
                        }

                    }
                }
                
                
                
            }
        }else{
            self.title = "Login Error"
            self.error = "Please fill all the content property"
            self.alert.toggle()
            self.startLogin = false
        }
    }

    
    func fetchUserData() {

        modelData.ref.child("users").child(self.userId).observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let model = try FirebaseDecoder().decode(User.self, from: value)
                print(model)
                modelData.user = model
                fetchPermission()
            } catch let error {
                bfprint(error)
            }
        })
    }
    
    func fetchPermission() {

        modelData.ref.child("permissions").child(modelData.user.permission).observeSingleEvent(of: .value, with: { snapshot in
            guard let value = snapshot.value else { return }
            do {
                let model = try FirebaseDecoder().decode(Permission.self, from: value)
                print(model)
                modelData.permission = model
                fetchCasts()
            } catch let error {
                bfprint(error)
            }
        })
    }
    func fetchCasts() {

        modelData.ref.child("casts").observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
            do {
                let model = try FirebaseDecoder().decode(Cast.self, from: child.value as Any)
                print(model)
                modelData.casts.append(model)
                
            } catch let error {
                bfprint(error)
            }
                
                
          }
            modelData.casts = modelData.updateImageCastAPI
            self.fetchShows()
        }){ (error) in
            bfprint(error.localizedDescription)
        }
        
}
    func fetchShows() {

        self.modelData.ref.child("wiki").observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children.allObjects as! [DataSnapshot] {
            do {
                let model = try FirebaseDecoder().decode(Show.self, from: child.value as Any)
                print(model)
                
                modelData.shows.append(model)
                
               
                
            } catch let error {
                bfprint(error)
            }
                
                
          }
            modelData.shows = modelData.updateImageShowAPI
            self.finalizeSignIn()
        }){ (error) in
            bfprint(error.localizedDescription)
        }
        
    }
    
    func finalizeSignIn() {
        print("Login success!")
        
//        UserDefaults.standard.set(true, forKey: "status")
//        NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
        
//        UserDefaults.standard.set(modelData.historyEpisodes, forKey: "historyEpisodes")
        if let data = UserDefaults.standard.data(forKey: "historyEpisodes") {
            do {
                    // Create JSON Decoder
                    let decoder = JSONDecoder()

                    // Decode Note
                modelData.historyEpisodes = try decoder.decode([HistoryEpisode].self, from: data)

                } catch {
                    print("Unable to Decode Note (\(error))")
                }
        }
        
        if isUseBioID {
            print("Remember BIO ID")
            UserDefaults.standard.set(true, forKey: "biounlock")
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(pass, forKey: "pass")
            UserDefaults.standard.set(true, forKey: "rememberLogin")
        }
        else if rememberLogin {
            print("Remember login")
            UserDefaults.standard.set(email, forKey: "email")
            UserDefaults.standard.set(pass, forKey: "pass")
            UserDefaults.standard.set(true, forKey: "rememberLogin")
            UserDefaults.standard.set(false, forKey: "biounlock")
        }
        else
        {
            print("Do not remember and bioID")
            UserDefaults.standard.set(false, forKey: "biounlock")
            UserDefaults.standard.set("", forKey: "email")
            UserDefaults.standard.set("", forKey: "pass")
            UserDefaults.standard.set(false, forKey: "rememberLogin")
        }
        
        modelData.isSignin = true

        self.startLogin = false
    }
    
    
    func ResetPassword(){
        if self.email != ""{
            
            Auth.auth().sendPasswordReset(withEmail: self.email) { (err) in
                
                if err != nil{
                    self.alert.toggle()
                    return
                }
                self.title = "Password Reset Sucessfully!"
                self.error = "A new password is sent to your email!"
                self.alert.toggle()
            }
        }
        else{
            
            self.error = "Email Id is empty"
            self.alert.toggle()
        }
    }
}



