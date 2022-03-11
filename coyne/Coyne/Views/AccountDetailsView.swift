//
//  AccountDetailsView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var accNum : Int = 3738122
    @State private var institutionNum : Int = 707
    @State private var transitNum : Int = 87362
    @State private var swiftCode : String = "coyn1982"
    
    @State var rowHeight = 55.0 // sets row height for list
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    // MARK: Deposit Protection
                    Section {
                        VStack {
                            HStack {
                                Text("Deposits are protected by the CDIC.")
                                    .font(.system(size: 12))
                                    .fontWeight(.semibold)
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .textCase(.uppercase)
                                
                                Spacer()
                                
                                Image("cdic-logo")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    .frame(width: 40, height: 40)
                                    .padding(5)
                            }
                            
                            HStack {
                                Button(action: {}, label: {
                                    Text("More info")
                                        .font(.system(size: 10))
                                        .foregroundColor(.blue)
                                })
                                
                                Spacer()
                            }
                        }
                    }
                    
                    Section(header: Text("Account Details")) {
                        // MARK: Account Number
                        VStack {
                            HStack {
                                Text("\(String(accNum))")
                                    .font(.system(size: 16))
                                    .bold()
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("Account Number")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                        }
                        
                        // MARK: Branch Number
                        VStack {
                            HStack {
                                Text("\(String(institutionNum))")
                                    .font(.system(size: 16))
                                    .bold()
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("Institution Number")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                        }
                        
                        // MARK: Branch Number
                        VStack {
                            HStack {
                                Text("\(String(transitNum))")
                                    .font(.system(size: 16))
                                    .bold()
                                
                                Spacer()
                            }
                            HStack {
                                Text("Transit Number")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                        }
                        
                        // MARK: Swift Number
                        VStack {
                            HStack {
                                Text("\(String(swiftCode))")
                                    .font(.system(size: 16))
                                    .bold()
                                    .textCase(.uppercase)
                                
                                Spacer()
                            }
                            HStack {
                                Text("Swift Code")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                        }
                        
                        // MARK: Bank Address
                        VStack {
                            HStack {
                                Text("Coyne Bank, Coyne House, Calgary, Alberta, Canada")
                                    .font(.system(size: 14))
                                    .bold()
                                    .lineLimit(nil)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .textCase(.uppercase)
                                
                                Spacer()
                            }
                            
                            HStack {
                                Text("Bank Address")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                                
                                Spacer()
                            }
                        }
                    }
                    
                    // MARK: Bank Statements
                    Section(header: Text("Statements")) {
                        NavigationLink(destination: MainView()){
                            Text("Latest Statement")
                                .font(.system(size: 16))
                                .bold()
                        }
                        
                        // MARK: Statement History
                        NavigationLink(destination: MainView()){
                            Text("Statement History")
                                .font(.system(size: 16))
                                .bold()
                        }
                    }
                    
                    // MARK: Account Controls
                    Section(header: Text("Limits")) {
                        NavigationLink(destination: MainView()){
                            Text("Withdrawal Limits")
                                .font(.system(size: 16))
                                .bold()
                        }
                        
                        // MARK: Contactless Limits
                        NavigationLink(destination: MainView()){
                            Text("Contactless Limits")
                                .font(.system(size: 16))
                                .bold()
                        }
                    }
                }
                .environment(\.defaultMinListRowHeight, rowHeight)
                .foregroundColor(Color.black)
                .onAppear(perform: {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                })
            }
        }
    }
}
