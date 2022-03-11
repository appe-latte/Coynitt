//
//  AccountDetailsView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 10/03/2022.
//

import SwiftUI

struct AccountDetailsView: View {
    @State private var accNum : Int = 3738122
    @State private var institutionNum : Int = 777
    @State private var transitNum : Int = 87362
    @State private var swiftCode : String = "coyn1982"
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Form {
                        // MARK: Deposit Protection
                        Section {
                            VStack {
                                HStack {
                                    Text("Deposits are protected by the FSCS.")
                                        .font(.system(size: 12))
                                        .bold()
                                    
                                    Spacer()
                                    
                                    Image("cdic-logo")
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fill)
                                        .clipped()
                                        .frame(width: 40, height: 40)
                                }
                                Text("More info")
                                    .font(.system(size: 10))
                                    .foregroundColor(.blue)
                            }
                        }
                        
                        // MARK:
                        Section(header: Text("Account Details")) {
                            // MARK: Account Number
                            VStack {
                                HStack {
                                    Text("\(String(accNum))")
                                        .font(.system(size: 14))
                                        .bold()
                                    
                                    Image(systemName: "doc.on.doc")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                Text("Account Number")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            
                            // MARK: Branch Number
                            VStack {
                                HStack {
                                    Text("\(String(institutionNum))")
                                        .font(.system(size: 14))
                                        .bold()
                                    
                                    Image(systemName: "doc.on.doc")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                Text("Institution Number")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            
                            // MARK: Branch Number
                            VStack {
                                HStack {
                                    Text("\(String(transitNum))")
                                        .font(.system(size: 14))
                                        .bold()
                                    
                                    Image(systemName: "doc.on.doc")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                Text("Transit Number")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            
                            // MARK: Swift Number
                            VStack {
                                HStack {
                                    Text("\(String(swiftCode))")
                                        .font(.system(size: 14))
                                        .bold()
                                        .autocapitalization(.allCharacters)
                                    
                                    Image(systemName: "doc.on.doc")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                
                                Text("Swift Code")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                            
                            // MARK: Bank Address
                            VStack {
                                HStack {
                                    Text("Coyne Bank, Coyne House, Calgary, Alberta, Canada")
                                        .font(.system(size: 14))
                                        .bold()
                                        .multilineTextAlignment(.leading)
                                    
                                    Image(systemName: "doc.on.doc")
                                        .resizable()
                                        .frame(width: 25, height: 25)
                                }
                                
                                Text("Bank Address")
                                    .font(.system(size: 10))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        // MARK: Bank Statements
                        Section {
                            NavigationLink(destination: MainView()){
                                Text("Latest Statement")
                                    .font(.system(size: 14))
                                    .bold()
                            }
                            
                            // MARK: Statement History
                            NavigationLink(destination: MainView()){
                                Text("Statement History")
                                    .font(.system(size: 14))
                                    .bold()
                            }
                        }
                        
                        // MARK: Account Controls
                        Section(header: Text("Limits")) {
                            NavigationLink(destination: MainView()){
                                Text("Withdrawal Limits")
                                    .font(.system(size: 14))
                                    .bold()
                            }
                            
                            // MARK: Contactless Limits
                            NavigationLink(destination: MainView()){
                                Text("Contactless Limits")
                                    .font(.system(size: 14))
                                    .bold()
                            }
                        }
                    }
                }
            }
        }
    }
}
