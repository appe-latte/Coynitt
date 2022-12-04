//
//  AccountDepositView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct AccountDepositView: View {
    @State var userAccBal : Double = 1498.18
    @State private var userAccNum : Int = 3738122
    @State private var transitNum : Int = 87362
    @State var userBankAccType : String = "Current"
    @State var bankName : String = "Scotiabank"
    @State var depositAmt = ""
    
    @State var rowHeight = 55.0
    
    var body: some View {
        ZStack {
            //            bgWhite()
            VStack {
                // MARK: Account Balance
                VStack {
                    Text("Bank Deposit")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text("Balance: $\(userAccBal, specifier: "%.2f")")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                
                Form {
                    Section {
                        HStack {
                            Text("$")
                                .font(.system(size: 18, weight: .heavy, design: .default))
                                .bold()
                            
                            TextField("0.00", text: $depositAmt)
                                .font(.system(size: 50, weight: .heavy, design: .default)) // Bold text
                                .keyboardType(.numbersAndPunctuation)
                        }
                    }.frame(height: 80)
                    
                    // MARK: Account to deposit from
                    Section {
                        HStack(spacing: 10) {
                            Text("From:")
                                .font(.system(size: 14))
                                .fontWeight(.semibold)
                                .foregroundColor(.gray)
                            
                            Image("dummy-bank-image")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .frame(width: 40, height: 40)
                                .foregroundColor(cynGreen)
                                .clipShape(Circle())
                            
                            VStack {
                                Text(bankName)
                                    .font(.system(size: 16))
                                    .bold()
                                    .textCase(.uppercase)
                            }
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("Change")
                                    .font(.system(size: 16))
                                    .foregroundColor(.blue)
                            })
                        }
                    }
                    
                    // MARK: Account to deposit into
                    Section {
                        HStack(spacing: 10) {
                            Text("To:")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .fontWeight(.semibold)
                            
                            Image("dummy-image")
                                .resizable()
                                .scaledToFill()
                                .aspectRatio(contentMode: .fill)
                                .clipped()
                                .frame(width: 40, height: 40)
                                .foregroundColor(cynGreen)
                                .clipShape(Circle())
                            
                            VStack {
                                Text("\(userBankAccType) Account")
                                    .font(.system(size: 16))
                                    .bold()
                                    .textCase(.uppercase)
                                    .scaledToFill()
                                    .minimumScaleFactor(0.5)
                                
                                HStack {
                                    Text("\(String(userAccNum))")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    Text("·")
                                        .font(.system(size: 22))
                                        .bold()
                                        .foregroundColor(.gray)
                                    Text("\(String(transitNum))")
                                        .font(.system(size: 14))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                            }
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Text("Change")
                                    .font(.system(size: 16))
                                    .foregroundColor(.blue)
                            })
                        }
                    }
                    
                    Section {
                        Text("By agreeing with our T&C's and continuing the transaction, you consent to us requesting money from \(bankName) and sharing your account details with them.")
                            .font(.system(size: 10))
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    // MARK: Agree & Transfer button
                    HStack {
                        Spacer()
                        
                        Button(action: {}, label: {
                            Text("Agree & Continue")
                                .font(.system(size: 16))
                                .foregroundColor(.white)
                        })
                            .frame(width: 175, height: 45)
                            .background(Color.blue)
                            .cornerRadius(15)
                            .disabled((depositAmt != "") ? false : true)
                            .opacity((depositAmt != "") ? 1 : 0.4)
                        
                        Spacer()
                    }
                }
                .environment(\.defaultMinListRowHeight, rowHeight)
                .onAppear(perform: {
                    UITableView.appearance().backgroundColor = UIColor.clear
                    UITableViewCell.appearance().backgroundColor = UIColor.clear
                })
            }
        }
        .accentColor(cynGreen)
    }
}
