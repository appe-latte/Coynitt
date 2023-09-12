//
//  UserProfileView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 13/04/2022.
//

import SwiftUI

struct UserProfileView: View {
    @State var firstName : String = "Samuel"
    @State var lastName : String = "James"
    @State var userID : String = "18636390"
    @State var accountType : String = "Premium"
    @State var email : String = "sam_james90@coynitt.com"
    @State var address : String = "125 Lethbridge Way, Calgary, AB"
    @State var cellNum : String = "+1 (587) 187-9272"
    @State var dob : String = "11-May-92"
    @State var country : String = "Canada"
    
    var viewWidth = UIScreen.main.bounds.width
    var viewHeight = UIScreen.main.bounds.height
    
    @State var rowHeight = 65.0 // sets row height for list
    
    var body: some View {
        ZStack {
            cynOlive
                .ignoresSafeArea()
            
            VStack {
                Rectangle()
                    .fill(Color(red: 47 / 255, green: 107 / 255, blue: 97 / 255))
                    .frame(width: UIScreen.main.bounds.width, height: 45)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            HStack {
                                Text("User Profile")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                                    .kerning(2)
                                
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
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                .padding(5)
                            
                            Button(action: {},
                                   label:  {
                                Text("EDIT")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(cynWhite)
                                    .textCase(.uppercase)
                            })
                            .frame(width: 30, height: 15)
                            .padding(2)
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(cynWhite, lineWidth: 0.5))
                            
                        }
                        
                        // MARK: Name / UserID / Membership Type
                        VStack {
                            HStack {
                                Text("\(firstName) \(lastName)")
                                    .font(.system(size: 12))
                                    .fontWeight(.heavy)
                                    .kerning(2)
                                    .textCase(.uppercase)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                
                                Spacer()
                            }
                            
                            VStack {
                                HStack {
                                    Text("User ID: \(userID)")
                                        .font(.system(size: 10))
                                        .fontWeight(.medium)
                                        .kerning(2)
                                        .textCase(.uppercase)
                                        .scaledToFill()
                                        .minimumScaleFactor(0.5)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Account Type: \(accountType)")
                                        .font(.system(size: 10))
                                        .fontWeight(.medium)
                                        .kerning(2)
                                        .textCase(.uppercase)
                                        .scaledToFill()
                                        .minimumScaleFactor(0.5)
                                    
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                        }
                        .foregroundColor(cynWhite)
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
                                                .font(.system(size: 12))
                                                .fontWeight(.semibold)
                                                .kerning(2)
                                                .textCase(.uppercase)
                                                .foregroundColor(cynBlack)
                                            
                                            Spacer()
                                        }
                                        
                                        HStack {
                                            Text(email)
                                                .font(.system(size: 10))
                                                .fontWeight(.medium)
                                                .kerning(2)
                                                .textCase(.uppercase)
                                                .foregroundColor(cynBlack)
                                                .minimumScaleFactor(0.5)
                                            
                                            Spacer()
                                        }
                                    }
                                }
                                
                                // MARK: Date of Birth
                                VStack {
                                    HStack {
                                        Text("Date of Birth")
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text(dob)
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                            .minimumScaleFactor(0.5)
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Phone
                                VStack {
                                    HStack {
                                        Text("Phone")
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                        
                                        Spacer()
                                        
                                    }
                                    
                                    HStack {
                                        Text(cellNum)
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                        
                                        Button(action: {}, label: {
                                            Text("change")
                                                .font(.system(size: 10))
                                                .fontWeight(.medium)
                                                .frame(width: 60, height: 20)
                                                .textCase(.uppercase)
                                                .padding(2)
                                                .overlay(RoundedRectangle(cornerRadius: 5)
                                                    .stroke(cynBlack, lineWidth: 0.5))
                                        })
                                    }
                                }
                                
                                // MARK: Address
                                VStack {
                                    HStack {
                                        Text("Address")
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text(address)
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Country
                                VStack {
                                    HStack {
                                        Text("Country")
                                            .font(.system(size: 12))
                                            .fontWeight(.semibold)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Image("canada")
                                            .resizable()
                                            .scaledToFill()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 15, height: 10)
                                        
                                        Text(country)
                                            .font(.system(size: 10))
                                            .fontWeight(.medium)
                                            .kerning(2)
                                            .textCase(.uppercase)
                                            .foregroundColor(cynBlack)
                                            .minimumScaleFactor(0.5)
                                        
                                        Spacer()
                                    }
                                }
                                
                                // MARK: Disclaimer
                                Text("To update your personal information email: verification@coynitt.com")
                                    .lineLimit(nil)
                                    .font(.system(size: 7))
                                    .kerning(2)
                                    .textCase(.uppercase)
                                    .foregroundColor(cynBlack)
                                    .minimumScaleFactor(0.5)
                                    .accentColor(cynOlive)
                            }
                        }
                    }
                }
            }
        }
        .environment(\.defaultMinListRowHeight, rowHeight)
        .scrollContentBackground(.hidden)
    }
}
