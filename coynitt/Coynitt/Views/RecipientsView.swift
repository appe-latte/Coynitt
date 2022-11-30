//
//  RecipientsView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-21.
//

import SwiftUI

struct RecipientsView: View {
    var body: some View {
        NavigationView {
            ZStack {
                cynWhite
                VStack {
                    Rectangle()
                        .fill(Color(red: 92 / 255, green: 181 / 255, blue: 184 / 255))
                        .cornerRadius(15, corners: [.bottomRight])
                        .frame(width: UIScreen.main.bounds.width, height: 120)
                        .edgesIgnoringSafeArea(.all)
                    
                    Text("Recipients go here....")
                        .padding(.top, 250)
                    
                    Spacer()
                    
                }
                .padding(.top, -100) // <--- removes white space above form from Navigation view
                
                Spacer()
            }
            .accentColor(cynGreen)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Recipients")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(cynWhite)
                        .textCase(.uppercase)
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button(action: {
                        
                    }, label: {
                        VStack {
                            Image("add")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(cynWhite)
                                .clipShape(Circle())
                            
                            Text("Add")
                                .font(.system(size: 10))
                                .foregroundColor(cynWhite)
                        }
                    })
                }
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

