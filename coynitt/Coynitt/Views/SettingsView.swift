//
//  SettingsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-19.
//

import SwiftUI

struct SettingsView: View {
    @State var rowHeight = 65.0
    
    var body: some View {
        NavigationView {
            ZStack {
                //                cynWhite
                VStack(alignment: .center) {
                    Rectangle()
                        .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                        .cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 110)
                        .edgesIgnoringSafeArea(.all)
                    
                    Form {
                        // MARK: ID Verification
                        Section(header: Text("Verification")) {
                            NavigationLink(destination: PaymentsView()){
                                Image("check-shield")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(cynGreen2)
                                
                                VStack {
                                    HStack {
                                        Text("Account Verification")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        // MARK: App Settings
                        Section(header: Text("App Settings")) {
                            
                            // About This App
                            NavigationLink(destination: PaymentsView()){
                                Image("info")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(cynPurple)
                                
                                HStack {
                                    Text("About this app")
                                        .font(.custom("Avenir", size: 15).bold())
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                            
                            // Notification Settings
                            NavigationLink(destination: PaymentsView()){
                                Image("alert")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(cynPurple)
                                
                                HStack {
                                    Text("Notification Settings")
                                        .font(.custom("Avenir", size: 15).bold())
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                            
                            // Privacy Policy
                            NavigationLink(destination: PaymentsView()){
                                Image("policy")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(cynPurple)
                                
                                HStack {
                                    Text("Privacy Policy")
                                        .font(.custom("Avenir", size: 15).bold())
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                }
                            }
                        }
                        
                        // MARK: Security
                        Section(header: Text("Security")) {
                            
                            // Biometric Settings
                            NavigationLink(destination: PaymentsView()){
                                Image("face-id")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)
                                
                                VStack {
                                    HStack {
                                        Text("Biometric Login")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Enable FaceID or TouchID to login")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // Passcode Settings
                            NavigationLink(destination: PaymentsView()){
                                Image("passcode")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.orange)
                                
                                VStack {
                                    HStack {
                                        Text("Passcode")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Use passcode to secure the app")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        // MARK: Account Settings
                        Section(header: Text("Security")) {
                            // Delete User Account
                            NavigationLink(destination: PaymentsView()){
                                Image("freeze-shield")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                
                                VStack {
                                    HStack {
                                        Text("Freeze My Card")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Temporarily freezes your card if it is lost or stolen")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // Delete User Account
                            NavigationLink(destination: PaymentsView()){
                                Image("delete")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.blue)
                                
                                VStack {
                                    HStack {
                                        Text("Delete Account")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Deletes your account permanently")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.red)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // Log out
                            NavigationLink(destination: PaymentsView()){
                                Image("log-out")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(.red)
                                
                                VStack {
                                    HStack {
                                        Text("Log Out")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Safely log out of your account")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // App Version Number
                            VStack {
                                HStack {
                                    Spacer()
                                    Text("App Version: \(UIApplication.appVersion!)")
                                        .font(.custom("Avenir", size: 13).bold())
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                        }
                    }
                    .environment(\.defaultMinListRowHeight, rowHeight)
                    .padding(.top, -100) // <--- removes white space above form from Navigation view
                }
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Settings")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(cynWhite)
                        .textCase(.uppercase)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    // MARK: Chat Support
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("chat-support")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("Support")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                }
            }
        }
    }
}

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
