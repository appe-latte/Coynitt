//
//  PaymentsView.swift
//  Coyne
//
//  Created by Stanford L. Khumalo on 11/03/2022.
//

import SwiftUI

struct PaymentsView: View {
    @State var accBalance : Double = 14198.18
    
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
                            Text("Pay Individual")
                                .font(.system(size: 16))
                                .bold()
                        }
                        
                        // MARK: Pay an individual
                        NavigationLink(destination: MainView()){
                            Text("Transfer to another Coyne Account")
                                .font(.system(size: 16))
                                .bold()
                        }
                        
                        // MARK: Pay an individual
                        NavigationLink(destination: MainView()){
                            Text("Request Money")
                                .font(.system(size: 16))
                                .bold()
                            
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
            }
        }
    }
}


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
            }
            .padding(2)
            .listRowBackground(cynWhite) // list background colour
            .edgesIgnoringSafeArea(.all)
        }
    }
}
