//
//  AccountDetailsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var userAccNum : Int = 3738122
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
                                    Image("cdic-logo")
                                        .resizable()
                                        .scaledToFit()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 15, height: 15)
                                        .padding(.horizontal, 2)
                                    
                                    Text("All customer deposits are monitored and protected by the CDIC.")
                                        .font(.custom("Avenir", size: 10).bold())
                                        .lineLimit(nil)
                                        .fixedSize(horizontal: false, vertical: true)
                                        .textCase(.uppercase)
                                    
//                                    Spacer()
                                    
                                    
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
