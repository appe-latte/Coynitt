//
//  RecipientsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-21.
//

import SwiftUI

struct RecipientsView: View {
    @State var recipientfirstName : String = ""
    @State var recipientLastName : String = ""
    
    @State private var recipients: [Recipient] = []
    @State private var isAddingRecipient = false
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                cynOlive
                    .ignoresSafeArea()
                
                VStack {
                    Rectangle()
                        .fill(cynWhite)
                        .cornerRadius(45, corners: [.bottomRight])
                        .frame(width: screenWidth, height: 110)
                        .overlay(
                            VStack {
                                HStack(spacing: 25) {
                                    // MARK: "Add New Recipient" button
                                    VStack {
                                        Button(action: {
                                            isAddingRecipient.toggle()
                                        }, label: {
                                            Image("add")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(cynWhite)
                                        })
                                        .frame(width: 50, height: 50)
                                        .background(cynOrange)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        VStack {
                                            Text("Add New")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                            
                                            Text("Recipient")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                        }
                                        .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    
                                    // MARK: "Delete Recipient" button
                                    VStack {
                                        Button(action: {
                                            isAddingRecipient.toggle()
                                        }, label: {
                                            Image("add")
                                                .resizable()
                                                .frame(width: 25, height: 25)
                                                .foregroundColor(cynWhite)
                                        })
                                        .frame(width: 50, height: 50)
                                        .background(cynLightGreen)
                                        .clipShape(RoundedRectangle(cornerRadius: 15))
                                        .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                        .overlay(RoundedRectangle(cornerRadius: 15).stroke(cynWhite, lineWidth: 1))
                                        
                                        VStack {
                                            Text("Delete")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                            
                                            Text("Recipient")
                                                .font(.system(size: 8))
                                                .foregroundColor(cynBlack)
                                                .textCase(.uppercase)
                                        }
                                        .padding(.vertical, 2)
                                    }
                                    .padding(.bottom, 10)
                                    
                                    Spacer()
                                }
                                .padding(.horizontal, 20)
                            }
                        )
                    
                    // MARK: List of recipients
                    Group {
                        if recipients.isEmpty {
                            Text("+ Add new recipient")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(uiColor: .lightGray))
                                .textCase(.uppercase)
                                .padding(.top, 250)
                        } else {
                            List {
                                ForEach(recipients) { recipient in
                                    HStack(spacing: 10) {
                                        Circle()
                                            .frame(width: 40, height: 40)
                                            .foregroundColor(cynOlive)
                                            .shadow(color: cynBlack, radius: 0.1, x: 2, y: 2)
                                            .overlay(
                                                HStack {
                                                    Text(recipient.firstInitial)
                                                        .font(.headline)
                                                        .fontWeight(.heavy)
                                                        .foregroundColor(cynWhite)
                                                        .textCase(.uppercase)
                                                    
                                                    Text(recipient.secondInitial)
                                                        .font(.headline)
                                                        .fontWeight(.heavy)
                                                        .foregroundColor(cynWhite)
                                                        .textCase(.uppercase)
                                                }
                                                    .padding(5)
                                            )
                                        
                                        // MARK: Recipient First + Last Name
                                        Text(recipient.recipientFirstName)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
                                        
                                        Text(recipient.recipientLastName)
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(cynBlack)
                                            .textCase(.uppercase)
                                    }
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                //                .padding(.top, -100) // <--- removes white space above form from Navigation view
                
                Spacer()
            }
        }
        .accentColor(cynWhite)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing){
                // MARK: Notifications Button
                Button(action: {
                    //
                }, label: {
                    VStack {
                        Image("alert")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(cynBlack)
                            .clipShape(Circle())
                        
                        Text("Alerts")
                            .font(.system(size: 8))
                            .foregroundColor(cynBlack)
                            .textCase(.uppercase)
                            .kerning(2)
                    }
                })
            }
        }
        .sheet(isPresented: $isAddingRecipient) {
            ZStack {
                cynOlive
                
                NewRecipientView(recipients: $recipients)
            }
            .ignoresSafeArea()
            .presentationDetents([.large, .fraction(0.7)])
        }
        .scrollContentBackground(.hidden)
    }
}

// MARK: Extension - for grabbing first letter of First and Last name for the graphic
extension Recipient {
    var firstInitial: String {
        return String(recipientFirstName.prefix(1))
    }
    
    var secondInitial: String {
        return String(recipientLastName.prefix(1))
    }
}
