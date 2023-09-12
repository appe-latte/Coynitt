//
//  SettingsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-19.
//

import SwiftUI

struct SettingsView: View {
    @State var rowHeight = 65.0
    @State var showPasscodeSheet = false
    @State var showBiometricSheet = false
    
    var body: some View {
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        NavigationView {
            ZStack {
                cynOlive
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Rectangle()
                        .fill(cynWhite)
                        .cornerRadius(45, corners: [.bottomRight])
                        .frame(width: screenWidth, height: 110)
                    
                    Spacer() 
                    
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
                        
                        // MARK: App Settings Section
                        Section(header: Text("App Settings")) {
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
                        
                        // MARK: Biometric + Passcode Security
                        Section(header: Text("Account Settings")) {
                            Button(action: {showBiometricSheet.toggle()}, label: {
                                HStack {
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
                                    
                                    Image(systemName: "chevron.right")
                                        .frame(width: 9, height: 9)
                                        .foregroundColor(Color(UIColor.lightGray).opacity(0.8))
                                }
                            })
                            .sheet(isPresented: $showBiometricSheet) {
                                ZStack {
                                    cynWhite
                                    
                                    BiometricSettingsView()
                                }
                                .ignoresSafeArea()
                                .presentationDetents([.height(screenHeight / 4), .fraction(0.25)])
                            }
                            
                            Button(action: {showPasscodeSheet.toggle()}, label: {
                                HStack {
                                    Image("passcode")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.orange)
                                    
                                    VStack {
                                        HStack {
                                            Text("Passcode Login")
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
                                    
                                    Image(systemName: "chevron.right")
                                        .frame(width: 9, height: 9)
                                        .foregroundColor(Color(UIColor.lightGray).opacity(0.8))
                                }
                            })
                            .sheet(isPresented: $showPasscodeSheet) {
                                ZStack {
                                    cynWhite
                                    
                                    PasscodeSettingsView()
                                }
                                .ignoresSafeArea()
                                .presentationDetents([.height(screenHeight / 4), .fraction(0.25)])
                            }
                            
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
                        }
                        
                        // MARK: Account Socials Section
                        Section(header: Text("Socials")) {
                            // MARK: Instagram
                            VStack(spacing: 10) {
                                HStack {
                                    Image("instagram")
                                        .resizable()
                                        .frame(width: 34, height: 34)
                                    Link("Follow Us on Instagram", destination: URL(string: "https://www.instagram.com/coynitt")!)
                                        .font(.custom("Avenir", size: 15).bold())
                                        .foregroundColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
                                }
                            }
                            
                            // MARK: Facebook
                            VStack(spacing: 10) {
                                HStack {
                                    Image("facebook")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Link("Follow Us on Facebook", destination: URL(string: "https://www.facebook.com/appelatteltd")!)
                                        .font(.custom("Avenir", size: 15).bold())
                                        .foregroundColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
                                }
                            }
                            
                            // MARK: TikTok
                            VStack(spacing: 10) {
                                HStack {
                                    Image("tiktok")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                    Link("Follow Us on TikTok", destination: URL(string: "https://www.tiktok.com/@appe.latte")!)
                                        .font(.custom("Avenir", size: 15).bold())
                                        .foregroundColor(Color(red: 83 / 255, green: 82 / 255, blue: 116 / 255))
                                }
                            }
                            
                            // MARK: App Version Number
                            
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
                
                // MARK: Support
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    
                    Menu("Support"
                    ) {
                        // MARK: Chat
                        Button(action: {}, label: {
                            HStack {
                                Image("chat-support")
                                Text("Chat 24/7")
                            }
                        })
                        
                        // MARK: Call
                        Button(action: {}, label: {
                            HStack {
                                Image("phone")
                                Text("Call")
                            }
                        })
                        
                        // MARK: Text
                        Button(action: {}, label: {
                            HStack {
                                Image("chat-support")
                                Text("Text")
                            }
                        })
                        
                    }
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                }
            }
        }
        .scrollContentBackground(.hidden)
    }
}

extension UIApplication {
    static var appVersion: String? {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
