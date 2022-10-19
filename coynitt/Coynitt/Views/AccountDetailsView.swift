//
//  AccountDetailsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var accNum : Int = 3738122
    @State private var institutionNum : Int = 707
    @State private var transitNum : Int = 87362
    @State private var swiftCode : String = "CYNT182"
    
    @State var rowHeight = 55.0 // sets row height for list
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        // MARK: Deposit Protection
                        Section {
                            VStack {
                                HStack {
                                    Text("All customer deposits are monitored and protected by the CDIC.")
                                        .font(.custom("Avenir", size: 15).bold())
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
                                            .font(.custom("Avenir", size: 10))
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
                                        .font(.custom("Avenir", size: 15).bold())
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Account Number")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            // MARK: Branch Number
                            VStack {
                                HStack {
                                    Text("\(String(institutionNum))")
                                        .font(.custom("Avenir", size: 15).bold())
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Institution Number")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            // MARK: Branch Number
                            VStack {
                                HStack {
                                    Text("\(String(transitNum))")
                                        .font(.custom("Avenir", size: 15).bold())
                                    
                                    Spacer()
                                }
                                HStack {
                                    Text("Transit Number")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            // MARK: Swift Number
                            VStack {
                                HStack {
                                    Text("\(String(swiftCode))")
                                        .font(.custom("Avenir", size: 15).bold())
                                        .textCase(.uppercase)
                                    
                                    Spacer()
                                }
                                HStack {
                                    Text("Swift Code")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                            
                            // MARK: Bank Address
                            VStack {
                                HStack {
                                    Text("Coynitt Bank, Coynitt House, Calgary, Alberta, Canada")
                                        .font(.custom("Avenir", size: 15).bold())
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .textCase(.uppercase)
                                    
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Bank Address")
                                        .font(.custom("Avenir", size: 12))
                                        .fontWeight(.semibold)
                                        .foregroundColor(.gray)
                                    
                                    Spacer()
                                }
                            }
                        }
                        
                        // MARK: Account Controls
                        Section {
                            // MARK: Payment Methods
                            NavigationLink(destination: PaymentsView()){
                                VStack {
                                    HStack {
                                        Text("Account Payment Methods")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Add new debit card or bank information")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                            
                            // MARK: Transfer Limit
                            NavigationLink(destination: PaymentsView()){
                                VStack {
                                    HStack {
                                        Text("Account Limits")
                                            .font(.custom("Avenir", size: 15).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                    
                                    HStack {
                                        Text("Modify your daily transfer limit")
                                            .font(.custom("Avenir", size: 10).bold())
                                            .foregroundColor(.black)
                                        
                                        Spacer()
                                    }
                                }
                            }
                        }
                        
                        // MARK: Bank Statements
                        Section(header: Text("Statements")) {
                            NavigationLink(destination: MainView()){
                                Text("Latest Statement")
                                    .font(.custom("Avenir", size: 15).bold())
                            }
                            
                            // MARK: Statement History
                            NavigationLink(destination: MainView()){
                                Text("Statement History")
                                    .font(.custom("Avenir", size: 15).bold())
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
        }.accentColor(cynWhite)
    }
}
