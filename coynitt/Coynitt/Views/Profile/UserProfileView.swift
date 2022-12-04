//
//  UserProfileView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/04/2022.
//

import SwiftUI

struct UserProfileView: View {
    @State var userFName : String = "Samuel"
    @State var userLName : String = "James"
    @State var userID : String = "18636390"
    @State var userMemberAcctType : String = "Premium"
    @State var userEmail : String = "sam_james90@coynitt.com"
    @State var userAddr : String = "125 Lethbridge Way, Calgary, AB"
    @State var userPhn : String = "(587) 187-9272"
    @State var userDob : String = "11-May-92"
    @State var userCountry : String = "Canada"
    
    var viewWidth = UIScreen.main.bounds.width
    var viewHeight = UIScreen.main.bounds.height
    @State var rowHeight = 65.0 // sets row height for list
    
    var body: some View {
        ZStack {
            cynWhite
            VStack {
                Rectangle()
                    .fill(Color(red: 177 / 255, green: 156 / 255, blue: 217 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("User Profile")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                
                                Spacer()
                            }
                            .padding(.leading, 10)
                        })
                
                Spacer()
                
                VStack {
                    // MARK: Profile Image
                    HStack {
                        VStack {
                            Image("dummy-image")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .frame(width: 90, height: 90)
                                .clipShape(Circle())
                                .padding(5)
                            
                            Button(action: {},
                                   label:  {
                                Text("EDIT")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(cynGreen2)
                                    .textCase(.uppercase)
                            })
                            .frame(width: 30, height: 15)
                            .padding(2)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 0.5))
                            
                        }
                        
                        // MARK: Name / UserID / Membership Type
                        
                        VStack {
                            HStack {
                                Text("\(userFName) \(userLName)")
                                    .font(.custom("Avenir", size: 14).bold())
                                    .textCase(.uppercase)
                                    .foregroundColor(.black)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                
                                Spacer()
                            }
                            
                            VStack {
                                HStack {
                                    Text("User ID: \(userID)")
                                        .font(.custom("Avenir", size: 11).bold())
                                        .textCase(.uppercase)
                                        .foregroundColor(.gray)
                                        .scaledToFill()
                                        .minimumScaleFactor(0.5)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Account Type: \(userMemberAcctType)")
                                        .font(.custom("Avenir", size: 11).bold())
                                        .textCase(.uppercase)
                                        .foregroundColor(.gray)
                                        .scaledToFill()
                                        .minimumScaleFactor(0.5)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                    }
                }
                .frame(width: viewWidth, height: viewHeight / 8, alignment: .leading)
                .padding(10)
                
                // MARK: Edit Information
                NavigationView {
                    ZStack {
                        Form {
                            Section(header: Text("Information")) {
                                
                                // MARK: Email
                                NavigationLink(destination: ProgressLoadingView()){
                                    
                                    VStack {
                                        HStack {
                                            Text("Email")
                                                .font(.custom("Avenir", size: 12).bold())
                                                .foregroundColor(.black)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text(userEmail)
                                                .font(.custom("Avenir", size: 15).bold())
                                                .foregroundColor(.black)
                                                .minimumScaleFactor(0.5)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                
                                // MARK: Date of Birth
                                VStack {
                                    HStack {
                                        Text("Date of Birth")
                                            .font(.custom("Avenir", size: 12).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text(userDob)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Phone
                                VStack {
                                    HStack {
                                        Text("Phone")
                                            .font(.custom("Avenir", size: 12).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Image("canada")
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 15, height: 10)
                                        
                                        Text(userPhn)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Address
                                VStack {
                                    HStack {
                                        Text("Address")
                                            .font(.custom("Avenir", size: 12).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text(userAddr)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Country
                                VStack {
                                    HStack {
                                        Text("Country")
                                            .font(.custom("Avenir", size: 12).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Image("canada")
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 15, height: 10)
                                        
                                        Text(userCountry)
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Disclaimer
                                Text("To update your personal information email: verification@coynitt.com")
                                    .lineLimit(nil)
                                    .font(.custom("Avenir", size: 10).bold())
                                    .foregroundColor(Color.black)
                                    .accentColor(cynGreen2)
                            }
                        }
                    }
                }
            }
        }.environment(\.defaultMinListRowHeight, rowHeight)
    }
}
