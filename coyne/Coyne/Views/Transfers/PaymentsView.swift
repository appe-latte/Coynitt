//
//  PaymentsView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 11/03/2022.
//

import SwiftUI

struct PaymentsView: View {
    @State var accBalance : Double = 14198.18
    
    @State var rowHeight = 65.0
    
    let dummyRecipients = [
        Recipients(lName: "Rogers", initials: "IR"),
        Recipients(lName: "Khumalo", initials: "SK"),
        Recipients(lName: "Taylor", initials: "JT"),
        Recipients(lName: "Mlambo", initials: "MM"),
        Recipients(lName: "Manolas", initials: "KM")
    ]
    
    var body: some View {
        ZStack {
            VStack {
                // MARK: Account Balance
                VStack {
                    Text("Payments")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    Text("Balance: $\(accBalance, specifier: "%.2f")")
                        .font(.system(size: 12))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                }
                .padding(.top, 20)
                
                Form {
                    Section {
                        VStack(spacing: 1) {
                            HStack {
                                Image(systemName: "dollarsign.square.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(cynGreen)
                                Text("Invite a friend(s) and you'll both get $10.")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .lineLimit(nil)
                                
                                Spacer()
                            }.padding(3.5)
                            
                            Text("Tell your family and friends about how amazing Coyne bank is. Send them an invite and you both will receive $10 each after successful registration.")
                                .font(.system(size: 12))
                                .lineLimit(nil)
                            
                            Button(action: {}, label: {
                                Text("Share Invite")
                                    .font(.system(size: 14))
                                    .fontWeight(.semibold)
                                    .foregroundColor(.white)
                                    .frame(width: 175, height: 45)
                                    .background(.blue)
                                    .cornerRadius(15)
                                    .padding(10)
                            })
                        }
                    }
                    
                    Section(header: Text("Payments")) {
                        // MARK: Pay an individual
                        NavigationLink(destination: MainView()){
                            VStack {
                                HStack {
                                    Text("Pay Individual")
                                        .font(.system(size: 17))
                                        .bold()
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Send money via bank transfer.")
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                            }
                        }
                        
                        // MARK: Pay an individual
                        NavigationLink(destination: MainView()){
                            VStack {
                                HStack {
                                    Text("Move Funds")
                                        .font(.system(size: 17))
                                        .bold()
                                    Spacer()
                                }
                                HStack {
                                    Text("Transfer to another Coyne Account.")
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                            }
                        }
                        
                        // MARK: Pay an individual
                        NavigationLink(destination: MainView()){
                            VStack {
                                HStack {
                                    Text("Request Money")
                                        .font(.system(size: 16))
                                        .bold()
                                    Spacer()
                                }
                                
                                HStack {
                                    Text("Request funds from another user.")
                                        .font(.system(size: 13))
                                        .fontWeight(.semibold)
                                    Spacer()
                                }
                                
                            }
                            
                        }
                    }
                    
                    Section(header: Text("Recent Recipients")) {
                        HStack(spacing: 10) {
                            List(dummyRecipients) { recipients in
                                RecipientsRow(recipients: recipients)
                            }
                        }
                    }
                }
                .environment(\.defaultMinListRowHeight, rowHeight)
                .foregroundColor(Color.black)
            }
        }
    }
}

// MARK: Recipients Lists - shows last 10 transfers
struct Recipients: Identifiable {
    let id = UUID()
    let lName : String
    let initials : String
}

struct RecipientsRow: View {
    var recipients: Recipients
    
    var body: some View {
        HStack {
            VStack {
                Text(recipients.initials)
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding(10)
                    .background(cynGreen)
                    .clipShape(Circle())
                
                Text(recipients.lName)
                    .font(.custom("Avenir", size: 14))
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .scaledToFill()
                    .minimumScaleFactor(0.5)
                
            }
            .padding(2)
            .listRowBackground(cynWhite) // list background colour
            .edgesIgnoringSafeArea(.all)
        }
    }
}
